import 'package:flutter/material.dart';
import 'package:shopapp/model/Product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => [..._products];

  void addProduct() {
//    _products.add(value);
    notifyListeners();
  }
}