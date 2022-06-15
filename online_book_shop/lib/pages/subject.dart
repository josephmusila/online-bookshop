import 'package:flutter/material.dart';
import 'package:online_book_shop/data_service/book_service.dart';

class ViewSubject extends StatelessWidget {
  BookService bookService = BookService();
  late List<Subject> subjects;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SubjectList>(
      future: bookService.getSubject(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          subjects = snapshot.data!.subjects;
          return Container(
            height: 300,
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}."),
                  title: Text(subjects[index].name),
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
