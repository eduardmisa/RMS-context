from rest_framework import serializers
from entities import models

'''
APPLICATION SERIALIZERS
'''
class ApplicationListSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = ['code','name','description','base_url']

class ApplicationRetrieveSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = ['code','name','description','base_url']

class ApplicationCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = ['name','description','base_url']

class ApplicationUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = ['name','description','base_url']

class ApplicationDeleteSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = ['name','description','base_url']







'''
ROUTE FRONTS SERIALIZERS
'''
class RoutesFrontListSerializer(serializers.ModelSerializer):
    application = serializers.StringRelatedField()
    class Meta:
        model = models.RoutesFront
        fields = ['code','url','application']

class RoutesFrontRetrieveSerializer(serializers.ModelSerializer):
    application = ApplicationListSerializer()
    class Meta:
        model = models.RoutesFront
        fields = ['code','url','application']

class RoutesFrontCreateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    class Meta:
        model = models.RoutesFront
        fields = ['url','application']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.RoutesFront.objects.all(),
                fields = ('url', 'application'),
                message = "URL with this Application already exists"
            )
        ]

class RoutesFrontUpdateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    class Meta:
        model = models.RoutesFront
        fields = ['url','application']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.RoutesFront.objects.all(),
                fields = ('url', 'application'),
                message = "URL with this Application already exists"
            )
        ]

class RoutesFrontDeleteSerializer(serializers.ModelSerializer):
    application = ApplicationListSerializer()
    class Meta:
        model = models.RoutesFront
        fields = ['code','url','application']








'''
ROUTE BACKS SERIALIZERS
'''
class RoutesBackListSerializer(serializers.ModelSerializer):
    application = serializers.StringRelatedField()
    class Meta:
        model = models.RoutesBack
        fields = ['code','method','url','application']

class RoutesBackRetrieveSerializer(serializers.ModelSerializer):
    application = ApplicationListSerializer()
    class Meta:
        model = models.RoutesBack
        fields = ['code','method','url','application']

class RoutesBackCreateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    class Meta:
        model = models.RoutesBack
        fields = ['method','url','application']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.RoutesBack.objects.all(),
                fields = ('method', 'url'),
                message = "Method with this URL already exists"
            )
        ]

class RoutesBackUpdateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    class Meta:
        model = models.RoutesBack
        fields = ['method','url','application']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.RoutesBack.objects.all(),
                fields = ('method', 'url'),
                message = "Method with this URL already exists"
            )
        ]

class RoutesBackDeleteSerializer(serializers.ModelSerializer):
    application = ApplicationListSerializer()
    class Meta:
        model = models.RoutesBack
        fields = ['code','method','url','application']









'''
PERMISSIONS SERIALIZERS
'''
class PermissionListSerializer(serializers.ModelSerializer):
    route_front = serializers.StringRelatedField(many=True, read_only=True)
    route_back = serializers.StringRelatedField(many=True, read_only=True)
    class Meta:
        model = models.Permission
        fields = ['code',
                  'name',
                  'description',
                  'route_front',
                  'route_back']

class PermissionRetrieveSerializer(serializers.ModelSerializer):
    route_front = RoutesFrontListSerializer(many=True)
    route_back = RoutesBackListSerializer(many=True)
    class Meta:
        model = models.Permission
        fields = ['code',
                  'name',
                  'description',
                  'route_front',
                  'route_back']

class PermissionCreateSerializer(serializers.ModelSerializer):
    route_front = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.RoutesFront.objects)
    route_back = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.RoutesBack.objects)
    class Meta:
        model = models.Permission
        fields = ['name',
                  'description',
                  'route_front',
                  'route_back']

class PermissionUpdateSerializer(serializers.ModelSerializer):
    route_front = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.RoutesFront.objects)
    route_back = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.RoutesBack.objects)
    class Meta:
        model = models.Permission
        fields = ['name',
                  'description',
                  'route_front',
                  'route_back']

class PermissionDeleteSerializer(serializers.ModelSerializer):
    route_front = RoutesFrontListSerializer(many=True)
    route_back = RoutesBackListSerializer(many=True)
    class Meta:
        model = models.Permission
        fields = ['code',
                  'name',
                  'description',
                  'route_front',
                  'route_back']








