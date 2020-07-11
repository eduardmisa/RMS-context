from rest_framework import viewsets, status
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.decorators import action
from django.db.models import F, Q, Sum
import copy
from application_layer.management.views import CrudViewSet
from entities import models
from .serializers import *
from .filtersets import *


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
