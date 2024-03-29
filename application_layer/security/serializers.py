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


# Current user context final response
class CurrentUserSerializer(serializers.Serializer):
    token = serializers.CharField(max_length=255)
    username = serializers.CharField(max_length=255)
    email = serializers.CharField(max_length=255)
    firstname = serializers.CharField(max_length=255)
    middlename = serializers.CharField(max_length=255)
    lastname = serializers.CharField(max_length=255)
    birthdate = serializers.CharField(max_length=255)
    is_superuser = serializers.BooleanField()
    group = serializers.ListField()


class CurrentUserScopeSerializer(serializers.Serializer):
    token = serializers.CharField(max_length=255)
    service_routes = serializers.ListField()
