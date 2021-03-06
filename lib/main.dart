import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/CartProvider.dart';
import 'package:shopapp/provider/OrderProvider.dart';
import 'package:shopapp/provider/ProductProvider.dart';
import 'package:shopapp/screen/CartScreen.dart';
import 'package:shopapp/screen/CheckoutScreen.dart';
import 'package:shopapp/screen/ManageProductScreen.dart';
import 'package:shopapp/screen/ProductDetailScreen.dart';
import 'package:shopapp/screen/ProductOverviewScreen.dart';
import 'package:shopapp/screen/UserProductScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.amber,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          ManageProductScreen.routeName: (ctc) => ManageProductScreen(),
        },
      ),
    );
  }
}
