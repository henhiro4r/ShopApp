import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/adapter/CartItemAdapter.dart';
import 'package:shopapp/provider/CartProvider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartData.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Checkout'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 19,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartItemAdapter(
                cartData.cartItem.values.toList()[index],
                cartData.cartItem.keys.toList()[index],
              ),
              itemCount: cartData.itemCount,
            ),
          )
        ],
      ),
    );
  }
}
