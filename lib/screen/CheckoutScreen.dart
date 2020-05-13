import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/adapter/OrderAdapter.dart';
import 'package:shopapp/navigation/AppDrawer.dart';
import 'package:shopapp/provider/OrderProvider.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderAdapter(
          orders.orderItems[index],
        ),
        itemCount: orders.orderItems.length,
      ),
    );
  }
}