'''
MODULES SERIALIZERS
'''
class ModuleListSerializer(serializers.ModelSerializer):
    parent = serializers.StringRelatedField()
    route_front = serializers.StringRelatedField()
    class Meta:
        model = models.Module
        fields = ['code',
                  'name',
                  'description',
                  'icon',
                  'parent',
                  'route_front']

class ModuleRetrieveSerializer(serializers.ModelSerializer):
    parent = ModuleListSerializer()
    route_front = RoutesFrontListSerializer()
    class Meta:
        model = models.Module
        fields = ['code',
                  'name',
                  'description',
                  'icon',
                  'parent',
                  'route_front']

class ModuleCreateSerializer(serializers.ModelSerializer):
    parent = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Module.objects)
    route_front = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.RoutesFront.objects)        
    class Meta:
        model = models.Module
        fields = ['name',
                  'description',
                  'icon',
                  'parent',
                  'route_front']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Module.objects.all(),
                fields = ('name', 'route_front'),
                message = "Name with this Frontend Route already exists"
            )
        ]
    # def validate_parent (self, val):
    #     if val:
    #         existing_routefront = models.RoutesFront.objects.filter(id=self.initial_data.get('route_front')).first() 
    #         if not existing_routefront:
    #             raise serializers.ValidationError('Frontend Route does not exists')

    #         if val.RoutesFront.application.id != existing_routefront..id:
    #             raise serializers.ValidationError('Parent application does not match this application')

    #     return val

class ModuleUpdateSerializer(serializers.ModelSerializer):
    parent = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Module.objects)
    route_front = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.RoutesFront.objects)
    class Meta:
        model = models.Module
        fields = ['name',
                  'description',
                  'icon',
                  'parent',
                  'route_front']
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.Module.objects.all(),
                fields = ('name', 'route_front'),
                message = "Name with this Frontend Route already exists"
            )
        ]

class ModuleDeleteSerializer(serializers.ModelSerializer):
    parent = ModuleListSerializer()
    route_front = RoutesFrontListSerializer()
    class Meta:
        model = models.Module
        fields = ['code',
                  'name',
                  'description',
                  'icon',
                  'parent',
                  'route_front']







'''
GROUPS SERIALIZERS
'''
class GroupListSerializer(serializers.ModelSerializer):
    application = serializers.StringRelatedField()
    permissions = serializers.StringRelatedField(many=True, read_only=True)
    class Meta:
        model = models.Group
        fields = ['code',
                  'name',
                  'description',
                  'has_all_access',
                  'application',
                  'permissions']

class GroupRetrieveSerializer(serializers.ModelSerializer):
    application = ApplicationListSerializer()
    permissions = PermissionListSerializer(many=True, read_only=True)
    class Meta:
        model = models.Group
        fields = ['code',
                  'name',
                  'description',
                  'has_all_access',
                  'application',
                  'permissions']

class GroupCreateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    permissions = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Permission.objects)        
    class Meta:
        model = models.Group
        fields = ['name',
                  'description',
                  'has_all_access',
                  'application',
                  'permissions']
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

        existing_application = models.Application.objects.filter(code=application).first()

        if not existing_application:
            raise serializers.ValidationError('Application not found')

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
            return []

        for item in permissions:
            for fitem in item.route_front.all():
                if fitem.application.id != existing_application.id:
                    raise serializers.ValidationError('Some items did not match the submited application')
            for bitem in item.route_back.all():
                if bitem.application.id != existing_application.id:
                    raise serializers.ValidationError('Some items did not match the submited application')

        return val

class GroupUpdateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    permissions = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Permission.objects)  
    class Meta:
        model = models.Group
        fields = ['name',
                  'description',
                  'has_all_access',
                  'application',
                  'permissions']
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

        existing_application = models.Application.objects.filter(code=application).first()

        if not existing_application:
            raise serializers.ValidationError('Application not found')

        if (type(has_all_access) == str and has_all_access.lower() == 'true') or (type(has_all_access) == bool and has_all_access == True):
            return []

        for item in permissions:
            for fitem in item.route_front.all():
                if fitem.application.id != existing_application.id:
                    raise serializers.ValidationError('Some items did not match the submited application')
            for bitem in item.route_back.all():
                if bitem.application.id != existing_application.id:
                    raise serializers.ValidationError('Some items did not match the submited application')

        return val



