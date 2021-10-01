import 'package:ECASKET/providers/cart.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/orders.dart';

import './sub-screens/orders/order_tile.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).setAndFetchOrders(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text("An error occured!"),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, i) => OrderTile(
                      orderData.orders[i].title,
                      orderData.orders[i].imageUrl,
                      orderData.orders[i].quantity,
                      orderData.orders[i].price,
                      orderData.orders[i].dateTime,
                    ),
                  ),
                );
              }
            }
          },
        ));
  }
}
