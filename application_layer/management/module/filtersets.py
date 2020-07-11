from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q
from entities import models


class ModuleFilterSet(filters.FilterSet):
    service = filters.ModelMultipleChoiceFilter(
        queryset=models.Service.objects.all(),
        field_name="service__code",
        to_field_name="code",
    )
    route = filters.ModelMultipleChoiceFilter(
        queryset=models.ServiceRoute.objects.all(),
        field_name="route__code",
        to_field_name="code",
    )
    class Meta:
        model = models.Module
        fields = ('__all__')
