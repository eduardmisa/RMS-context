# Generated by Django 3.0.3 on 2020-05-09 20:32

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Application',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('name', models.CharField(max_length=50, unique=True)),
                ('description', models.CharField(blank=True, max_length=100, null=True)),
                ('base_url', models.CharField(max_length=255, unique=True)),
            ],
            options={
                'db_table': 'applications',
            },
        ),
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('name', models.CharField(max_length=50, unique=True)),
                ('description', models.CharField(blank=True, max_length=100, null=True)),
                ('clid', models.CharField(max_length=255, unique=True)),
                ('clsc', models.CharField(max_length=255, unique=True)),
                ('valid_until', models.DateField()),
                ('application', models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='clients', to='entities.Application')),
                ('applications', models.ManyToManyField(blank=True, related_name='clients_external_applications', to='entities.Application')),
            ],
            options={
                'db_table': 'clients',
            },
        ),
        migrations.CreateModel(
            name='EntityLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('action', models.CharField(choices=[('Add', 'Add'), ('Update', 'Update'), ('DELETED', 'DELETED')], default='Add', max_length=50)),
                ('entity', models.CharField(choices=[('COMPANY', 'COMPANY')], default='COMPANY', max_length=50)),
                ('row_id', models.IntegerField()),
                ('fromValue', models.TextField(blank=True, null=True)),
                ('toValue', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'entity_logs',
            },
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('name', models.CharField(max_length=50)),
                ('description', models.CharField(blank=True, max_length=100, null=True)),
                ('has_all_access', models.BooleanField(default=False)),
                ('application', models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='groups', to='entities.Application')),
            ],
            options={
                'db_table': 'groups',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('username', models.CharField(max_length=15, unique=True)),
                ('password', models.CharField(max_length=255, unique=True)),
                ('password_salt', models.CharField(max_length=255, unique=True)),
                ('email', models.EmailField(default='default@default.com', max_length=50, unique=True)),
                ('firstname', models.CharField(max_length=100)),
                ('middlename', models.CharField(blank=True, max_length=100, null=True)),
                ('lastname', models.CharField(max_length=100)),
                ('birthdate', models.DateField(default=django.utils.timezone.now)),
                ('is_active', models.BooleanField(default=True)),
                ('is_superuser', models.BooleanField(default=False)),
                ('groups', models.ManyToManyField(related_name='users', to='entities.Group')),
            ],
            options={
                'db_table': 'users',
            },
        ),
        migrations.CreateModel(
            name='RoutesFront',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('url', models.CharField(blank=True, max_length=255, null=True)),
                ('application', models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='modules', to='entities.Application')),
            ],
            options={
                'db_table': 'routes_front',
                'unique_together': {('url', 'application')},
            },
        ),
        migrations.CreateModel(
            name='RoutesBack',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('method', models.CharField(choices=[('GET', 'GET'), ('POST', 'POST'), ('PUT', 'PUT'), ('DELETE', 'DELETE')], max_length=20)),
                ('url', models.CharField(max_length=255)),
                ('application', models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, related_name='routes_back', to='entities.Application')),
            ],
            options={
                'db_table': 'routes_back',
                'unique_together': {('method', 'url')},
            },
        ),
        migrations.CreateModel(
            name='Permission',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('name', models.CharField(max_length=50)),
                ('description', models.CharField(blank=True, max_length=100, null=True)),
                ('route_back', models.ManyToManyField(blank=True, related_name='permissions', to='entities.RoutesBack')),
                ('route_front', models.ManyToManyField(related_name='permissions', to='entities.RoutesFront')),
            ],
            options={
                'db_table': 'permissions',
            },
        ),
        migrations.AddField(
            model_name='group',
            name='permissions',
            field=models.ManyToManyField(blank=True, related_name='groups', to='entities.Permission'),
        ),
        migrations.CreateModel(
            name='UserSession',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('token', models.CharField(max_length=255)),
                ('expires', models.DateTimeField()),
                ('application', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='user_sessions', to='entities.Application')),
                ('client', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='user_sessions', to='entities.Client')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='user_sessions', to='entities.User')),
            ],
            options={
                'db_table': 'user_sessions',
                'unique_together': {('user', 'application', 'client')},
            },
        ),
        migrations.CreateModel(
            name='Module',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('createdby', models.CharField(max_length=255)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('modifiedby', models.CharField(max_length=255)),
                ('code', models.CharField(max_length=10, unique=True)),
                ('name', models.CharField(max_length=50)),
                ('description', models.CharField(blank=True, max_length=100, null=True)),
                ('icon', models.CharField(blank=True, max_length=100, null=True)),
                ('parent', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='sub_modules', to='entities.Module')),
                ('route_front', models.OneToOneField(blank=True, default=1, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='modules', to='entities.RoutesFront')),
            ],
            options={
                'db_table': 'modules',
                'unique_together': {('name', 'route_front')},
            },
        ),
        migrations.AlterUniqueTogether(
            name='group',
            unique_together={('name', 'application')},
        ),
    ]
