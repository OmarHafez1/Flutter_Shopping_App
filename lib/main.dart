import 'package:flutter/material.dart';
import 'package:shopping_app/AvailableProducts.dart';

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
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(
        50,
      ),
    ),
  );
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
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
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
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
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
                      child: Chip(
                        backgroundColor: index == selectedChip
                            ? KSelectedChipColor
                            : KChipColor,
                        label: Text(
                          filters[index],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                          side: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0),
                            width: 0,
                          ),
                        ),
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: index.isEven
                            ? Color.fromRGBO(216, 240, 253, 1)
                            : Color.fromRGBO(245, 247, 249, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              availableProducts[index].title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              style: TextStyle(
                                fontSize: 19,
                              ),
                              "\$${availableProducts[index].price.toString()}",
                            ),
                            Image.asset(
                              availableProducts[index].imagePath,
                            ),
                          ],
                        ),
                      ),
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
