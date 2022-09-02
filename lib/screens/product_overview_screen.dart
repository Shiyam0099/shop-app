import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/product_overview_screen_gridview.dart';
import '../widgets/badge.dart';
import './cart_page.dart';
import '../widgets/appDrawer.dart';

enum ShowProducts { all, favorite }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _setFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Show All'), value: ShowProducts.all),
              PopupMenuItem(
                  child: Text('Show Favorites'), value: ShowProducts.favorite)
            ],
            onSelected: (ShowProducts selectedVal) {
              setState(() {
                if (selectedVal == ShowProducts.all) {
                  _setFavorites = false;
                }
                if (selectedVal == ShowProducts.favorite) {
                  _setFavorites = true;
                }
              });
            },
          ),
          Consumer<CartItem>(
            builder: (context, cart, child) => Badge(
              child: child,
              value: cart.productQuantity.toString(),
              color: Theme.of(context).accentColor,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartPage.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductOverviewScreenGridview(_setFavorites),
    );
  }
}
