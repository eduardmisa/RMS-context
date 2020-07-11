from django_filters import rest_framework as filters
from django.db.models import Count
from entities import models
from django.db.models import Q


class PermissionFilterSet(filters.FilterSet):
    service = filters.ModelMultipleChoiceFilter(
        queryset=models.Service.objects.all(),
        field_name="service__code",
        to_field_name="code",
    )

    class Meta:
        model = models.Permission
        fields = ('__all__')
