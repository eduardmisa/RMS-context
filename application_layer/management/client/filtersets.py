from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


class ClientFilterSet(filters.FilterSet):
    class Meta:
        model = models.Client
        fields = ('__all__')
