import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/product.dart';

class Cart {
  final String id;
  final String title;
  final double price;
  final int quantity;

  Cart({this.id, this.title, this.price, this.quantity});
}

class CartItem with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int get productQuantity {
    return items.length;
  }

  double get totalPrice {
    double total = 0.0;
    items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItems(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => Cart(
                id: existingItem.id,
                title: existingItem.title,
                price: existingItem.price,
                quantity: existingItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingItem) => Cart(
              id: existingItem.id,
              title: existingItem.title,
              price: existingItem.price,
              quantity: existingItem.quantity - 1));
    }
    if (_items[id].quantity == 1) {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
