import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/CartProvider.dart';
import 'package:shopapp/provider/ProductProvider.dart';
import 'package:shopapp/screen/CartScreen.dart';
import 'package:shopapp/screen/ProductDetailScreen.dart';
import 'package:shopapp/screen/ProductOverviewScreen.dart';

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
        },
      ),
    );
  }
}
