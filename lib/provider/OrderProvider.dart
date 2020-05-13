import 'package:flutter/foundation.dart';
import 'package:shopapp/model/Cart.dart';
import 'package:shopapp/model/Order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orderItems = [];

  List<Order> get orderItems {
    return [..._orderItems];
  }

  void addOrder(List<Cart> cart, double total) {
    _orderItems.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        products: cart,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
