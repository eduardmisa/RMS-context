from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


class ApplicationFilterSet(filters.FilterSet):
    groups = filters.CharFilter(field_name='groups', method='filter_application_by_groups')
    def filter_application_by_groups(self, queryset, name, value):
        ids = value.split(',')
        return queryset.filter(groups__id__in=ids)
    class Meta:
        model = models.Application
        fields = ('__all__')

class RoutesFrontFilterSet(filters.FilterSet):
    class Meta:
        model = models.RoutesFront
        fields = ('__all__')

class RoutesBackFilterSet(filters.FilterSet):
    class Meta:
        model = models.RoutesBack
        fields = ('__all__')

class PermissionFilterSet(filters.FilterSet):
    application = filters.CharFilter(field_name='application', method='filter_application')
    def filter_application(self, queryset, name, value):
        permissions_ids =  queryset.filter(
            route_front__application__id=value
        ).values('id')
        permissions_ids = list(set(map(lambda row: row['id'], list(permissions_ids))))
        return queryset.filter(id__in=permissions_ids)

    class Meta:
        model = models.Permission
        fields = ('__all__')

class ModuleFilterSet(filters.FilterSet):
    class Meta:
        model = models.Module
        fields = ('__all__')

class GroupFilterSet(filters.FilterSet):
    applications = filters.CharFilter(field_name='applications', method='filter_application')
    def filter_application(self, queryset, name, value):
        ids = value.split(',')
        return queryset.filter(application__in=ids)
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
