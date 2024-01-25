from .models import Job
from .serializers import JobSerializer, NewJobSerializer
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from my_auth.utils import IsSuperUser

class UserJobView(APIView):
  permission_classes = [IsAuthenticated]
  def get(self, request):
    jobs = Job.objects.filter(user_id=request.user.id)
    return Response(JobSerializer(jobs, many=True).data)

class AdminJobView(APIView):
  permission_classes = [IsSuperUser]
  def get(self, request):
    jobs = Job.objects.all()
    return Response(JobSerializer(jobs, many=True).data)
  
  def post(self, request):
    serializer = NewJobSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    return Response(serializer.data)

  def put(self, request):
    job_id = request.data.get('job_id')
    if not job_id:
      return Response({
        'job_id': 'This field is required'
      }, status=status.HTTP_400_BAD_REQUEST)

    try:
      job = Job.objects.get(pk=job_id)
    except Job.DoesNotExist:
      return Response({
        'job_id': 'Not Found'
      }, status=status.HTTP_400_BAD_REQUEST)

    serializer = NewJobSerializer(instance=job, data=request.data)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    
    return Response(serializer.data)

class JobDetailView(APIView):
  permission_classes = [IsAuthenticated]
  def get(self, request):
    # job_id = request.data.get('job_id')
    job_id = request.query_params.get('job_id')
    if not job_id:
      return Response({
        'job_id': 'This field is required'
      }, status=status.HTTP_400_BAD_REQUEST)

    try:
      job = Job.objects.get(pk=job_id)
    except Job.DoesNotExist:
      return Response({
        'job_id': 'Not Found'
      }, status=status.HTTP_400_BAD_REQUEST)
    
    return Response(JobSerializer(job, context={"request":request}).data)

