from django.shortcuts import render
from django.http import HttpResponseRedirect
from mattest.models import Campaign

def homeView(request):
    if not request.user.is_authenticated:
        return HttpResponseRedirect("/user/")

    campaigns = Campaign.objects.filter(status=True)
    return render(request, 'home.html', {'campaigns': campaigns})
