from django.urls import path
from .views import (
    DepartmentListView, DepartmentDetailView,
    EventListView, EventDetailView,
    VenueListView, VenueDetailView,
    TaskListView, TaskDetailView,
    CommentListCreateView
)

app_name = 'core'

urlpatterns = [
]
