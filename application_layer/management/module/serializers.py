from rest_framework import serializers
from entities import models
from application_layer.management.module.serializers import *
from application_layer.management.service.serializers import *


class ModuleListSerializer(serializers.ModelSerializer):
    parent = serializers.StringRelatedField()
    service = serializers.StringRelatedField()
    class Meta:
        model = models.Module
        fields = ['code',
                  'name',
                  'description',
                  'icon',
                  'parent',
                  'service']

class ModuleRetrieveSerializer(serializers.ModelSerializer):
    parent = ModuleListSerializer()
    service = ServiceListSerializer()
    class Meta:
        model = models.Module
        fields = ['code',
                  'name',
                  'description',
                  'icon',
                  'parent',
                  'service']

class ModuleCreateSerializer(serializers.ModelSerializer):
    parent = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Module.objects)
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.Module
        fields = [
            'name',
            'description',
            'icon',
            'parent',
            'service']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Module.objects.all(),
                fields = (
                    'name',
                    'parent',
                    'service'),
                message = "Name with this Service and Parent Already Exists"
            )
        ]

class ModuleUpdateSerializer(serializers.ModelSerializer):
    parent = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Module.objects)
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.Module
        fields = [
            'name',
            'description',
            'icon',
            'parent',
            'service']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Module.objects.all(),
                fields = (
                    'name',
                    'parent',
                    'service'),
                message = "Name with this Service and Parent Already Exists"
            )
        ]

class ModuleDeleteSerializer(serializers.ModelSerializer):
    parent = serializers.StringRelatedField()
    service = serializers.StringRelatedField()
    class Meta:
        model = models.Module
        fields = ['code',
                  'name',
                  'description',
                  'icon',
                  'parent',
                  'service']
