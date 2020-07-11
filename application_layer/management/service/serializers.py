from rest_framework import serializers
from entities import models


class ServiceListSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Service
        fields = [
            'code',
            'name',
            'description',
            'base_url']

class ServiceRetrieveSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Service
        fields = [
            'code',
            'name',
            'description',
            'base_url']

class ServiceCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Service
        fields = [
            'name',
            'description',
            'base_url']

class ServiceUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Service
        fields = [
            'name',
            'description',
            'base_url']

class ServiceDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Service
        fields = [
            'name',
            'description',
            'base_url']
