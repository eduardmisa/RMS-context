from django.utils import timezone
from django.db import models
from .modelcommon import BaseClass
from . import enums


class EntityLog(BaseClass):
    action = models.CharField(
        choices=[
            (tag.value, tag.value) for tag in enums.LogEnum],
        default=enums.LogEnum.ADD.value,
        max_length=50)
    entity = models.CharField(
        choices=[
            (tag.value, tag.value) for tag in enums.LogEntitiesEnum],
        default=enums.LogEntitiesEnum.COMPANY.value,
        max_length=50)
    row_id = models.IntegerField()
    fromValue = models.TextField(
        blank=True,
        null=True)
    toValue = models.TextField(
        blank=True,
        null=True)

    def __str__(self):
        return self.entity

    class Meta:
        db_table = 'entity_logs'


class Service(BaseClass):
    code = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=10)
    name = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=50)
    description = models.CharField(
        max_length=100,
        blank=True,
        null=True)
    base_url = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=255)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'services'


class ServiceRoute(BaseClass):
    code = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=10)
    method = models.CharField(
        choices=[(tag.value, tag.value) for tag in enums.ApiMethodEnum],
        blank=False,
        null=False,
        max_length=20
    )
    url = models.CharField(
        blank=False,
        null=False,
        max_length=255)
    service = models.ForeignKey(
        Service,
        on_delete=models.PROTECT,
        related_name='service_routes',
        blank=False,
        null=False,
        default=1)

    def __str__(self):
        return f'[{self.method}]{self.url}'

    class Meta:
        db_table = 'service_routes'
        unique_together=[
            'service',
            'method',
            'url']


class Permission(BaseClass):
    code = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=10)
    name = models.CharField(
        blank=False,
        null=False,
        max_length=50)
    description = models.CharField(
        max_length=100,
        blank=True,
        null=True)
    service = models.ForeignKey(
        Service,
        on_delete=models.PROTECT,
        related_name='permissions',
        blank=False,
        null=False,
        default=1)
    service_routes = models.ManyToManyField(
        ServiceRoute,
        through='PermissionsServiceRoutes',
        through_fields=('permission', 'service_route'),
        related_name='permissions')

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'permissions'


class Group(BaseClass):
    code = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=10)
    name = models.CharField(
        blank=False,
        null=False,
        max_length=50)
    description = models.CharField(
        max_length=100,
        blank=True,
        null=True)
    has_all_access = models.BooleanField(
        default=False)
    service = models.ForeignKey(
        Service,
        on_delete=models.PROTECT,
        related_name='groups',
        blank=False,
        null=False,
        default=1)
    permissions = models.ManyToManyField(
        Permission,
        through='GroupsPermissions',
        through_fields=('group', 'permission'),
        related_name='groups')

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'groups'
        unique_together=[
            'name',
            'service']


class User(BaseClass):
    code = models.CharField(
        unique=True,
        null=False,
        max_length=10)
    username = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=15)
    password = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=255)
    password_salt = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=255)
    email = models.EmailField(
        unique=True,
        blank=False,
        null=False,
        default="default@default.com",
        max_length=50)
    firstname = models.CharField(
        blank=False,
        null=False,
        max_length=100)
    middlename = models.CharField(
        null=True,
        blank=True,
        max_length=100)
    lastname = models.CharField(
        blank=False,
        null=False,
        max_length=100)
    birthdate = models.DateField(
        blank=False,
        null=False,
        default=timezone.now)
    is_active = models.BooleanField(
        default=True)
    is_superuser = models.BooleanField(
        default=False)
    groups = models.ManyToManyField(
        Group,
        through='UsersGroups',
        through_fields=('user', 'group'),
        related_name='users')



    def __str__(self):
        return f'{self.username}'

    class Meta:
            db_table = 'users'


class Client(BaseClass):
    code = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=10)
    name = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=50)
    description = models.CharField(
        max_length=100,
        blank=True,
        null=True)
    clid = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=255)
    clsc = models.CharField(
        unique=True,
        blank=False,
        null=False,
        max_length=255)
    valid_until = models.DateField(
        blank=False,
        null=False)
    service = models.ForeignKey(
        Service,
        on_delete=models.PROTECT,
        related_name='clients',
        blank=False,
        null=False,
        default=1)
    services = models.ManyToManyField(
        Service,
        related_name='clients_external_services',
        blank=True)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'clients'


class UserSession(BaseClass):
    token = models.CharField(
        max_length=255,
        blank=False,
        null=False)
    expires = models.DateTimeField()
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='user_sessions',
        blank=False,
        null=False)
    service = models.ForeignKey(
        Service,
        on_delete=models.CASCADE,
        related_name='user_sessions',
        blank=True,
        null=True)
    client = models.ForeignKey(
        Client,
        on_delete=models.CASCADE,
        related_name='user_sessions',
        blank=False,
        null=False)

    class Meta:
        db_table = 'user_sessions'
        unique_together=[
            'user',
            'service',
            'client']


'''
MANY TO MANY
Through Tables
'''
class PermissionsServiceRoutes(BaseClass):
    permission = models.ForeignKey(Permission, on_delete=models.PROTECT)
    service_route = models.ForeignKey(ServiceRoute, on_delete=models.PROTECT)
    class Meta:
        db_table = 'permissions_service_routes'

class GroupsPermissions(BaseClass):
    group = models.ForeignKey(Group, on_delete=models.PROTECT)
    permission = models.ForeignKey(Permission, on_delete=models.PROTECT)
    class Meta:
        db_table = 'groups_permissions'

class UsersGroups(BaseClass):
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    group = models.ForeignKey(Group, on_delete=models.PROTECT)
    class Meta:
        db_table = 'users_groups'
