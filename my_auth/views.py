from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, ProfileSerializer, RegisterSerializer
from .models import UserData
from dotenv import load_dotenv
from .utils import IsSuperUser
from job.models import Job
from job.serializers import JobSerializer

load_dotenv()

class RegisterView(APIView):
  def post(self, request):
    serializer = RegisterSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)

    duplicatedUser = UserData.objects.filter(email = serializer.validated_data['email'])
    if duplicatedUser:
      return Response({
        'email': 'duplicated'
      }, status=status.HTTP_400_BAD_REQUEST)
    serializer.save()

    user = authenticate(username=serializer.data['email'], password=serializer.validated_data['password'])
    if user:
      refresh = RefreshToken.for_user(user)
      access_token = str(refresh.access_token)
      refresh_token = str(refresh)

      return Response({
        'user_id': serializer.data['id'],
        'email': serializer.data['email'],
        'tel': serializer.data['tel'],
        'access_token': access_token,
        'refresh_token': refresh_token,
      })
    else:
      return Response({
        'error': 'User registeration is failed'
      }, status=status.HTTP_400_BAD_REQUEST)

class LoginView(APIView):
  def post(self, request):
    serializer = UserSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    user = authenticate(username=serializer.data['email'], password=serializer.data['password'])

    if user:
      if user.is_active == False:
        return Response({
          'detail': 'This User is deleted'
        }, status=status.HTTP_400_BAD_REQUEST)
      
      # If authentication is successful, create an access token, refresh token
      refresh = RefreshToken.for_user(user)
      access_token = str(refresh.access_token)
      refresh_token = str(refresh)

      # Return the access token and refresh token
      return Response(
        {
          'access_token': access_token,
          'refresh_token': refresh_token,
        }
      )
    else:
      return Response(
        {'detail': 'Invalid credentials'},
        status=status.HTTP_401_UNAUTHORIZED
      )

class UserInformationView(APIView):
  permission_classes = [IsAuthenticated]
  def post(self, request):
    try:
      user = UserData.objects.get(pk = request.user.id)
    except UserData.DoesNotExist:
      return Response({
        'user': 'not exist'
      }, status=status.HTTP_400_BAD_REQUEST)

    return Response({
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'address': user.address,
      'tel': user.tel,
      'isAdmin': user.is_superuser
    })

class ProfileRegisterView(APIView):
  permission_classes = [IsAuthenticated]
  def post(self, request):
    try:
      user = UserData.objects.get(pk = request.user.id)
    except UserData.DoesNotExist:
      return Response({
        'error': 'User not exist'
      }, status=status.HTTP_400_BAD_REQUEST)

    serializer = ProfileSerializer(instance=user, data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    
    return Response({
      'user_id': request.user.id,
      'profiile': True
    })

class UserListView(APIView):
  permission_classes = [IsSuperUser]
  
  def get(self, request):
    users = UserData.objects.filter(is_superuser=False)
    return Response(UserSerializer(users, many=True).data)

class UserDetailForAdminView(APIView):
  permission_classes = [IsSuperUser]

  def get(self, request):
    user_id = request.query_params.get('user_id')
    if not user_id:
      return Response({
        'user_id': 'This field is required'
      }, status=status.HTTP_400_BAD_REQUEST)

    try:
      user = UserData.objects.get(pk=user_id)
    except UserData.DoesNotExist:
      return Response({
        'user_id': 'Not Found'
      }, status=status.HTTP_400_BAD_REQUEST)
    
    jobs = Job.objects.filter(user_id = user_id)

    return Response({
      'user': UserSerializer(user).data,
      'jobs': JobSerializer(jobs, many=True).data
    })
  
class UserInformationUpdateView(APIView):
  permission_classes = [IsSuperUser]
  def post(self, request):
    user_id = request.data.get('user_id')
    if not user_id:
      return Response({
        'user_id': 'This field is required'
      }, status=status.HTTP_400_BAD_REQUEST)
    
    try:
      user = UserData.objects.get(pk = user_id)
    except UserData.DoesNotExist:
      return Response({
        'error': 'User not exist'
      }, status=status.HTTP_400_BAD_REQUEST)

    serializer = ProfileSerializer(instance=user, data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    
    return Response({
      'user_id': request.user.id,
      'profiile': True
    })