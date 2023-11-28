import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: KPrimaryColor,
          primary: KPrimaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
