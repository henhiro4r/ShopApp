import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/adapter/UserProductAdapter.dart';
import 'package:shopapp/navigation/AppDrawer.dart';
import 'package:shopapp/provider/ProductProvider.dart';
import 'package:shopapp/screen/ManageProductScreen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ManageProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: <Widget>[
              UserProductAdapter(productData.products[i]),
              Divider(),
            ],
          ),
          itemCount: productData.products.length,
        ),
      ),
    );
  }
}
