import 'package:flutter/material.dart';
import 'package:shopping_app/reusable_widgets/wide_button.dart';
import 'package:shopping_app/constants.dart';

int _selectedSize = -1;

class BottomCard extends StatefulWidget {
  String price;
  List<num> sizes;
  BottomCard({
    required this.price,
    required this.sizes,
    super.key,
  });

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
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
              "\$${widget.price}",
              style: KTitleTextStyle,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.sizes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _selectedSize = index;
                          },
                        );
                      },
                      child: Chip(
                        color: MaterialStateProperty.all(
                          index == _selectedSize
                              ? KSelectedChipColor
                              : KChipColor,
                        ),
                        label: Text(widget.sizes[index].toString()),
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
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
