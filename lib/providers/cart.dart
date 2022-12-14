import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String prductId;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.prductId,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  var total = 0.0;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    notifyListeners();
    return total;
  }

  void addItem(String productId,
      double price,
      String title,) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
            (existingCartItem) =>
            CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              prductId: existingCartItem.prductId,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
            ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () =>
            CartItem(
              id: DateTime.now().toString(),
              title: title,
              prductId: productId,
              price: price,
              quantity: 1,
            ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId,);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(productId, (existingCartItem) =>
          CartItem(id: existingCartItem.id,
              prductId: existingCartItem.prductId,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}

