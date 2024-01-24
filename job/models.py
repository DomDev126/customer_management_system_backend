from django.db import models
from my_auth.models import UserData

# Create your models here.
class Job(models.Model):
  user=models.ForeignKey(UserData, on_delete=models.CASCADE)
  title = models.CharField(max_length=100, default='')
  car_number = models.CharField(max_length=50)
  charger = models.CharField(max_length=50, default='')
  STATUS_CHOICES = [
    (1, '見積もり中'),
    (2, '担当者選択中'),
    (3, '作業中'),
    (4, '作業終了'),
  ]
  status = models.IntegerField(choices=STATUS_CHOICES, default=1)
  deadline = models.DateField(null=True)
  budget = models.IntegerField(default=0)
  original_image_url = models.ImageField(default='')
  result_image_url = models.ImageField(default='')
  created = models.DateTimeField(auto_now_add=True)
  is_client_unread = models.BooleanField(default=False)
  is_admin_unread = models.BooleanField(default=False)