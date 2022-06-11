import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class BookService {
  Future<ListOfBook> getBook() async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/booklist"));
    return ListOfBook.fromList(jsonDecode(response.body));
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
