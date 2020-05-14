import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/Product.dart';
import 'package:shopapp/provider/ProductProvider.dart';
import 'package:shopapp/screen/ManageProductScreen.dart';

class UserProductAdapter extends StatelessWidget {
  final Product product;

  UserProductAdapter(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ManageProductScreen.routeName, arguments: product,);
              },
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).deleteProduct(product);
              },
              color: Theme
                  .of(context)
                  .errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
