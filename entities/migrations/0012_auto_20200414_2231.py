# Generated by Django 3.0.3 on 2020-04-14 22:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('entities', '0011_auto_20200414_2227'),
    ]

    operations = [
        migrations.AlterField(
            model_name='endpoint',
            name='method',
            field=models.CharField(choices=[('GET', 'GET'), ('POST', 'POST'), ('PUT', 'PUT'), ('DELETE', 'DELETE')], max_length=20),
        ),
    ]
