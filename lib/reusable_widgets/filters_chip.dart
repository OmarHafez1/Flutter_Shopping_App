import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';

class FiltersChip extends StatelessWidget {
  Color color;
  String text;
  FiltersChip({
    required this.color,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      label: Text(
        text,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 15,
      ),
      labelStyle: TextStyle(
        fontSize: 14,
      ),
      shape: KFilterChipBorder,
    );
  }
}
