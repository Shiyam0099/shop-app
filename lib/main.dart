import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_page.dart';
import './providers/product_provider.dart';
import './providers/cart.dart';
import './providers/order.dart';
import './screens/cart_page.dart';
import './screens/order_page.dart';
import './screens/product_manage_page.dart';
import './screens/edit_products_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => ProductProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => CartItem()),
        ),
        ChangeNotifierProvider(
          create: ((context) => Order()),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailPage.routeName: (context) => ProductDetailPage(),
          CartPage.routeName: (context) => CartPage(),
          OrderPage.routeName: (context) => OrderPage(),
          ProductManagePage.routeName: (context) => ProductManagePage(),
          EditProductPage.routeName: (context) => EditProductPage(),
        },
      ),
    );
  }
}
