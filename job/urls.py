from django.urls import path

from .views import (
  UserJobView,
  AdminJobView,
  JobDetailView,
)

urlpatterns = [
  path('user_jobs/', UserJobView.as_view(), name='user_jobs'),
  path('jobs/', AdminJobView.as_view(), name='jobs_for_admin'),
  path('job_detail/', JobDetailView.as_view(), name='job_detail'),
  path('jobs/<int:job_id>/', AdminJobView.as_view(), name="job_delete")
]