import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/navigation/AppDrawer.dart';
import 'package:shopapp/provider/CartProvider.dart';
import 'package:shopapp/screen/CartScreen.dart';
import 'package:shopapp/widget/Badge.dart';
import 'package:shopapp/widget/ProductGrid.dart';

enum FilterOption {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product',
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOption val) => toggleFav(val),
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
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavorite),
    );
  }

  void toggleFav(val) {
    setState(() {
      if (val == FilterOption.Favorite) {
        _showOnlyFavorite = true;
      } else {
        _showOnlyFavorite = false;
      }
    });
  }
}
