import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/product_details_page.dart';
import 'package:shopping_app/pages/product_list.dart';

class AppBottomNavigator extends StatefulWidget {
  const AppBottomNavigator({super.key});

  @override
  State<AppBottomNavigator> createState() => _AppBottomNavigatorState();
}

int _bottomNavigationBarIndex = 0;
List<Widget> pages = [
  HomePage(),
  ProductList(),
];

class _AppBottomNavigatorState extends State<AppBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationBarIndex,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (index) {
          setState(() {
            _bottomNavigationBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
        ],
      ),
      body: IndexedStack(
        index: _bottomNavigationBarIndex,
        children: pages,
      ),
    );
  }
}
