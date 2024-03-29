from rest_framework import serializers
from entities import models
from application_layer.management.service.serializers import *
from application_layer.management.service_route.serializers import *


class PermissionListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    service_routes = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Permission
        fields = [
            'code',
            'name',
            'description',
            'service',
            'service_routes']

class PermissionRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer(
        many=False,
        read_only=True)
    service_routes = ServiceRouteListSerializer(
        many=True,
        read_only=True)
    class Meta:
        model = models.Permission
        fields = [
            'code',
            'name',
            'description',
            'service',
            'service_routes']

class PermissionCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        many=False,
        slug_field='code',
        queryset=models.Service.objects)
    service_routes = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.ServiceRoute.objects)
    class Meta:
        model = models.Permission
        fields = [
            'name',
            'description',
            'service',
            'service_routes']

class PermissionUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        many=False,
        slug_field='code',
        queryset=models.Service.objects)
    service_routes = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.ServiceRoute.objects)
    class Meta:
        model = models.Permission
        fields = [
            'name',
            'description',
            'service',
            'service_routes']

class PermissionDeleteSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    service_routes = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Permission
        fields = [
            'code',
            'name',
            'description',
            'service',
            'service_routes']