class GroupDeleteSerializer(serializers.ModelSerializer):
    application = serializers.StringRelatedField()
    permissions = serializers.StringRelatedField(many=True, read_only=True)
    class Meta:
        model = models.Group
        fields = ['code',
                  'name',
                  'description',
                  'has_all_access',
                  'application',
                  'permissions']














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





class UserListSerializer(serializers.ModelSerializer):
    groups = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.User
        fields = ['code',
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
        fields = ['code',
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
        fields = ['username',
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
        fields = ['username',
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
        fields = ['code',
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
    application = serializers.StringRelatedField()
    applications = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.Client
        fields = ['code',
                  'name',
                  'description',
                  'clid',
                  'clsc',
                  'valid_until',
                  'application',
                  'applications']

class ClientRetrieveSerializer(serializers.ModelSerializer):
    application = ApplicationListSerializer()
    applications = ApplicationListSerializer(many=True)
    class Meta:
        model = models.Client
        fields = ['code',
                  'name',
                  'description',
                  'clid',
                  'clsc',
                  'valid_until',
                  'application',
                  'applications']

class ClientCreateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    applications = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Application.objects)
    class Meta:
        model = models.Client
        fields = ['name',
                  'description',
                  'clid',
                  'clsc',
                  'valid_until',
                  'application',
                  'applications']

class ClientUpdateSerializer(serializers.ModelSerializer):
    application = serializers.SlugRelatedField(
        slug_field='code',
        queryset=models.Application.objects)
    applications = serializers.SlugRelatedField(
        many=True,
        slug_field='code',
        queryset=models.Application.objects)
    class Meta:
        model = models.Client
        fields = ['name',
                  'description',
                  'valid_until',
                  'application',
                  'applications']

class ClientDeleteSerializer(serializers.ModelSerializer):
    application = serializers.StringRelatedField()
    applications = serializers.StringRelatedField(many=True)
    class Meta:
        model = models.Client
        fields = ['code',
                  'name',
                  'description',
                  'clid',
                  'clsc',
                  'valid_until',
                  'application',
                  'applications']








class RoutesFrontEasyCreateSerializer(serializers.Serializer):
    id = serializers.CharField(allow_blank=False, allow_null=False)
    url = serializers.CharField(allow_blank=False, allow_null=False)

class RoutesBackEasyCreateSerializer(serializers.Serializer):
    id = serializers.CharField(allow_blank=False, allow_null=False)
    url = serializers.CharField(allow_blank=False, allow_null=False)
    method = serializers.CharField(allow_blank=False, allow_null=False)

class PermissionEasyCreateSerializer(serializers.Serializer):
    id = serializers.CharField(allow_blank=False, allow_null=False)
    name = serializers.CharField(allow_blank=False, allow_null=False)
    description = serializers.CharField(allow_blank=True, allow_null=True)
    routes_fronts = RoutesFrontEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
    routes_backs = RoutesBackEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)

class ModuleEasyCreateSerializer(serializers.Serializer):
    id = serializers.CharField(allow_blank=False, allow_null=False)
    name = serializers.CharField(allow_blank=False, allow_null=False)
    description = serializers.CharField(allow_blank=True, allow_null=True)
    icon = serializers.CharField(allow_blank=True, allow_null=True)
    parent = serializers.CharField(allow_blank=True, allow_null=True) # Should be name
    routes_front = RoutesFrontEasyCreateSerializer(allow_null=False)

class ApplicationEasyCreateSerializer(serializers.Serializer):
    id = serializers.CharField(allow_blank=False, allow_null=False)
    name = serializers.CharField()
    description = serializers.CharField(allow_blank=True, allow_null=True)
    base_url = serializers.CharField(allow_blank=False, allow_null=False)

    routes_fronts = RoutesFrontEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
    routes_backs = RoutesBackEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
    permissions = PermissionEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
    modules = ModuleEasyCreateSerializer(many=True, allow_null=False, allow_empty=False)
