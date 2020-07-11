from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


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
