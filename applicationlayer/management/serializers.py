from rest_framework import serializers
from entities import models


class ApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )

class ModuleSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Module
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Module.objects.all(),
                fields = ('name', 'application'),
                message = "Name with this Application already exists"
            )
        ]

class EndpointSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Endpoint
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Endpoint.objects.all(),
                fields = ('method', 'url'),
                message = "Method with this URL already exists"
            )
        ]

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Group
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Group.objects.all(),
                fields = ('name', 'application'),
                message = "This group already existis in this application"
            )
        ]

    def validate_permissions (self, val):
        application = self.initial_data.get('application')
        has_all_access = self.initial_data.get('has_all_access')
        permissions = val

        existing_application = models.Application.objects.filter(id=application).first()

        if not existing_application:
            raise serializers.ValidationError('Application not found')

        if has_all_access:
            return []

        for item in permissions:
            if item.module.application != existing_application:
                raise serializers.ValidationError('Some items did not match the submited application')

        return val

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        exclude = ['password_salt']
        read_only_fields = ['createdby', 'modifiedby', 'code', 'password_salt']
        extra_kwargs = {
            'password': {'write_only': True},
        }

class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Client
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code', 'clid', 'clsc'
        )

class ClientCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Client
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )