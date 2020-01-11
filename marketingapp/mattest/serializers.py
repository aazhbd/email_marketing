from django.contrib.auth.models import User, Group
from mattest.models import *

from rest_framework import serializers


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'url', 'username', 'password', 'email', 'groups', 'last_login')


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'url', 'name')


class ContactSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Contact
        fields = ('id', 'name', 'email_address')


class ContactListSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = ContactList
        fields = ('id', 'name', 'description', 'contact')


class CampaignSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Campaign
        fields = ('id', 'name', 'start_date', 'description', 'eamil_subject', 'email_body', 'contact_list')
