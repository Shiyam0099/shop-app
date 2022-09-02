import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_products_page.dart';
import '../providers/product_provider.dart';

class ProductManageItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductManageItems({this.id, this.title, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(title),
      trailing: Container(
        width: 96,
        child: Row(children: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductPage.routeName, arguments: id);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              Provider.of<ProductProvider>(context, listen: false)
                  .deleteProduct(id);
            },
          )
        ]),
      ),
    );
  }
}
