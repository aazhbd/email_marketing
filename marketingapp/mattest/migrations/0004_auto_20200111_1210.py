# Generated by Django 2.2.8 on 2020-01-11 12:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mattest', '0003_campaign'),
    ]

    operations = [
        migrations.RenameField(
            model_name='campaign',
            old_name='eamil_subject',
            new_name='email_subject',
        ),
        migrations.AlterField(
            model_name='campaign',
            name='start_date',
            field=models.DateField(blank=True, null=True),
        ),
    ]
