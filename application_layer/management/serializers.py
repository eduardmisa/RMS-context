from rest_framework import serializers
from entities import models

'''
SERVICES SERIALIZERS
'''
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




'''
SERVICE ROUTES SERIALIZERS
'''
class ServiceRouteListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField()
    class Meta:
        model = models.ServiceRoute
        fields = [
            'code',
            'method',
            'url',
            'service']

class ServiceRouteRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    class Meta:
        model = models.ServiceRoute
        fields = [
            'code',
            'method',
            'url',
            'service']

class ServiceRouteCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.ServiceRoute
        fields = [
            'method',
            'url',
            'service']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.ServiceRoute.objects.all(),
                fields = (
                    'service',
                    'method',
                    'url'),
                message = "Service Method with this URL already exists"
            )
        ]

class ServiceRouteUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.ServiceRoute
        fields = [
            'method',
            'url',
            'service']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.ServiceRoute.objects.all(),
                fields = (
                    'service',
                    'method',
                    'url'),
                message = "Service Method with this URL already exists"
            )
        ]

class ServiceRouteDeleteSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    class Meta:
        model = models.ServiceRoute
        fields = [
            'code',
            'method',
            'url',
            'service']









'''
PERMISSIONS SERIALIZERS
'''
class PermissionListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    service_route = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Permission
        fields = ['code',
                  'name',
                  'description',
                  'service',
                  'service_route']

class PermissionRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer(
        many=False,
        read_only=True)
    service_route = ServiceRouteListSerializer(
        many=True,
        read_only=True)
    class Meta:
        model = models.Permission
        fields = ['code',
                  'name',
                  'description',
                  'service',
                  'service_route']

class PermissionCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        many=False,
        slug_field='code',
        queryset=models.Service.objects)
    service_route = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.ServiceRoute.objects)
    class Meta:
        model = models.Permission
        fields = ['name',
                  'description',
                  'service',
                  'service_route']

class PermissionUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        many=False,
        slug_field='code',
        queryset=models.Service.objects)
    service_route = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.ServiceRoute.objects)
    class Meta:
        model = models.Permission
        fields = ['name',
                  'description',
                  'service',
                  'service_route']

class PermissionDeleteSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    service_route = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Permission
        fields = ['code',
                  'name',
                  'description',
                  'service',
                  'service_route']









'''
GROUPS SERIALIZERS
'''
class GroupListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    permissions = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Group
        fields = ['code',
                  'name',
                  'description',
                  'has_all_access',
                  'service',
                  'permissions']

class GroupRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    permissions = PermissionListSerializer(
        many=True,
        read_only=True)
    class Meta:
        model = models.Group
        fields = ['code',
                  'name',
                  'description',
                  'has_all_access',
                  'service',
                  'permissions']

class GroupCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    permissions = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Permission.objects)        
    class Meta:
        model = models.Group
        fields = ['name',
                  'description',
                  'has_all_access',
                  'service',
                  'permissions']
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
                        'Some items did not match the submited Service')

        return val

class GroupUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    permissions = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Permission.objects)        
    class Meta:
        model = models.Group
        fields = ['name',
                  'description',
                  'has_all_access',
                  'service',
                  'permissions']
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
                        'Some items did not match the submited Service')

        return val

class GroupDeleteSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField(
        many=False,
        read_only=True)
    permissions = serializers.StringRelatedField(
        many=True,
        read_only=True)
    class Meta:
        model = models.Group
        fields = ['code',
                  'name',
                  'description',
                  'has_all_access',
                  'service',
                  'permissions']










'''
MODULES SERIALIZERS
'''
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







'''
CLIENTS SERIALIZERS
'''
class ClientListSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField()
    services = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.Client
        fields = [
            'code',
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']

class ClientRetrieveSerializer(serializers.ModelSerializer):
    service = ServiceListSerializer()
    services = ServiceListSerializer(many=True)
    class Meta:
        model = models.Client
        fields = [
            'code',
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']

class ClientCreateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    services = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.Client
        fields = [
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']

class ClientUpdateSerializer(serializers.ModelSerializer):
    service = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Service.objects)
    services = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Service.objects)
    class Meta:
        model = models.Client
        fields = [
            'name',
            'description',
            'valid_until',
            'service',
            'services']

class ClientDeleteSerializer(serializers.ModelSerializer):
    service = serializers.StringRelatedField()
    services = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.Client
        fields = [
            'code',
            'name',
            'description',
            'clid',
            'clsc',
            'valid_until',
            'service',
            'services']








# class RoutesFrontEasyCreateSerializer(serializers.Serializer):
#     id = serializers.CharField(allow_blank=False, allow_null=False)
#     url = serializers.CharField(allow_blank=False, allow_null=False)

# class ServiceRouteEasyCreateSerializer(serializers.Serializer):
#     id = serializers.CharField(allow_blank=False, allow_null=False)
#     url = serializers.CharField(allow_blank=False, allow_null=False)
#     method = serializers.CharField(allow_blank=False, allow_null=False)

# class PermissionEasyCreateSerializer(serializers.Serializer):
#     id = serializers.CharField(allow_blank=False, allow_null=False)
#     name = serializers.CharField(allow_blank=False, allow_null=False)
#     description = serializers.CharField(allow_blank=True, allow_null=True)
#     routes_fronts = RoutesFrontEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
#     routes_backs = ServiceRouteEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)

# class ModuleEasyCreateSerializer(serializers.Serializer):
#     id = serializers.CharField(allow_blank=False, allow_null=False)
#     name = serializers.CharField(allow_blank=False, allow_null=False)
#     description = serializers.CharField(allow_blank=True, allow_null=True)
#     icon = serializers.CharField(allow_blank=True, allow_null=True)
#     parent = serializers.CharField(allow_blank=True, allow_null=True) # Should be name
#     routes_front = RoutesFrontEasyCreateSerializer(allow_null=False)

# class ServiceEasyCreateSerializer(serializers.Serializer):
#     id = serializers.CharField(allow_blank=False, allow_null=False)
#     name = serializers.CharField()
#     description = serializers.CharField(allow_blank=True, allow_null=True)
#     base_url = serializers.CharField(allow_blank=False, allow_null=False)

#     routes_fronts = RoutesFrontEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
#     routes_backs = ServiceRouteEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
#     permissions = PermissionEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
#     modules = ModuleEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
