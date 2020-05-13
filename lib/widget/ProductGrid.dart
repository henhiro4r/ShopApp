import 'package:flutter/material.dart';
import 'package:shopapp/adapter/ProductAdapter.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/ProductProvider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final productList = productData.products;
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productList[i],
        child: ProductAdapter(),
      ),
      itemCount: productList.length,
    );
  }
}