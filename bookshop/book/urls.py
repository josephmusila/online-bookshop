from django.urls import path,include
from .views import BookListView,AuthorListView,SubjectListView,PublisherListView,SearchResult

urlpatterns=[
    path('booklist',BookListView.as_view(),),
    path('authorlist',AuthorListView.as_view(),),
    path('subjectlist',SubjectListView.as_view(),),
    path('publisherlist',PublisherListView.as_view(),),
    path('search/<search>',SearchResult.as_view(),),
]
