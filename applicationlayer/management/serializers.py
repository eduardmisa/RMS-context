from rest_framework import serializers
from entities import models


class ApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Application
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )

class RoutesFrontSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.RoutesFront
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.RoutesFront.objects.all(),
                fields = ('url', 'application'),
                message = "URL with this Application already exists"
            )
        ]

class RoutesBackSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.RoutesBack
        fields = '__all__'
        read_only_fields = (
            'createdby', 'modifiedby', 'code'
        )
        validators = [
            serializers.UniqueTogetherValidator(
                queryset = models.RoutesBack.objects.all(),
                fields = ('method', 'url'),
                message = "Method with this URL already exists"
            )
        ]

class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Permission
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
            for fitem in item.route_front.all():
                if fitem.application.id != existing_application.id:
                    raise serializers.ValidationError('Some items did not match the submited application')
            for bitem in item.route_back.all():
                if bitem.application.id != existing_application.id:
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
