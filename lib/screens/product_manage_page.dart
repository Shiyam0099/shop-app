import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './edit_products_page.dart';
import '../widgets/appDrawer.dart';
import '../providers/product_provider.dart';
import '../widgets/product_manage_items.dart';

class ProductManagePage extends StatelessWidget {
  static const routeName = '/manage-products';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductPage.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: ListView.builder(
            itemBuilder: ((context, index) => ProductManageItems(
                  id: productData.items[index].id,
                  title: productData.items[index].title,
                  imageUrl: productData.items[index].imageUrl,
                )),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
