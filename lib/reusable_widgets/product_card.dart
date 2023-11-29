import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';

class ProductCard extends StatelessWidget {
  String title, price, imagePath;
  Color color;
  ProductCard({
    required this.title,
    required this.price,
    required this.color,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: KSmallTitleTextStyle,
            ),
            Text(
              "\$$price",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            Image.asset(
              imagePath,
            ),
          ],
        ),
      ),
    );
  }
}
