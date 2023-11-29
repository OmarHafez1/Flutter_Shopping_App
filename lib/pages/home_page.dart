import 'package:flutter/material.dart';
import 'package:shopping_app/data/available_products.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/reusable_widgets/filters_chip.dart';
import 'package:shopping_app/reusable_widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filters = [
    "All",
    "Addidas",
    "Nike",
    "Beta",
  ];

  int _selectedChip = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 50,
              ),
              child: Row(
                children: [
                  Text(
                    "Shoes\nCollection",
                    style: KTitleTextStyle,
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search",
                        border: KSearchBorder,
                        enabledBorder: KSearchBorder,
                        focusedBorder: KSearchBorder,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedChip = index;
                        });
                      },
                      child: FiltersChip(
                        text: filters[index],
                        color: index == _selectedChip
                            ? KSelectedChipColor
                            : KChipColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: availableProducts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: ProductCard(
                      title: availableProducts[index].title,
                      price: availableProducts[index].price.toString(),
                      color: index.isEven
                          ? KProductCardBlueColor
                          : KProductCardWhiteColor,
                      imagePath: availableProducts[index].imagePath,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
