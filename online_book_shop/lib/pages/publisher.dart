import 'package:flutter/material.dart';
import 'package:online_book_shop/data_service/book_service.dart';

class ViewPublisher extends StatelessWidget {
  BookService bookService = BookService();
  late List<Publisher> publishers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PublisherList>(
      future: bookService.getPublisher(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          publishers = snapshot.data!.publishers;
          return Container(
            height: 300,
            child: ListView.builder(
              itemCount: publishers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}."),
                  title: Text(publishers[index].name),
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
