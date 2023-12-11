import 'package:flutter/material.dart';
import 'package:shopping_app/data/item.dart';
import 'package:shopping_app/data/product.dart';

class SelectedItems extends ChangeNotifier {
  List<Item> _selectedItems = [];

  void addItem(Item item) {
    _selectedItems.add(item);
    notifyListeners();
  }

  void deleteItem(Item item) {
    _selectedItems.remove(item);
    notifyListeners();
  }

  int get selectedItemsLength => _selectedItems.length;
  Item getSelectedItemAt(int index) => _selectedItems[index];
}
