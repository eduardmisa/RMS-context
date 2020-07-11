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
        return f'{self.service.name}-[{self.method}]-{self.url}'

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
    service_route = models.ManyToManyField(
        ServiceRoute,
        related_name='permissions',
        blank=True)

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
        related_name='groups',
        blank=True)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'groups'
        unique_together=[
            'name',
            'service']


class Module(BaseClass):
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
    icon = models.CharField(
        max_length=100,
        blank=True,
        null=True)
    parent = models.ForeignKey(
        "self",
        on_delete=models.PROTECT,
        related_name='sub_modules',
        null=True,
        default=None)
    service = models.ForeignKey(
        Service,
        on_delete=models.PROTECT,
        related_name='modules',
        blank=False,
        null=False,
        default=1)

    def __str__(self):
        if not self.parent:
            return f'{self.name}'
        else:
            return f'{self.parent}-{self.name}'

    class Meta:
        db_table = 'modules'
        unique_together=[
            'name',
            'parent',
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
