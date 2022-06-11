from django.urls import path,include
from .views import BookListView

urlpatterns=[
    path('booklist',BookListView.as_view(),),
]