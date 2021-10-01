import 'package:ECASKET/screens/cart_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/products.dart';

import '../widgets/appbar_actions.dart';

class ProductView extends StatelessWidget {
  static const routeName = "/product-view";

  @override
  Widget build(BuildContext context) {

    final Product prod = ModalRoute.of(context).settings.arguments;
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [AppBarActions()],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(prod.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Consumer<Products>(
                      builder: (ctx, fav, ch) => ElevatedButton(
                        onPressed: () {
                          Provider.of<Products>(context,listen: false).toggleFavoriteStatus(prod.id);
                        },
                        child: Icon(
                          prod.isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: Colors.red,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.grey[300],
                            minimumSize: Size.fromRadius(25)),
                      ),
                    ),
                  )
                ],
              ),
              // Divider(),
              SizedBox(height: 10),
              DetailWidget(prod: prod),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: 50,
                  child: RaisedButton(
                    child: Text("ADD TO CART"),
                    onPressed: () {
                      cart.addItem(
                          prod.id, prod.title, prod.price, prod.imageUrl);
                    },
                  )),
            ),
            Expanded(
              child: Container(
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      "BUY NOW",
                    ),
                    onPressed: () {
                      cart.addItem(
                          prod.id, prod.title, prod.price, prod.imageUrl);
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    Key key,
    @required this.prod,
  }) : super(key: key);

  final Product prod;
  String addPrice() {
    var newPrice = (prod.price * 105) / 100;
    return newPrice.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            prod.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "4.6",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "(70,271)",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "\₹" + prod.price.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "₹" + addPrice(),
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "5% off",
                style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            prod.offerDescription,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
