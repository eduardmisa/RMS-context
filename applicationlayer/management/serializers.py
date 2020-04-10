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