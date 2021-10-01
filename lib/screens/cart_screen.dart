import 'package:ECASKET/screens/cart_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './sub-screens/cart_screen/cart_tile.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';

class RowWrap extends StatelessWidget {
  final String str;

  final double val;

  RowWrap(this.str, this.val);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          str,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "₹" + val.toStringAsFixed(2),
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class CartScreen extends StatelessWidget {
  static const routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return cart.items.length == 0
        ? CartSplashScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text("Cart"),
            ),
            body: Container(
                padding: EdgeInsets.only(bottom: 0),
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * (3 / 5),
                        child: ListView.builder(
                            itemCount: cart.items.length,
                            itemBuilder: (ctx, i) => CartTile(
                                  cart.items.values.toList()[i].productId,
                                  cart.items.values.toList()[i].productName,
                                  cart.items.values.toList()[i].imageUrl,
                                  cart.items.values.toList()[i].price,
                                  cart.items.values.toList()[i].quantity,
                                ))),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Divider(
                                thickness: 1,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "PRICE DETAILS",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    RowWrap("Price", cart.total),
                                    RowWrap("Discount", 80.00),
                                    RowWrap("Delivery Charges", 40.00),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    RowWrap("Total Amount", cart.total - 40),
                                  ],
                                ),
                              ),
                            ]),
                            OrderButton(cart),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
  }
}

class OrderButton extends StatelessWidget {
  final Cart cart;

  OrderButton(this.cart);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<Orders>(context, listen: false)
            .addOrder(cart.items.values.toList());
        Provider.of<Orders>(context, listen: false).setAndFetchOrders();
        cart.clear();
      },
      child: Text("Place Order"),
      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
    );
  }
}
