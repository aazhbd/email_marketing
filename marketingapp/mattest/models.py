from django.db import models

from django.contrib.auth.models import User


class Base(models.Model):
    id = models.AutoField(primary_key=True)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True, blank=True, null=True)
    status = models.BooleanField(default=True)

    class Meta:
        abstract = True


class Contact(Base):
    name = models.CharField(max_length=256, blank=False)
    email_address = models.CharField(max_length=256, blank=False)

    def __str__(self):
        return str(self.name)


class ContactList(Base):
    name = models.CharField(max_length=256, blank=False)
    description = models.CharField(max_length=512, blank=True)
    contact = models.ManyToManyField(Contact, related_name='contact_list')

    def __str__(self):
            return str(self.name)



class Campaign(Base):
    name = models.CharField(max_length=200, blank=False)
    start_date = models.DateField(blank=True, null=True)
    description = models.CharField(max_length=400, blank=True)
    email_subject = models.CharField(max_length=200, blank=True)
    email_body = models.TextField(blank=True)

    contact_list = models.ForeignKey(ContactList, on_delete=models.CASCADE, related_name='contact_list')

    def __str__(self):
        return str(self.name)



