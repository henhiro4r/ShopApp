import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/ProductProvider.dart';
import 'package:shopapp/widget/ProductGrid.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product',
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOption val) {
              if  (val == FilterOption.Favorite) {
                products.showFavorite();
              } else {
                products.showAll();
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOption.Favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
