import 'package:flutter/material.dart';
import 'package:shopapp/screen/CheckoutScreen.dart';
import 'package:shopapp/screen/UserProductScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Shop App'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Order List'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  CheckoutScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Manage Product'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  UserProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
