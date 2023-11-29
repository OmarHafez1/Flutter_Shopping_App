import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';

class WideButton extends StatelessWidget {
  String text;
  IconData icon;
  void Function() onPressed;
  WideButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.black,
          size: 30.0,
        ),
        onPressed: onPressed,
        style: KPrimaryButtonStyle,
        label: Text(text),
      ),
    );
  }
}
