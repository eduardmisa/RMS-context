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
    def validate_parent (self, val):
        if val:
            existing_app = models.Application.objects.filter(id=self.initial_data.get('application')).first() 
            if not existing_app:
                raise serializers.ValidationError('Application does not exists')

            if val.application.id != existing_app.id:
                raise serializers.ValidationError('Parent application does not match this application')

        return val

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

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
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

    def validate_groups (self, val):
        is_superuser = self.initial_data.get('is_superuser')
        if (type(is_superuser) == str and is_superuser.lower() == 'true') or (type(is_superuser) == bool and is_superuser == True):
            return []

        return val

class UserUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        exclude = ['created', 'modified', 'createdby', 'modifiedby', 'code', 'password_salt', 'password']

    def validate_groups (self, val):
        is_superuser = self.initial_data.get('is_superuser')
        if (type(is_superuser) == str and is_superuser.lower() == 'true') or (type(is_superuser) == bool and is_superuser == True):
            return []

        return val


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