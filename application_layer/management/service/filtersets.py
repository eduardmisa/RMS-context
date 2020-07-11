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
