import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_list_item.dart';
import '../providers/order.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total :',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cartData.totalPrice}',
                    style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color),
                  ),
                  backgroundColor: Theme.of(context).accentColor,
                ),
                FlatButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrders(
                          cartData.items.values.toList(), cartData.totalPrice);
                      cartData.clear();
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 14),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: ((context, index) => CartListItem(
                id: cartData.items.values.toList()[index].id,
                productId: cartData.items.keys.toList()[index],
                title: cartData.items.values.toList()[index].title,
                price: cartData.items.values.toList()[index].price,
                quantity: cartData.items.values.toList()[index].quantity,
              )),
          itemCount: cartData.productQuantity,
        ))
      ]),
    );
  }
}
