import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';
import '../screens/all_categories_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';
import '../screens/account_screen.dart';
import '../widgets/dev_options.dart';
import '../providers/auth.dart';
import '../screens/account_splash_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("E-Casket"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text("All Category"),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(AllCategoriesScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(CartScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Orders"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            hoverColor: Colors.grey,
            leading: Icon(Icons.favorite),
            title: Text("Wishlist"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(WishlistScreen.routeName);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(AccountSplashScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Dev-options"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(DevOptions.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pop();

              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Made with ❤ by Nishant"),
          )
        ],
      ),
    );
  }
}
