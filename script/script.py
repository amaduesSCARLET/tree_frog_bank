import datetime
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "tree_frog_bank.settings")
import django
django.setup()
from bank.models import *