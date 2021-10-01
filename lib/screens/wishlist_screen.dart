import 'package:flutter/material.dart';

import './sub-screens/wishlist/whislist_tile.dart';


class WishlistScreen extends StatelessWidget {

  static const routeName = "/wishlist-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whishlist")
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9/10,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0
        ),
        children: [
          WishlistTile(),
          WishlistTile(),
          WishlistTile(),
          WishlistTile(),
          WishlistTile(),
          WishlistTile(),
          WishlistTile(),
          WishlistTile(),
        ],
      ),
    );
  }
}

