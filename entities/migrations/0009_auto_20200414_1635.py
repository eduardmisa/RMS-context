# Generated by Django 3.0.3 on 2020-04-14 16:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('entities', '0008_auto_20200414_1619'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='module',
            unique_together={('name', 'application', 'parent')},
        ),
    ]
