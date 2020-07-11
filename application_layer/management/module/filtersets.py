from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


class ModuleFilterSet(filters.FilterSet):
    class Meta:
        model = models.Module
        fields = ('__all__')
