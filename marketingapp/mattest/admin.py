from django.contrib import admin

from mattest.models import *

class ContactListAdmin(admin.ModelAdmin):
    model = ContactList
    filter_horizontal = ('contact',)

admin.site.register(Contact)
admin.site.register(ContactList, ContactListAdmin)
