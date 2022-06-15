import 'package:flutter/material.dart';

import '../data_service/book_service.dart';

class SearchResult extends StatefulWidget {
  final String keyword;
   SearchResult({
    
    required this.keyword,
  });
  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  // const ViewBooks({ Key? key }) : super(key: key);
  BookService bookService = BookService();

  late List<Book> books;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<ListOfBook>(
        future: bookService.getBookBySearch(widget.keyword),
        builder: (context, snapshot) {
          var a = bookService.getBookBySearch("Python Algorithims");
          if (snapshot.hasData) {
            print(a);
            List<Book> books = snapshot.data!.books;
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              height: size.height * 0.5,
              width: double.infinity,
              color: Colors.white,
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    child: Text(
                      "Recently Sold Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const Divider(),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...books.map((book) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          height: size.height * 0.20,
                          width: size.width * 0.32,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(book.image_memory),
                                opacity: 0.5,
                                fit: BoxFit.cover),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(book.name,
                                  style: const TextStyle(
                                    backgroundColor:
                                        Color.fromARGB(136, 255, 255, 255),
                                  )),
                              Text(
                                "Price: Ksh${book.price.toString()}",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  backgroundColor:
                                      Color.fromARGB(136, 255, 255, 255),
                                ),
                              ),
                              Text(
                                "Discounted Price: Ksh${book.priceWithDiscount.toString()}",
                                style: const TextStyle(
                                  backgroundColor:
                                      Color.fromARGB(136, 255, 255, 255),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                  8,
                                ),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        190, 157, 179, 137),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Add to Cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  )
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
