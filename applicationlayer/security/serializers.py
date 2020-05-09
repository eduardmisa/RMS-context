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
    parent_module_name = serializers.CharField(max_length=255, required=False)
    parent_module_code = serializers.CharField(max_length=255, required=False)
    parent_module_front_icon = serializers.CharField(max_length=255, required=False)
    parent_module_front_url = serializers.CharField(max_length=255, required=False)

    module_code = serializers.CharField(max_length=255)
    module_name = serializers.CharField(max_length=255)
    module_front_icon = serializers.CharField(max_length=255, required=False)
    module_front_url = serializers.CharField(max_length=255, required=False)
    permission = serializers.CharField(max_length=255)
    method = serializers.CharField(max_length=255)
    url = serializers.CharField(max_length=255)





# Current user context application MODULES
class CurrentUserContextModulesSerializer(serializers.Serializer):
    code = serializers.CharField(max_length=255)
    name = serializers.CharField(max_length=255)
    icon = serializers.CharField(max_length=255, required=False)
    url = serializers.CharField(max_length=255, required=False)
    parent = serializers.CharField(max_length=255, required=False)


# Current user context application WEB
class CurrentUserContextApplicationWebSerializer(serializers.Serializer):
    code = serializers.CharField(max_length=255)
    url = serializers.CharField(max_length=255, required=False)


# Current user context application API
class CurrentUserContextApplicationApiSerializer(serializers.Serializer):
    code = serializers.CharField(max_length=255)
    method = serializers.CharField(max_length=255)
    url = serializers.CharField(max_length=255)


# Current user context APPLICATION
class CurrentUserContextApplicationSerializer(serializers.Serializer):
    client_id = serializers.IntegerField()
    name = serializers.CharField(max_length=255)
    description = serializers.CharField(max_length=255)
    is_administrator = serializers.BooleanField()
    user_modules = CurrentUserContextModulesSerializer(many=True)
    web_urls = CurrentUserContextApplicationWebSerializer(many=True)
    api_urls = CurrentUserContextApplicationApiSerializer(many=True)


# Current user context final response
class CurrentUserContextSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=255)
    email = serializers.CharField(max_length=255)
    firstname = serializers.CharField(max_length=255)
    middlename = serializers.CharField(max_length=255)
    lastname = serializers.CharField(max_length=255)
    birthdate = serializers.CharField(max_length=255)
    group = serializers.ListField()
    is_superuser = serializers.BooleanField()
    application = CurrentUserContextApplicationSerializer()
