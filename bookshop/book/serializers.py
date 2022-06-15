from rest_framework import serializers
from .models import Book,Subject,Author,Publisher
import base64

class BookSerializer(serializers.ModelSerializer):
    author=serializers.StringRelatedField()
    publisher=serializers.StringRelatedField()
    subject=serializers.StringRelatedField()
    image_memory=serializers.SerializerMethodField('get_image_memory')
    price_with_discount=serializers.SerializerMethodField('get_price_with_discount')
    class Meta:
        model = Book
        fields=('id','name','price_with_discount','price','discount','author','publisher','image','preview','last_sold','subject','image_memory')


    def get_image_memory(request,book:Book):
        with open(book.image.name,'rb') as loadedfile:
            return   base64.b64encode(loadedfile.read())
             
        return 
    def get_price_with_discount(request,book:Book):
        return book.price - (book.discount/100)*book.price


class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model=Subject
        fields=('name',)


class AuthorSerializer(serializers.ModelSerializer):
    class Meta:
        model=Author
        fields=('name',)


class PublisherSerializer(serializers.ModelSerializer):
    class Meta:
        model=Publisher
        fields=('name',)