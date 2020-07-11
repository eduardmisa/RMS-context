from rest_framework import serializers
from entities import models
from application_layer.management.service.serializers import *


class ClientListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField()
    services = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.Client
        fields = [
            'code',
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']

class ClientRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    services = ServiceListSerializer(many=True)
    class Meta:
        model = models.Client
        fields = [
            'code',
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']

class ClientCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    services = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.Client
        fields = [
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']

class ClientUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    services = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.Client
        fields = [
            'name',
            'description',
            'valid_until',
            'service',
            'services']

class ClientDeleteSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField()
    services = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.Client
        fields = [
            'code',
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']
