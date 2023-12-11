import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/reusable_widgets/wide_button.dart';
import 'package:shopping_app/reusable_widgets/bottom_card.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/data/product.dart';

class ProductDetailsPage extends StatelessWidget {
  Product product;
  ProductDetailsPage({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.title,
              style: KTitleTextStyle,
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(
                  product.imagePath,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: BottomCard(
                product,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
