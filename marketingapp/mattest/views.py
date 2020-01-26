from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.http import JsonResponse
from django.views import View
from django.core.mail import EmailMessage

from mattest.models import *

from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from mattest.serializers import UserSerializer, GroupSerializer, ContactSerializer, ContactListSerializer, CampaignSerializer


def homeView(request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect("/user/")

    campaigns = Campaign.objects.filter(status=True)
    return render(request, 'home.html', {'campaigns': campaigns, 'has_permission': True})


def loginSucess(request):
    return JsonResponse({'message': 'login was successful'})


class SendCampaign(View):
    def get(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return HttpResponseRedirect("/user/")

        campaigns = Campaign.objects.all()
        return render(request, 'home.html', {'campaigns': campaigns, 'has_permission': True})

    def post(self, request, *args, **kwargs):
        message = 'Sending campaign failed.'
        
        api_call = request.POST.get('api_call', True)
        campaign_id = request.POST.get('campaign_id', None)
        
        message = 'Campaign sent successfully.' if sendCampaignNow(campaign_id) else 'Sending campaign failed.'
        
        if api_call == 'false' or not api_call:
            return render(request, 'home.html', {'message': message})
        else:
            return JsonResponse({'message': message})


def sendCampaignNow(campaign_id):
    if not campaign_id:
        return False

    campaign = Campaign.objects.get(pk=campaign_id)
    if campaign.status == False:
        return False

    contacts = campaign.contact_list.contact.all()
    to_emails = []

    for contact in contacts:
        to_emails.append(contact.email_address)

    email_message = EmailMessage(
        subject = campaign.email_subject,
        body = campaign.email_body,
        from_email = 'wmappgroup@gmail.com',
        to = to_emails,
    )
    
    sent = email_message.send()

    try:
        campaign.status = False
        campaign.save()
    except:
        return False

    return True


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



class DisableCSRFMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        setattr(request, '_dont_enforce_csrf_checks', True)
        response = self.get_response(request)
        return response

