# Generated by Django 3.0.3 on 2020-07-12 10:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('entities', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='group',
            name='modules',
        ),
        migrations.DeleteModel(
            name='Module',
        ),
    ]
