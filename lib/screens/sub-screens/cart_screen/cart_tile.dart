import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../providers/cart.dart';

class   CartTile extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final double price;
  final int quantity;

  CartTile(
    this.id,
    this.title,
    this.imageurl,
    this.price,
    this.quantity,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Dismissible(
          key: ValueKey(id),
          background: Container(
            // color: Colors.red,
            child: Icon(
              Icons.delete,
              size: 50,
              color: Colors.white,
            ),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (dir) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Are you sure?"),
                content: Text("Do you really want to remove this item?"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Yes"),
                  ),
                ],
              ),
            );
          },
          onDismissed: (dir) {
            Provider.of<Cart>(context, listen: false).removeItem(id);
          },
          child: Row(
            children: [
              Expanded(
                
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Price : ₹" + price.toStringAsFixed(0)),
                      Text("Quantity :" + quantity.toStringAsFixed(0))
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imageurl))),
              )
            ],
          )),
    );
  }
}
