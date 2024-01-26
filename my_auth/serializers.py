from rest_framework import serializers
from .models import UserData

class UserSerializer(serializers.ModelSerializer):
  email = serializers.EmailField(required=True)
  password = serializers.CharField(required=True)
  
  class Meta:
    model = UserData
    fields = '__all__'

  def create(self, validated_data):
    user = UserData.objects.create(
      email=validated_data['email'],
      password=validated_data['password'],
    )
    user.set_password(validated_data['password'])
    user.save()
    return user

class ProfileSerializer(serializers.ModelSerializer):
  email = serializers.EmailField(required=True, max_length=528)
  name = serializers.CharField(required=True, max_length=10)
  tel = serializers.CharField(required=True, max_length=10)
  address = serializers.CharField(required=False, max_length=50, allow_blank=True)

  class Meta:
    model = UserData
    fields = [
      'email',
      'name',
      'tel',
      'address',
    ]

class RegisterSerializer(serializers.ModelSerializer):
  email = serializers.EmailField(required=True)
  tel = serializers.CharField(required=True)
  password = serializers.CharField(required=True)

  class Meta:
    model = UserData
    fields = '__all__'

  def create(self, validated_data):
    user = UserData.objects.create(
      email=validated_data['email'],
      password=validated_data['password'],
      tel=validated_data['tel']
    )
    user.set_password(validated_data['password'])
    user.save()
    return user