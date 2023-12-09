import 'package:flutter/material.dart';
import 'package:shopping_app/data/available_products.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/pages/app_bottom_navigator.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/product_details_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: KPrimaryColor,
          primary: KPrimaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(156, 156, 156, 1),
        ),
        useMaterial3: true,
      ),
      home: AppBottomNavigator(),
    );
  }
}
