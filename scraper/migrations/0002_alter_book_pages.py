# Generated by Django 4.2 on 2024-02-23 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('scraper', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='pages',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
