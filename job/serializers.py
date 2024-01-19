from rest_framework import serializers
from .models import Job
from my_auth.serializers import UserSerializer

class JobSerializer(serializers.ModelSerializer):
  user = UserSerializer()
  class Meta:
    model = Job
    fields = '__all__'

class NewJobSerializer(serializers.ModelSerializer):
  class Meta:
    model = Job
    fields = '__all__'