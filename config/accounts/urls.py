from django.urls import path, include
from .views import current_user, signup


app_name = 'accounts'

urlpatterns = [
    path('me/', current_user),
    path('signup/', signup)
]
