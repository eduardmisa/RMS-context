from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


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
