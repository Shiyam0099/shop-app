import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/foundation/key.dart';

import '../providers/order.dart';

class OrderListItem extends StatefulWidget {
  final OrderItem orders;

  OrderListItem(this.orders);

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('\$${widget.orders.amount}'),
          subtitle: Text(DateFormat.yMMMd().format(widget.orders.date)),
          trailing: IconButton(
            icon: _expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
              print(_expanded);
            },
          ),
        ),
        Divider(),
        if (_expanded)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: min(widget.orders.products.length * 20.0 + 10.0, 100.0),
            child: ListView(children: [
              ...widget.orders.products
                  .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${e.title}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('${e.quantity} x \$${e.price}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey))
                        ],
                      ))
                  .toList()
            ]),
          )
      ]),
    );
  }
}
