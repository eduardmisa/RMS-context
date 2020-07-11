from rest_framework import viewsets, status
from rest_framework.response import Response
from django_filters import rest_framework as filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from django.shortcuts import render
from rest_framework.decorators import action
from entities import models
from .serializers import *
from .filtersets import *
from django.utils.crypto import get_random_string
from middleware.security import AllowAny
from data_layer import application_data_layer
from application_layer.security.serializers import CurrentUserContextApplicationApiSerializer
from django.db.models import F, Q, Sum
import copy


class CrudViewSet(viewsets.ModelViewSet):
    list_serializer = None
    retrieve_serializer = None
    create_serializer = None
    update_serializer = None
    delete_serializer = None

    @action(detail=False,
            methods=['get'],
            url_path='count-all',
            name="Retrieves current total record count")
    def count_all(self, request, pk=None):
        queryset = self.filter_queryset(self.get_queryset())
        return Response({"count":queryset.count()})

    def list(self, request, *args, **kwargs):
        self.serializer_class = self.list_serializer
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        self.serializer_class = self.retrieve_serializer
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        self.serializer_class = self.create_serializer
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        self.serializer_class = self.update_serializer
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        self.serializer_class = self.delete_serializer
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)



class ServiceViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Service.objects.all().order_by('-id')
    list_serializer = ServiceListSerializer
    retrieve_serializer = ServiceRetrieveSerializer
    create_serializer = ServiceCreateSerializer
    update_serializer = ServiceUpdateSerializer
    delete_serializer = ServiceDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ServiceFilterSet

class ServiceRouteViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.ServiceRoute.objects.all().order_by('-id')
    list_serializer = ServiceRouteListSerializer
    retrieve_serializer = ServiceRouteRetrieveSerializer
    create_serializer = ServiceRouteCreateSerializer
    update_serializer = ServiceRouteUpdateSerializer
    delete_serializer = ServiceRouteDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ServiceRouteFilterSet

class PermissionViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Permission.objects.all().order_by('-id')
    list_serializer = PermissionListSerializer
    retrieve_serializer = PermissionRetrieveSerializer
    create_serializer = PermissionCreateSerializer
    update_serializer = PermissionUpdateSerializer
    delete_serializer = PermissionDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = PermissionFilterSet

class ModuleViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Module.objects.all().order_by('-id')
    list_serializer = ModuleListSerializer
    retrieve_serializer = ModuleRetrieveSerializer
    create_serializer = ModuleCreateSerializer
    update_serializer = ModuleUpdateSerializer
    delete_serializer = ModuleDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ModuleFilterSet

class GroupViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Group.objects.all().order_by('-id')
    list_serializer = GroupListSerializer
    retrieve_serializer = GroupRetrieveSerializer
    create_serializer = GroupCreateSerializer
    update_serializer = GroupUpdateSerializer
    delete_serializer = GroupDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = GroupFilterSet

class UserViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.User.objects.all().order_by('-id')
    list_serializer = UserListSerializer
    retrieve_serializer = UserRetrieveSerializer
    create_serializer = UserCreateSerializer
    update_serializer = UserUpdateSerializer
    delete_serializer = UserDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = UserFilterSet

class ClientViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Client.objects.all().order_by('-id')
    list_serializer = ClientListSerializer
    retrieve_serializer = ClientRetrieveSerializer
    create_serializer = ClientCreateSerializer
    update_serializer = ClientUpdateSerializer
    delete_serializer = ClientDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ClientFilterSet

    def create(self, request, *args, **kwargs):
        self.serializer_class = self.create_serializer

        data = copy.deepcopy(request.data)

        data['clid'] = get_random_string(length=32)
        data['clsc'] = get_random_string(length=32)
        
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data,
                        status=status.HTTP_201_CREATED,
                        headers=headers)

    @action(detail=True,
            methods=['get'],
            url_path='overall-access',
            name="Client service over all access")
    def OverallAccess(self, request, pk=None):
        self.serializer_class = CurrentUserContextApplicationApiSerializer
        self.filterset_class = RoutesBackFilterSet

        permission_query = models.RoutesBack.objects

        self.queryset = permission_query.filter(
                                application__clients_external_applications__id=pk,
                            ).union(
                                    permission_query.filter(
                                            application__clients__id=pk,
                                        )
                                )
        return super(ClientViewSet, self).list(request)
