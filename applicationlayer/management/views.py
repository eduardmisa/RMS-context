from rest_framework import viewsets, status
from rest_framework.response import Response
from django_filters import rest_framework as filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter

from django.shortcuts import render
from entities import models
from .serializers import *
import copy
from django.utils.crypto import get_random_string
from middleware.security import AllowAny


# Create your views here.

class ApplicationViewSet(viewsets.ModelViewSet):
    queryset = models.Application.objects.all().order_by('-created')
    serializer_class = ApplicationSerializer


class ModuleViewSet(viewsets.ModelViewSet):
    queryset = models.Module.objects.all().order_by('-created')
    serializer_class = ModuleSerializer


class EndpointViewSet(viewsets.ModelViewSet):
    queryset = models.Endpoint.objects.all().order_by('-created')
    serializer_class = EndpointSerializer


class GroupViewSet(viewsets.ModelViewSet):
    queryset = models.Group.objects.all().order_by('-created')
    serializer_class = GroupSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = models.User.objects.all().order_by('-created')
    serializer_class = UserSerializer

    # def list(self, request, *args, **kwargs):
    #     self.serializer_class = UserListSerializer
    #     return super(UserViewSet, self).list(request, *args, **kwargs)

    # def retrieve(self, request, *args, **kwargs):
    #     self.serializer_class = UserRetreiveSerializer
    #     return super(UserViewSet, self).retrieve(request, *args, **kwargs)

    # def update(self, request, *args, **kwargs):
    #     self.serializer_class = UserUpdateSerializer
    #     super(UserViewSet, self).update(request, *args, **kwargs)
    #     instance = models.User.objects.get(id=kwargs['pk'])
    #     serializer = UserRetreiveSerializer(instance)
    #     return Response(serializer.data)

    # def create(self, request, *args, **kwargs):
    #     self.serializer_class = UserCreateSerializer
    #     res = super(UserViewSet, self).create(request, *args, **kwargs)

    #     instance = models.User.objects.get(id=res.data['id'])
    #     serializer = UserRetreiveSerializer(instance)
    #     return Response(serializer.data,
    #                     status=status.HTTP_201_CREATED,)


class ClientViewSet(viewsets.ModelViewSet):
    queryset = models.Client.objects.all().order_by('-created')
    serializer_class = ClientSerializer

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
