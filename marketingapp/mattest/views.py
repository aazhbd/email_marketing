from django.shortcuts import render
from mattest.models import Campaign

def homeView(request):
    campaigns = Campaign.objects.filter(status=True)
    return render(request, 'home.html', {'campaigns': campaigns})
