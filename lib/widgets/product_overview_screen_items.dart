import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import '../screens/product_detail_page.dart';
import '../providers/product.dart';

class ProductOverviewScreenItems extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductOverviewScreenItems(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cartItem = Provider.of<CartItem>(context,
        listen: false); //it always calls build method
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title),
          leading: Consumer<Product>(
            //Consumer doesn't re-render whole but only required widget (Consumer always listens to changes)
            builder: (context, product, child) => IconButton(
              //here we use 'child' argument as ex. child: Text(..) to exclude a widget to build, after storing widget to child arg we then assign it where the widget is necessary
              icon: product.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavorite();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cartItem.addItems(product.id, product.title, product.price);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added item to the cart'),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cartItem.removeSingleItem(product.id);
                      }),
                ),
              );
            },
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailPage.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
