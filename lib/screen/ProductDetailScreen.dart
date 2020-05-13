import 'package:flutter/material.dart';
import 'package:shopapp/model/Product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

//  ProductDetailScreen();

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
