# Generated by Django 4.0.5 on 2022-07-03 08:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bank', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='bank',
            name='rate',
            field=models.FloatField(default=0.045),
        ),
    ]
