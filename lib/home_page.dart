import 'package:flutter/material.dart';
import 'package:shopping_app/available_products.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/filters_chip.dart';
import 'package:shopping_app/product_card.dart';

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

  int selectedChip = 0;

  @override
  Widget build(BuildContext context) {
    Color KChipColor = Color.fromRGBO(245, 247, 249, 1);
    Color KSelectedChipColor = Theme.of(context).primaryColor;
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
                          selectedChip = index;
                        });
                      },
                      child: FiltersChip(
                        text: filters[index],
                        color: index == selectedChip
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
                itemCount: 11,
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
