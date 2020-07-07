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
from datalayer import application_datalayer
from applicationlayer.security.serializers import CurrentUserContextApplicationApiSerializer
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



class ApplicationViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Application.objects.all().order_by('-id')
    list_serializer = ApplicationListSerializer
    retrieve_serializer = ApplicationRetrieveSerializer
    create_serializer = ApplicationCreateSerializer
    update_serializer = ApplicationUpdateSerializer
    delete_serializer = ApplicationDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ApplicationFilterSet

    @action(detail=False,
            methods=['post'],
            url_path='easy-create',
            name="Batch operation for creating App")
    def easy_create(self, request, pk=None):
        self.serializer_class = ApplicationEasyCreateSerializer
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            success, msg = application_datalayer.easy_create(
                copy.deepcopy(serializer.validated_data),
                request.user)

            if success:
                headers = self.get_success_headers(serializer.data)
                return Response({ "transaction": msg },
                                status=status.HTTP_201_CREATED,
                                headers=headers)
            else:
                return Response(msg, status=400)
        else:
            serializer.is_valid(raise_exception=True)

    @action(detail=True,
            methods=['get'],
            url_path='easy-view',
            name="Full App information")
    def easy_view(self, request, pk=None):
        self.serializer_class = ApplicationEasyCreateSerializer
        existing_app = self.get_object()

        app = {}
        app['guid'] = existing_app.code
        app['name'] = existing_app.name
        app['description'] = existing_app.description
        app['base_url'] = existing_app.base_url

        app['routes_fronts'] = existing_app.routes_front.values('id', 'url')
        app['routes_backs'] = existing_app.routes_back.values('id', 'url', 'method')

        perm_fronts = models.Permission.objects.filter(route_front__application__id=existing_app.id).values('id', 'name', 'description')
        perm_backs = models.Permission.objects.filter(route_back__application__id=existing_app.id).values('id', 'name', 'description')
        perm_master = perm_fronts.union(perm_backs)
        for item in perm_master:
            item['routes_fronts'] = models.RoutesFront.objects.filter(permissions__id=item['id']).values('id', 'url')
            item['routes_backs'] = models.RoutesBack.objects.filter(permissions__id=item['id']).values('id', 'url', 'method')
        app['permissions'] = perm_master

        modules = models.Module.objects.filter(route_front__application__id=existing_app.id)
        modules = modules.union(models.Module.objects.filter(sub_modules__route_front__application__id=existing_app.id))
        modules = modules.values('id', 'name', 'description', 'icon', 'parent_id')
        for item in modules:
            item['routes_front'] = models.RoutesFront.objects.filter(modules__id=item['id']).values('id', 'url')
        app['modules'] = modules

        # instance = self.get_object()
        # serializer = self.get_serializer(app)
        return Response(app)


class RoutesFrontViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.RoutesFront.objects.all().order_by('-id')
    list_serializer = RoutesFrontListSerializer
    retrieve_serializer = RoutesFrontRetrieveSerializer
    create_serializer = RoutesFrontCreateSerializer
    update_serializer = RoutesFrontUpdateSerializer
    delete_serializer = RoutesFrontDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RoutesFrontFilterSet


class RoutesBackViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.RoutesBack.objects.all().order_by('-id')
    list_serializer = RoutesBackListSerializer
    retrieve_serializer = RoutesBackRetrieveSerializer
    create_serializer = RoutesBackCreateSerializer
    update_serializer = RoutesBackUpdateSerializer
    delete_serializer = RoutesBackDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RoutesBackFilterSet


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

