# Generated by Django 2.2.8 on 2020-01-01 18:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mattest', '0002_contactlist'),
    ]

    operations = [
        migrations.CreateModel(
            name='Campaign',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True, null=True)),
                ('status', models.BooleanField(default=True)),
                ('name', models.CharField(max_length=200)),
                ('start_date', models.DateTimeField(blank=True, null=True)),
                ('description', models.CharField(blank=True, max_length=400)),
                ('eamil_subject', models.CharField(blank=True, max_length=200)),
                ('email_body', models.TextField(blank=True)),
                ('contact_list', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='contact_list', to='mattest.ContactList')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]