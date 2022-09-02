import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartListItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartListItem(
      {this.id, this.productId, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.red.shade400,
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Remove',
              style: TextStyle(color: Colors.white60, fontSize: 20),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CartItem>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Remove item?'),
                  content: Text('Are you sure you want to remove this item?'),
                  actions: [
                    FlatButton(
                        onPressed: (() {
                          Navigator.of(context).pop(false);
                        }),
                        child: Text('No')),
                    FlatButton(
                        onPressed: (() {
                          Navigator.of(context).pop(true);
                        }),
                        child: Text('Yes'))
                  ],
                ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ListTile(
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColorLight,
              child: FittedBox(
                  child: Padding(
                padding: EdgeInsets.all(5),
                child: Text('\$$price'),
              ))),
          title: Text(title),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
