from rest_framework import serializers
from entities import models
from application_layer.management.group.serializers import *


'''
USERS SERIALIZERS
'''
class UserListSerializer(serializers.ModelSerializer):
    groups = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.User
        fields = [
            'code',
            'username',
            'email',
            'firstname',
            'middlename',
            'lastname',
            'birthdate',
            'is_active',
            'is_superuser',
            'groups']

class UserRetrieveSerializer(serializers.ModelSerializer):
    groups = GroupListSerializer(many=True)
    class Meta:
        model = models.User
        fields = [
            'code',
            'username',
            'email',
            'firstname',
            'middlename',
            'lastname',
            'birthdate',
            'is_active',
            'is_superuser',
            'groups']

class UserCreateSerializer(serializers.ModelSerializer):
    groups = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Group.objects)
    class Meta:
        model = models.User
        fields = [
            'username',
            'password',
            'email',
            'firstname',
            'middlename',
            'lastname',
            'birthdate',
            'is_active',
            'is_superuser',
            'groups']
    def validate_groups (self, val):
        is_superuser = self.initial_data.get('is_superuser')
        if (type(is_superuser) == str and is_superuser.lower() == 'true') or (type(is_superuser) == bool and is_superuser == True):
            return []

        return val

class UserUpdateSerializer(serializers.ModelSerializer):
    groups = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Group.objects)
    class Meta:
        model = models.User
        fields = [
            'username',
            'email',
            'firstname',
            'middlename',
            'lastname',
            'birthdate',
            'is_active',
            'is_superuser',
            'groups']
    def validate_groups (self, val):
        is_superuser = self.initial_data.get('is_superuser')
        if (type(is_superuser) == str and is_superuser.lower() == 'true') or (type(is_superuser) == bool and is_superuser == True):
            return []

        return val

class UserDeleteSerializer(serializers.ModelSerializer):
    groups = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.User
        fields = [
            'code',
            'username',
            'email',
            'firstname',
            'middlename',
            'lastname',
            'birthdate',
            'is_active',
            'is_superuser',
            'groups']
