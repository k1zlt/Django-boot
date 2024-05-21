from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import UserProfileSerializer


@api_view(['GET'])
def current_user(request):
    serializer = UserProfileSerializer(request.user)
    return Response(serializer.data)


@api_view(['POST'])
def signup(request):
    serializer = UserProfileSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors)
