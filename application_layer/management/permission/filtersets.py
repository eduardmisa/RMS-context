from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


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
