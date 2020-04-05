from rest_framework import serializers
from entities import models
from datetime import datetime

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=15)
    password = serializers.CharField(max_length=50)
    client_id = serializers.CharField(max_length=255, required=False)
    client_secret = serializers.CharField(max_length=255, required=False)
    grant_type = serializers.CharField(max_length=255, required=False)
    scope = serializers.CharField(max_length=255, required=False)


class CurrentUserContextPermissionsSerializer(serializers.Serializer):
    module = serializers.CharField(max_length=255)
    permission = serializers.CharField(max_length=255)
    method = serializers.CharField(max_length=255)
    url = serializers.CharField(max_length=255)

class CurrentUserContextApplicationSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=255)
    description = serializers.CharField(max_length=255)
    permissions = CurrentUserContextPermissionsSerializer(many=True)
    external_permissions = CurrentUserContextPermissionsSerializer(many=True)

class CurrentUserContextSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=255)
    email = serializers.CharField(max_length=255)
    firstname = serializers.CharField(max_length=255)
    middlename = serializers.CharField(max_length=255)
    lastname = serializers.CharField(max_length=255)
    birthdate = serializers.CharField(max_length=255)
    is_administrator = serializers.BooleanField()
    group = serializers.ListField()
    application = CurrentUserContextApplicationSerializer()
