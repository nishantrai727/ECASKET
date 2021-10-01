import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product.dart';

import '../screens/home_screen.dart';

class DevOptions extends StatelessWidget {

  static const routeName = "/dev-options";

  @override
  Widget build(BuildContext context) {
    void addProducts() {
      final List<Product> items = Provider.of<Products>(context,listen: false).items;

      items.forEach((prod) {
        Provider.of<Products>(context, listen: false).addProduct(prod);
      });

      Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            width: double.infinity,
            child: Text(
                "Press this key to add all the products in the Firestore database from the local device variable"),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () => addProducts(),color: Colors.blue,)
        ],
      ),
    );
  }
}
