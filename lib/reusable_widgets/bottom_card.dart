import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/item.dart';
import 'package:shopping_app/data/product.dart';
import 'package:shopping_app/reusable_widgets/wide_button.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/selected_items.dart';

class BottomCard extends StatefulWidget {
  Product _product;
  BottomCard(
    this._product, {
    super.key,
  });

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  int _selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        color: KChipColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(
              "\$${widget._product.price}",
              style: KTitleTextStyle,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget._product.sizes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _selectedSize =
                                (_selectedSize == index ? -1 : index);
                          },
                        );
                      },
                      child: Chip(
                        color: MaterialStateProperty.all(
                          index == _selectedSize
                              ? KSelectedChipColor
                              : KChipColor,
                        ),
                        label: Text(widget._product.sizes[index].toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: WideButton(
                text: "Add To Cart",
                icon: Icons.shopping_cart_outlined,
                onPressed: () {
                  if (_selectedSize == -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            const Text('Please select the size of the item'),
                      ),
                    );
                  } else {
                    Provider.of<SelectedItems>(
                      context,
                      listen: false,
                    ).addItem(
                      Item(
                        widget._product,
                        widget._product.sizes[_selectedSize],
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            const Text('Item added to the cart successfully'),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
