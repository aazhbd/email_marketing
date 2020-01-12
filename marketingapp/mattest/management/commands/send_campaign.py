from django.core.management.base import BaseCommand

from datetime import date
import requests

from mattest.models import *

class Command(BaseCommand):
    help = 'Send Campaigns on its selected date.'

    def add_arguments(self, parser):
        parser.add_argument(
            '--debug', dest='debug', required=False,
            help='Run without sending emails',
        )

    def handle(self, *args, **options):
        debug = options['debug']

        campaigns = Campaign.objects.filter(start_date=date.today())

        for campaign in campaigns:
            print(campaign.id)

        print("Hello, we are sending emails.")

