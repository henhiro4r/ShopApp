import 'package:flutter/foundation.dart';
import 'package:shopapp/model/Cart.dart';
import 'package:shopapp/model/Product.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItem = {};

  Map<String, Cart> get cartItem => {..._cartItem};

  void addItem(Product product) {
    if (_cartItem.containsKey(product.id)) {
      _cartItem.update(
        product.id,
        (items) => Cart(
          id: items.id,
          title: items.title,
          quantity: items.quantity + 1,
          price: items.price,
        ),
      );
    } else {
      _cartItem.putIfAbsent(
        product.id,
        () => Cart(
            id: DateTime.now().toString(),
            title: product.title,
            quantity: 1,
            price: product.price),
      );
    }
    notifyListeners();
  }

  int get itemCount {
    return _cartItem.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItem.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
  
  void removeItem(String id) {
    _cartItem.remove(id);
    notifyListeners();
  }

  void clear() {
    _cartItem = {};
    notifyListeners();
  }
}
