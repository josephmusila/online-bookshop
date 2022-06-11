import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_book_shop/data_service/book_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BookService bookService = BookService();
  late List<Book> books;

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
                      //Do something with the user input.
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
                        onTap: () {},
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
                  onPressed: () {},
                  child: const Text(
                    "Subjects",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Author",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Publisher",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<ListOfBook>(
                future: bookService.getBook(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(book.name,
                                          style: const TextStyle(
                                            backgroundColor: Color.fromARGB(
                                                136, 255, 255, 255),
                                          )),
                                      Text(
                                        "Price: Ksh${book.price.toString()}",
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.red,
                                          backgroundColor: Color.fromARGB(
                                              136, 255, 255, 255),
                                        ),
                                      ),
                                      Text(
                                        "Discounted Price: Ksh${book.priceWithDiscount.toString()}",
                                        style: const TextStyle(
                                          backgroundColor: Color.fromARGB(
                                              136, 255, 255, 255),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(
                                          8,
                                        ),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
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
                }),
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
