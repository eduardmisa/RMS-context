from rest_framework import serializers
from entities import models
from application_layer.management.service.serializers import *


class ServiceRouteListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField()
    class Meta:
        model = models.ServiceRoute
        fields = [
            'code',
            'method',
            'url',
            'service']

class ServiceRouteRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    class Meta:
        model = models.ServiceRoute
        fields = [
            'code',
            'method',
            'url',
            'service']

class ServiceRouteCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.ServiceRoute
        fields = [
            'method',
            'url',
            'service']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.ServiceRoute.objects.all(),
                fields = (
                    'service',
                    'method',
                    'url'),
                message = "Service Method with this URL already exists"
            )
        ]

class ServiceRouteUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.ServiceRoute
        fields = [
            'method',
            'url',
            'service']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.ServiceRoute.objects.all(),
                fields = (
                    'service',
                    'method',
                    'url'),
                message = "Service Method with this URL already exists"
            )
        ]

class ServiceRouteDeleteSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    class Meta:
        model = models.ServiceRoute
        fields = [
            'code',
            'method',
            'url',
            'service']
