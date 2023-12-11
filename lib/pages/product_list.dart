import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/available_products.dart';
import 'package:shopping_app/data/item.dart';
import 'package:shopping_app/selected_items.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: context.watch<SelectedItems>().selectedItemsLength,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delete Item"),
                      content:
                          Text("Are sure that you want to delete this item?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<SelectedItems>(context, listen: false)
                                .deleteItem(
                              context
                                  .read<SelectedItems>()
                                  .getSelectedItemAt(index),
                            );
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                    ;
                  },
                );
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            leading: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                context
                    .watch<SelectedItems>()
                    .getSelectedItemAt(index)
                    .imagePath,
              ),
            ),
            title: Text(
              context.watch<SelectedItems>().getSelectedItemAt(index).title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "Size: ${context.watch<SelectedItems>().getSelectedItemAt(index).size}"),
          );
        },
      ),
    );
  }
}
