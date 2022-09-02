import 'package:flutter/material.dart';
import '../screens/product_manage_page.dart';
import '../screens/order_page.dart';
import '../screens/product_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Browse Pages'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Your Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductManagePage.routeName);
            },
          )
        ],
      ),
    );
  }
}
