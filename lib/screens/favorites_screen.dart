import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import './product_view.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = "/favorites";

  @override
  Widget build(BuildContext context) {
    final List<Product> favorites =
        Provider.of<Products>(context).favoriteItems;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: GridView.builder(
          itemCount: favorites.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (ctx, i) => GestureDetector(
            onTap:()=> Navigator.of(context).pushNamed(ProductView.routeName,arguments: favorites[i]),
                      child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(favorites[i].imageUrl))),
                      )),
                      Container(
                          padding: EdgeInsets.all(4),
                          height: 40,
                          child: Column(
                            children: [
                              Text(
                                favorites[i].title,
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "₹" + favorites[i].price.toString(),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
          )),
    );
  }
}
