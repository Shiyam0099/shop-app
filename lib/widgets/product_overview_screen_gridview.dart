import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_overview_screen_items.dart';
import '../providers/product_provider.dart';

class ProductOverviewScreenGridview extends StatelessWidget {
  final bool showFav;

  ProductOverviewScreenGridview(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(
        context); //this gives an object of the class ProductProvider not 'items' and now we are litening to changes
    final loadedProduct = showFav
        ? productsData.showFavoritesOnly
        : productsData.items; //this provides 'items' through getter

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProduct.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          //this kind of provider is better to use when the object ex('loadedProduct') is already instantiated.
          value: loadedProduct[index],
          child: ProductOverviewScreenItems(),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
