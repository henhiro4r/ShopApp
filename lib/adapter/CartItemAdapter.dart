import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/Cart.dart';
import 'package:shopapp/provider/CartProvider.dart';

class CartItemAdapter extends StatelessWidget {
  final Cart cart;
  final String cartKey;

  CartItemAdapter(this.cart, this.cartKey);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cart.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 32,
        ),
        padding: EdgeInsets.only(right: 16),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove this item?',),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(ctx).pop(false);
              }, child: Text('No')),
              FlatButton(onPressed: () {
                Navigator.of(ctx).pop(true);
              }, child: Text('Yes')),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<CartProvider>(context, listen: false)
            .removeProduct(cartKey);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(
                  child: Text('\$${cart.price}'),
                ),
              ),
            ),
            title: Text(cart.title),
            subtitle: Text(
                'Total: \$${(cart.price * cart.quantity).toStringAsFixed(2)}'),
            trailing: Text('${cart.quantity}x'),
          ),
        ),
      ),
    );
  }
}
