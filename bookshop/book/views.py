from django.shortcuts import render
from  rest_framework import generics
from .models import Author, Book, Publisher, Subject
from .serializers import BookSerializer,AuthorSerializer,PublisherSerializer,SubjectSerializer
from django.db.models import Q
# Create your views here.

class SearchResult(generics.ListAPIView):
    queryset=Book.objects.all()
    serializer_class=BookSerializer

    def get(self, request, *args, **kwargs):
        print( kwargs['search'])
        SearchResult.queryset=Book.objects.filter(Q(name__icontains=kwargs['search']) |
                                                 Q(author__name__icontains=kwargs['search'])  |
                                                Q(subject__name__icontains=kwargs['search'])  |
                                                 Q(publisher__name__icontains=kwargs['search'])  
        )
        
        return self.list(request, *args, **kwargs)


class BookListView(generics.ListAPIView):
    queryset=Book.objects.all()
    serializer_class=BookSerializer

class SubjectListView(generics.ListAPIView):
    queryset=Subject.objects.all()
    serializer_class=SubjectSerializer

class AuthorListView(generics.ListAPIView):
    queryset=Author.objects.all()
    serializer_class=AuthorSerializer

class PublisherListView(generics.ListAPIView):
    queryset=Publisher.objects.all()
    serializer_class=PublisherSerializer