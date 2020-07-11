from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


class ServiceFilterSet(filters.FilterSet):
    groups = filters.CharFilter(
        field_name='groups',
        method='filter_service_by_groups')
    def filter_service_by_groups(
        self,
        queryset,
        name,
        value):
        codes = value.split(',')
        return queryset.filter(
            groups__code__in=codes)
    class Meta:
        model = models.Service
        fields = ('__all__')

class ServiceRouteFilterSet(filters.FilterSet):
    service = filters.CharFilter(
        field_name='service',
        method='filter_service_soute')
    def filter_service_soute(
        self,
        queryset,
        name,
        value):
        return queryset.filter(
            service__code=value
        )
    class Meta:
        model = models.ServiceRoute
        fields = ('__all__')

class PermissionFilterSet(filters.FilterSet):
    service = filters.CharFilter(
        field_name='service',
        method='filter_application')
    def filter_application(
        self,
        queryset,
        name,
        value):
        permissions_codes = queryset.filter(
            service_route__service__code=value
        ).values('code')
        permissions_codes = list(
            set(map(lambda row: row['code'],
            list(permissions_codes))))
        return queryset.filter(
            code__in=permissions_codes)

    class Meta:
        model = models.Permission
        fields = ('__all__')

class ModuleFilterSet(filters.FilterSet):
    class Meta:
        model = models.Module
        fields = ('__all__')

class GroupFilterSet(filters.FilterSet):
    services = filters.CharFilter(
        field_name='services',
        method='filter_application')
    def filter_application(
        self,
        queryset,
        name,
        value):
        ids = value.split(',')
        return queryset.filter(
            service__code__in=ids)
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
