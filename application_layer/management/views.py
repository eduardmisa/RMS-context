from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action

class CrudViewSet(viewsets.ModelViewSet):
    list_serializer = None
    retrieve_serializer = None
    create_serializer = None
    update_serializer = None
    delete_serializer = None

    @action(detail=False,
            methods=['get'],
            url_path='count-all',
            name="Retrieves current total record count")
    def count_all(self, request, pk=None):
        queryset = self.filter_queryset(self.get_queryset())
        return Response({"count":queryset.count()})

    def list(self, request, *args, **kwargs):
        self.serializer_class = self.list_serializer
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, *args, **kwargs):
        self.serializer_class = self.retrieve_serializer
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        self.serializer_class = self.create_serializer
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def update(self, request, *args, **kwargs):
        self.serializer_class = self.update_serializer
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)

    def destroy(self, request, *args, **kwargs):
        self.serializer_class = self.delete_serializer
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)
