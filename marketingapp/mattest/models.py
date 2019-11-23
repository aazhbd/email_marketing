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
