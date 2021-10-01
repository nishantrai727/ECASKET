import 'package:ECASKET/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/account.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';

import './screens/home_screen.dart';
import './screens/all_categories_screen.dart';
import './screens/wishlist_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/account_screen.dart';
import './screens/specific_category_screen.dart';
import './screens/product_view.dart';
import './screens/favorites_screen.dart';
import './screens/auth_screen.dart';
import './screens/account_splash_screen.dart';

import './widgets/dev_options.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Account(),
        // ),
        ChangeNotifierProxyProvider<Auth, Account>(
          create: null,
          update: (ctx, auth, acc) => Account(
            auth.userId,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: null,
          update: (ctx, auth, prevOrders) => Orders(
            auth.userId,
            prevOrders == null ? [] : prevOrders.orders,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: "eCasket",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xff4D56B9),
            primaryColorLight: Color(0xffb4cfea),
            accentColor: Color(0xfff6dee7),
            fontFamily: "Nunito",
          ),
          home: auth.isAuth
              ? HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            AccountScreen.routeName: (ctx) => AccountScreen(),
            AllCategoriesScreen.routeName: (ctx) => AllCategoriesScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            WishlistScreen.routeName: (ctx) => WishlistScreen(),
            SpecificCategoryScreen.routeName: (ctx) => SpecificCategoryScreen(),
            ProductView.routeName: (ctx) => ProductView(),
            FavoritesScreen.routeName: (ctx) => FavoritesScreen(),
            DevOptions.routeName: (ctx) => DevOptions(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            AccountSplashScreen.routeName: (ctx)=> AccountSplashScreen()
          },
        ),
      ),
    );
  }
}
