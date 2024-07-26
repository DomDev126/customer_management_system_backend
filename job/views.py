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
    print("original image=========>", request.data.get('estimate_original_image_url'))
    print("original result_image_url=========>", request.data.get('estimate_result_image_url'))

    estimate_original_image_url = request.data.get('estimate_original_image_url')
    estimate_result_image_url = request.data.get('estimate_result_image_url')
    # charge image part
    charge_original_image_url = request.data.get('charge_original_image_url')
    charge_result_image_url = request.data.get('charge_result_image_url')
    # working image part
    working_original_image_url = request.data.get('working_original_image_url')
    working_result_image_url = request.data.get('working_result_image_url')
    # end image process part
    end_original_image_url = request.data.get('end_original_image_url')
    end_result_image_url = request.data.get('end_result_image_url')
    # estimate image process part
    if estimate_original_image_url is None:
      job.estimate_original_image_url = None

    if estimate_result_image_url is None:
      job.estimate_result_image_url = None
    
    # charge image part
    if charge_original_image_url is None:
      job.charge_original_image_url = None

    if charge_result_image_url is None:
      job.charge_result_image_url = None
    # working image part
    if working_original_image_url is None:
      job.working_original_image_url = None

    if working_result_image_url is None:
      job.working_result_image_url = None
    # end image process part
    if end_original_image_url is None:
      job.end_original_image_url = None

    if end_result_image_url is None:
      job.end_result_image_url = None


    serializer = NewJobSerializer(instance=job, data=request.data, partial=True)
    serializer.is_valid(raise_exception=True)
    serializer.save()
    
    return Response(serializer.data)
  
  def delete(self, request, job_id):
    try:
      print("this is job_id======", job_id)
      job = Job.objects.get(pk=job_id)
    except Job.DoesNotExist:
      return Response({
        'job_id': 'Not Found'
      }, status=status.HTTP_404_NOT_FOUND)
    job.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)
  

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

