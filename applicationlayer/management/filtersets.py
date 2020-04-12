from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


class ApplicationFilterSet(filters.FilterSet):
    class Meta:
        model = models.Application
        fields = ('__all__')


class ModuleFilterSet(filters.FilterSet):
    class Meta:
        model = models.Module
        fields = ('__all__')


class EndpointFilterSet(filters.FilterSet):
    class Meta:
        model = models.Endpoint
        fields = ('__all__')


class GroupFilterSet(filters.FilterSet):
    class Meta:
        model = models.Group
        fields = ('__all__')


class UserFilterSet(filters.FilterSet):
    class Meta:
        model = models.User
        fields = ('__all__')


class ClientFilterSet(filters.FilterSet):
    class Meta:
        model = models.Client
        fields = ('__all__')
