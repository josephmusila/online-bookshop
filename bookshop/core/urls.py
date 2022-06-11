from django.urls import path
from django.http.response import HttpResponse
from . import views

urlpatterns=[
    path("a",views.aPage)
]