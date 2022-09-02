import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appDrawer.dart';
import '../providers/order.dart';
import '../widgets/order_list_item.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      body: ListView.builder(
        itemBuilder: ((context, index) =>
            OrderListItem(orderData.orders[index])),
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
