from django.utils import timezone
from django.db import models
from .modelcommon import BaseClass
from . import enums
# Create your models here.


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
    fromValue = models.TextField(blank=True, null=True)
    toValue = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.entity

    class Meta:
        db_table = 'entity_logs'


class Application(BaseClass):
    code = models.CharField(unique=True, blank=False, null=False, max_length=10)
    name = models.CharField(unique=True, blank=False, null=False, max_length=50)
    description = models.CharField(max_length=100, blank=True, null=True)

    base_url = models.CharField(unique=True, blank=False, null=False, max_length=255)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'applications'


class Module(BaseClass):
    code = models.CharField(unique=True, blank=False, null=False, max_length=10)
    name = models.CharField(blank=False, null=False, max_length=50)
    description = models.CharField(max_length=100, blank=True, null=True)

    front_icon = models.CharField(max_length=100, blank=True, null=True)
    front_url = models.CharField(max_length=255, blank=True, null=True)

    application = models.ForeignKey(Application, on_delete=models.PROTECT, related_name='modules', blank=False, null=False, default=1)
    parent = models.ForeignKey("self", on_delete=models.PROTECT, related_name='sub_modules', null=True, default=None)

    def __str__(self):
        return f'{self.application.name}-{self.parent}-{self.name}'

    class Meta:
        db_table = 'modules'
        unique_together = ['name', 'application']


class Endpoint(BaseClass):
    code = models.CharField(unique=True, blank=False, null=False, max_length=10)

    method = models.CharField(
        choices=[(tag.value, tag.value) for tag in enums.ApiMethodEnum],
        blank=False,
        null=False,
        max_length=20
    )

    url = models.CharField(blank=False, null=False, max_length=255)

    permission = models.CharField(blank=False, null=False, max_length=255)

    module = models.ForeignKey(Module, on_delete=models.PROTECT, related_name='endpoints', blank=False, null=False)

    def __str__(self):
        return f'{self.permission}-[{self.method}]-{self.url}'

    class Meta:
        db_table = 'endpoints'
        unique_together = ['method', 'url']


class Group(BaseClass):
    code = models.CharField(unique=True, blank=False, null=False, max_length=10)
    name = models.CharField(blank=False, null=False, max_length=50)
    description = models.CharField(max_length=100, blank=True, null=True)

    application = models.ForeignKey(Application, on_delete=models.PROTECT, related_name='groups', blank=False, null=False, default=1)

    has_all_access = models.BooleanField(default=False)

    permissions = models.ManyToManyField(Endpoint, related_name='groups', blank=True)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'groups'
        unique_together = ['name', 'application']


class User(BaseClass):
    code = models.CharField(unique=True, null=False, max_length=10)
    username = models.CharField(unique=True, blank=False, null=False, max_length=15)
    password = models.CharField(unique=True, blank=False, null=False, max_length=255)
    password_salt = models.CharField(unique=True, blank=False, null=False, max_length=255)

    email = models.EmailField(unique=True, blank=False, null=False, default="default@default.com", max_length=50)
    firstname = models.CharField(blank=False, null=False, max_length=100)
    middlename = models.CharField(null=True, blank=True, max_length=100)
    lastname = models.CharField(blank=False, null=False, max_length=100)
    birthdate = models.DateField(blank=False, null=False, default=timezone.now)

    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)

    groups = models.ManyToManyField(Group, related_name='users')

    def __str__(self):
        return f'{self.username}'

    class Meta:
            db_table = 'users'


class Client(BaseClass):
    code = models.CharField(unique=True, blank=False, null=False, max_length=10)
    name = models.CharField(unique=True, blank=False, null=False, max_length=50)
    description = models.CharField(max_length=100, blank=True, null=True)

    clid = models.CharField(unique=True, blank=False, null=False, max_length=255)
    clsc = models.CharField(unique=True, blank=False, null=False, max_length=255)

    valid_until = models.DateTimeField(blank=False, null=False)

    application = models.ForeignKey(Application, on_delete=models.PROTECT, related_name='clients', blank=False, null=False, default=1)

    applications = models.ManyToManyField(Application, related_name='clients_external_applications', blank=True)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        db_table = 'clients'


class UserSession(BaseClass):
    user = models.ForeignKey(User, on_delete=models.PROTECT, related_name='user_sessions', blank=False, null=False)
    application = models.ForeignKey(Application, on_delete=models.PROTECT, related_name='user_sessions', blank=True, null=True)
    client = models.ForeignKey(Client, on_delete=models.PROTECT, related_name='user_sessions', blank=False, null=False)
    token = models.CharField(max_length=255, blank=False, null=False)
    expires = models.DateTimeField()
    

    class Meta:
        db_table = 'user_sessions'
        unique_together = ['user', 'application', 'client']