import 'package:flutter/material.dart';
import 'package:online_book_shop/data_service/book_service.dart';
import 'package:online_book_shop/pages/author.dart';
import 'dart:ui';

import 'package:online_book_shop/pages/books.dart';
import 'package:online_book_shop/pages/publisher.dart';
import 'package:online_book_shop/pages/searchResult.dart';
import 'package:online_book_shop/pages/subject.dart';

enum ShowSelectedType { book, subject, author, publisher, searchResult }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ShowSelectedType showSelectedType = ShowSelectedType.book;
  String searchKeyWord = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFe6e6e6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const InkWell(
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          const InkWell(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {},
              child: const Text(
                "Sign In",
                style: TextStyle(),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              child: Container(
                height: size.height * 0.1,
                width: 500,
                child: Container(
                  width: double.maxFinite,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        showSelectedType = ShowSelectedType.searchResult;
                        searchKeyWord = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black12, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black38, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                           setState(() {
                        showSelectedType = ShowSelectedType.searchResult;
                       
                      });
                        },
                        child: const Material(
                          color: Colors.blue,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(
                  color: Colors.black38,
                ),
              ),
              height: size.height * 0.07,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    // etc.
                  },
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: const Text("Python Algorithms"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: const Text("Python"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: const Text("Javascript"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSelectedType = ShowSelectedType.book;
                    });
                  },
                  child: Text(
                    "Books",
                    style: TextStyle(
                      color: showSelectedType == ShowSelectedType.book
                          ? Colors.deepOrange
                          : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSelectedType = ShowSelectedType.subject;
                    });
                  },
                  child: Text(
                    "Subjects",
                    style: TextStyle(
                      color: showSelectedType == ShowSelectedType.subject
                          ? Colors.deepOrange
                          : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSelectedType = ShowSelectedType.author;
                    });
                  },
                  child: Text(
                    "Author",
                    style: TextStyle(
                      color: showSelectedType == ShowSelectedType.author
                          ? Colors.deepOrange
                          : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showSelectedType = ShowSelectedType.publisher;
                    });
                  },
                  child: Text(
                    "Publisher",
                    style: TextStyle(
                      color: showSelectedType == ShowSelectedType.publisher
                          ? Colors.deepOrange
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            if (showSelectedType == ShowSelectedType.book) ViewBooks(),
            if (showSelectedType == ShowSelectedType.author) ViewAuthor(),
            if (showSelectedType == ShowSelectedType.publisher) ViewPublisher(),
            if (showSelectedType == ShowSelectedType.subject) ViewSubject(),
            if (showSelectedType == ShowSelectedType.searchResult)
             searchKeyWord == "" ?ViewBooks() : SearchResult(keyword: searchKeyWord),
          ],
        ),
      ),
    );
  }
}

// 25:09

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
