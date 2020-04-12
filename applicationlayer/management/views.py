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
import copy
from django.utils.crypto import get_random_string
from middleware.security import AllowAny

from applicationlayer.security.serializers import CurrentUserContextPermissionsSerializer
from django.db.models import F, Q, Sum

# Create your views here.

class ApplicationViewSet(viewsets.ModelViewSet):
    queryset = models.Application.objects.all().order_by('-created')
    serializer_class = ApplicationSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ApplicationFilterSet


class ModuleViewSet(viewsets.ModelViewSet):
    queryset = models.Module.objects.all().order_by('-created')
    serializer_class = ModuleSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ModuleFilterSet


class EndpointViewSet(viewsets.ModelViewSet):
    queryset = models.Endpoint.objects.all().order_by('-created')
    serializer_class = EndpointSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = EndpointFilterSet


class GroupViewSet(viewsets.ModelViewSet):
    queryset = models.Group.objects.all().order_by('-created')
    serializer_class = GroupSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = GroupFilterSet


class UserViewSet(viewsets.ModelViewSet):
    queryset = models.User.objects.all().order_by('-created')
    serializer_class = UserSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = UserFilterSet

    def update(self, request, *args, **kwargs):
        self.serializer_class = UserUpdateSerializer
        super(UserViewSet, self).update(request, *args, **kwargs)
        instance = models.User.objects.get(id=kwargs['pk'])
        serializer = UserSerializer(instance)
        return Response(serializer.data)


class ClientViewSet(viewsets.ModelViewSet):
    queryset = models.Client.objects.all().order_by('-created')
    serializer_class = ClientSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ClientFilterSet

    def create(self, request, *args, **kwargs):
        self.serializer_class = ClientCreateSerializer

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
        self.serializer_class = CurrentUserContextPermissionsSerializer
        self.filterset_class = EndpointFilterSet
        
        permission_query = models.Endpoint.objects.values(
                'permission',
                'method',
                'url'
            ).annotate(
                module_code=F('module__code'),
                module_name=F('module__name'),
                app_id=F('module__application__id'),
            )

        self.queryset = permission_query.filter(
                                module__application__clients_external_applications__id=pk,
                            ).union(
                                    permission_query.filter(
                                            module__application__clients__id=pk,
                                        )
                                )
        return super(ClientViewSet, self).list(request)

