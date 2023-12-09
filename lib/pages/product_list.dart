import 'package:flutter/material.dart';
import 'package:shopping_app/data/available_products.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var cart = [
    availableProducts[0],
    availableProducts[1],
    availableProducts[4],
    availableProducts[5],
    availableProducts[6],
    availableProducts[8],
    availableProducts[0],
    availableProducts[1],
    availableProducts[4],
    availableProducts[5],
    availableProducts[6],
    availableProducts[8],
    availableProducts[0],
    availableProducts[1],
    availableProducts[4],
    availableProducts[5],
    availableProducts[6],
    availableProducts[8],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            leading: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(cart[index].imagePath),
            ),
            title: Text(
              cart[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Size: ${cart[index].sizes[0]}"),
          );
        },
      ),
    );
  }
}
