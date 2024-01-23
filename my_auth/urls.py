from django.urls import path
from .views import (
  RegisterView,
  LoginView,
  ProfileRegisterView,
  UserInformationView,
  UserListView,
  UserDetailForAdminView,
  UserInformationUpdateView
)
from rest_framework_simplejwt.views import TokenRefreshView

urlpatterns = [
  path('login/', LoginView.as_view(), name='login'),
  path('refresh_token/', TokenRefreshView.as_view(), name='refresh_token'),
  path('register/', RegisterView.as_view(), name='register'),
  path('profile/', ProfileRegisterView.as_view(), name='profile'),
  path('user_update/', UserInformationUpdateView.as_view(), name='user_information_update'),
  path('user/', UserInformationView.as_view(), name='user_info'),
  path('user_list/', UserListView.as_view(), name='user_list_for_admin'),
  path('user_detail/', UserDetailForAdminView.as_view(), name='user_detail_for_admin'),
]