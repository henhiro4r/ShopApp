import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/Cart.dart';
import 'package:shopapp/model/Product.dart';
import 'package:shopapp/provider/CartProvider.dart';
import 'package:shopapp/screen/ProductDetailScreen.dart';

class ProductAdapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (c, product, _) => IconButton(
              icon: product.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.addFavorite();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('1 ${product.title} added to cart'),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(label: 'Undo', onPressed: () {
                    cart.removeSingleItem(product.id);
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
