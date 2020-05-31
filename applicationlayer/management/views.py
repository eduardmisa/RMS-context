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
from datalayer import application_datalayer

from applicationlayer.security.serializers import CurrentUserContextApplicationApiSerializer
from django.db.models import F, Q, Sum

# Create your views here.

class ApplicationViewSet(viewsets.ModelViewSet):
    queryset = models.Application.objects.all().order_by('-id')
    serializer_class = ApplicationSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ApplicationFilterSet

    @action(detail=False,
            methods=['post'],
            url_path='easy-create',
            name="Batch operation for creating App")
    def EasyCreate(self, request, pk=None):
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
    def EasyView(self, request, pk=None):
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





class RoutesFrontViewSet(viewsets.ModelViewSet):
    queryset = models.RoutesFront.objects.all().order_by('-id')
    serializer_class = RoutesFrontSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RoutesFrontFilterSet


class RoutesBackViewSet(viewsets.ModelViewSet):
    queryset = models.RoutesBack.objects.all().order_by('-id')
    serializer_class = RoutesBackSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RoutesBackFilterSet


class PermissionViewSet(viewsets.ModelViewSet):
    queryset = models.Permission.objects.all().order_by('-id')
    serializer_class = PermissionSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = PermissionFilterSet


class ModuleViewSet(viewsets.ModelViewSet):
    queryset = models.Module.objects.all().order_by('-id')
    serializer_class = ModuleSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ModuleFilterSet


class GroupViewSet(viewsets.ModelViewSet):
    queryset = models.Group.objects.all().order_by('-id')
    serializer_class = GroupSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = GroupFilterSet


class UserViewSet(viewsets.ModelViewSet):
    queryset = models.User.objects.all().order_by('-id')
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
    queryset = models.Client.objects.all().order_by('-id')
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

