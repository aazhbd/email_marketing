from django.shortcuts import render
from django.http import HttpResponseRedirect
from mattest.models import *

from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from mattest.serializers import UserSerializer, GroupSerializer, ContactSerializer, ContactListSerializer, CampaignSerializer


def homeView(request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect("/user/")

    campaigns = Campaign.objects.filter(status=True)
    return render(request, 'home.html', {'campaigns': campaigns, 'has_permission': True})



class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer


class ContactViewSet(viewsets.ModelViewSet):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer


class ContactListViewSet(viewsets.ModelViewSet):
    queryset = ContactList.objects.all()
    serializer_class = ContactListSerializer


class CampaignViewSet(viewsets.ModelViewSet):
    queryset = Campaign.objects.all()
    serializer_class = CampaignSerializer
