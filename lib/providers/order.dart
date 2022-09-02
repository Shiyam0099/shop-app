import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime date;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.date});
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrders(List<Cart> products, double amount) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: amount,
            products: products,
            date: DateTime.now()));

    print('add orders');
    print(_orders);
    notifyListeners();
  }
}
