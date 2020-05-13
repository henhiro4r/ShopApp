import 'package:flutter/material.dart';
import 'package:shopapp/widget/ProductGrid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product',
        ),
      ),
      body: ProductGrid(),
    );
  }
}
