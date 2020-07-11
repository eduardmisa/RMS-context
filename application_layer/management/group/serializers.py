from rest_framework import serializers
from entities import models
from application_layer.management.service.serializers import *
from application_layer.management.permission.serializers import *
from application_layer.management.module.serializers import *


class GroupListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    permissions = serializers.StringRelatedField(
        many=True,
        read_only=True)
    modules = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Group
        fields = [
            'code',
            'name',
            'description',
            'has_all_access',
            'service',
            'permissions',
            'modules']

class GroupRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    permissions = PermissionListSerializer(
        many=True,
        read_only=True)
    modules = ModuleListSerializer(
        many=True,
        read_only=True)
    class Meta:
        model = models.Group
        fields = [
            'code',
            'name',
            'description',
            'has_all_access',
            'service',
            'permissions',
            'modules']

class GroupCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    permissions = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Permission.objects)
    modules = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Module.objects) 
    class Meta:
        model = models.Group
        fields = [
            'name',
            'description',
            'has_all_access',
            'service',
            'permissions',
            'modules']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Group.objects.all(),
                fields = (
                    'name',
                    'service'),
                message = "This group already existis in this Service"
            )
        ]

    def validate_permissions (self, val):
        service = self.initial_data.get('service')
        has_all_access = self.initial_data.get('has_all_access')
        permissions = val

        existing_service = models.Service.objects.filter(
            code=service).first()

        if not existing_service:
            raise serializers.ValidationError('Service not found')

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
            return []

        for item in permissions:
            for sritem in item.service_routes.all():
                if sritem.service.id != existing_service.id:
                    raise serializers.ValidationError(
                        'Some items in permissions did not match the submited Service')

        return val

    def validate_modules (self, val):
        service = self.initial_data.get('service')
        has_all_access = self.initial_data.get('has_all_access')
        modules = val

        existing_service = models.Service.objects.filter(
            code=service).first()

        if not existing_service:
            raise serializers.ValidationError('Service not found')

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
            return []

        for item in modules:
            if item.service.id != existing_service.id:
                raise serializers.ValidationError(
                    'Some items in modules did not match the submited Service')

        return val

class GroupUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    permissions = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Permission.objects)
    modules = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Module.objects)   
    class Meta:
        model = models.Group
        fields = [
            'name',
            'description',
            'has_all_access',
            'service',
            'permissions',
            'modules']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Group.objects.all(),
                fields = (
                    'name',
                    'service'),
                message = "This group already existis in this Service"
            )
        ]

    def validate_permissions (self, val):
        service = self.initial_data.get('service')
        has_all_access = self.initial_data.get('has_all_access')
        permissions = val

        existing_service = models.Service.objects.filter(
            code=service).first()

        if not existing_service:
            raise serializers.ValidationError('Service not found')

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
            return []

        for item in permissions:
            for sritem in item.service_routes.all():
                if sritem.service.id != existing_service.id:
                    raise serializers.ValidationError(
                        'Some items in permissions did not match the submited Service')

        return val

    def validate_modules (self, val):
        service = self.initial_data.get('service')
        has_all_access = self.initial_data.get('has_all_access')
        modules = val

        existing_service = models.Service.objects.filter(
            code=service).first()

        if not existing_service:
            raise serializers.ValidationError('Service not found')

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
            return []

        for item in modules:
            if item.service.id != existing_service.id:
                raise serializers.ValidationError(
                    'Some items in modules did not match the submited Service')

        return val

class GroupDeleteSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    permissions = serializers.StringRelatedField(
        many=True,
        read_only=True)
    modules = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Group
        fields = [
            'code',
            'name',
            'description',
            'has_all_access',
            'service',
            'permissions',
            'modules']
