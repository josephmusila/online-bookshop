import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // TODO: implement build
   return Container(
      margin: const EdgeInsets.all(10.0),
      height: size.height * 0.20,
      width: size.width * 0.32,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            "Book Name",
          ),
          Text(
            "Book price",
          ),
          Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(),
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
  }
}
