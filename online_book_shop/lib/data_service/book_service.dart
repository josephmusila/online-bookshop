import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class BookService {
  Future<ListOfBook> getBook() async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/booklist"));
    return ListOfBook.fromList(jsonDecode(response.body));
  }
   Future<ListOfBook> getBookBySearch(String keyword) async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/search/$keyword"));
    return ListOfBook.fromList(jsonDecode(response.body));
  }

  Future<SubjectList> getSubject() async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/subjectlist"));
    return SubjectList.fromList(jsonDecode(response.body));
  }

  Future<PublisherList> getPublisher() async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/publisherlist"));
    return PublisherList.fromList(jsonDecode(response.body));
  }

  Future<AuthorList> getAuthor() async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/authorlist"));
    return AuthorList.fromList(jsonDecode(response.body));
  }
}

class SubjectList {
  List<Subject> subjects;
  SubjectList({
    required this.subjects,
  });

  factory SubjectList.fromList(List list) {
    List<Subject> _subjects = [];
    for (var element in list) {
      _subjects.add(Subject.fromMap(element));
    }
    return SubjectList(subjects: _subjects);
  }
}

class Subject {
  String name;
  Subject({
    required this.name,
  });
  factory Subject.fromMap(map) {
    return Subject(name: map['name']);
  }
}

class AuthorList {
  List<Author> authors;
  AuthorList({
    required this.authors,
  });

  factory AuthorList.fromList(List list) {
    List<Author> _authors = [];
    for (var element in list) {
      _authors.add(Author.fromMap(element));
    }
    return AuthorList(authors: _authors);
  }
}

class Author {
  String name;
  Author({
    required this.name,
  });
  factory Author.fromMap(map) {
    return Author(name: map['name']);
  }
}

class PublisherList {
  List<Publisher> publishers;
  PublisherList({
    required this.publishers,
  });

  factory PublisherList.fromList(List list) {
    List<Publisher> _publisher = [];
    for (var element in list) {
      _publisher.add(Publisher.fromMap(element));
    }
    return PublisherList(publishers: _publisher);
  }
}

class Publisher {
  String name;
  Publisher({
    required this.name,
  });
  factory Publisher.fromMap(map) {
    return Publisher(name: map['name']);
  }
}

class ListOfBook {
  List<Book> books;

  ListOfBook({
    required this.books,
  });

  factory ListOfBook.fromList(List list) {
    List<Book> books = [];

    list.forEach((element) {
      books.add(Book.fromJson(element));
    });
    return ListOfBook(books: books);
  }
}

class Book {
  int id;
  String name;
  int price;
  int discount;
  String author;
  String publisher;
  String image;
  String preview;
  String last_sold;
  String subject;
  Uint8List image_memory;
  double priceWithDiscount;

  Book(
      {required this.id,
      required this.name,
      required this.price,
      required this.discount,
      required this.author,
      required this.publisher,
      required this.image,
      required this.preview,
      required this.last_sold,
      required this.priceWithDiscount,
      required this.subject,
      required this.image_memory});

  factory Book.fromJson(map) {
    return Book(
        id: map['id'],
        name: map['name'],
        author: map['author'],
        discount: map['discount'],
        image: map['image'],
        last_sold: map['last_sold'],
        preview: map['preview'],
        priceWithDiscount: map['price_with_discount'],
        price: map['price'],
        publisher: map['publisher'],
        image_memory: base64Decode(map['image_memory']),
        subject: map['subject']);
  }
}
