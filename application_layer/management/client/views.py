from rest_framework import viewsets, status
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.decorators import action
from django.db.models import F, Q, Sum
from django.utils.crypto import get_random_string
import copy
from application_layer.management.views import CrudViewSet
from entities import models
from .serializers import *
from .filtersets import *



class ClientViewSet(CrudViewSet):
    lookup_field = 'code'
    queryset = models.Client.objects.all().order_by('-id')
    list_serializer = ClientListSerializer
    retrieve_serializer = ClientRetrieveSerializer
    create_serializer = ClientCreateSerializer
    update_serializer = ClientUpdateSerializer
    delete_serializer = ClientDeleteSerializer
    filter_backends = (DjangoFilterBackend,)
    filterset_class = ClientFilterSet

    def create(self, request, *args, **kwargs):
        self.serializer_class = self.create_serializer

        data = copy.deepcopy(request.data)

        data['clid'] = get_random_string(length=32)
        data['clsc'] = get_random_string(length=32)
        
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data,
                        status=status.HTTP_201_CREATED,
                        headers=headers)

    @action(detail=True,
            methods=['get'],
            url_path='overall-access',
            name="Client service over all access")
    def OverallAccess(self, request, pk=None):
        self.serializer_class = CurrentUserContextApplicationApiSerializer
        self.filterset_class = RoutesBackFilterSet

        permission_query = models.RoutesBack.objects

        self.queryset = permission_query.filter(
                                application__clients_external_applications__id=pk,
                            ).union(
                                    permission_query.filter(
                                            application__clients__id=pk,
                                        )
                                )
        return super(ClientViewSet, self).list(request)
