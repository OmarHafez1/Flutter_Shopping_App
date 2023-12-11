import 'package:shopping_app/data/product.dart';

class Item {
  Product _product;
  num _selectedSize;
  Item(
    this._product,
    this._selectedSize,
  );

  String get imagePath => _product.imagePath;
  double get price => _product.price;
  num get size => _selectedSize;
  List<num> get sizes => _product.sizes;
  String get title => _product.title;
}
