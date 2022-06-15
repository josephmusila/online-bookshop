import 'package:flutter/material.dart';
import 'package:online_book_shop/data_service/book_service.dart';

class ViewAuthor extends StatelessWidget {
  BookService bookService = BookService();
  late List<Author> authors;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthorList>(
      future: bookService.getAuthor(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          authors = snapshot.data!.authors;
          return Container(
            height: 300,
            child: ListView.builder(
              itemCount: authors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}."),
                  title: Text(authors[index].name),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
