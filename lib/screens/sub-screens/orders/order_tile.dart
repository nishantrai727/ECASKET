import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int quantity;
  final double price;
  final DateTime dateTime;

  OrderTile(this.title, this.imgUrl, this.quantity, this.price, this.dateTime);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                  image: DecorationImage(image: AssetImage(imgUrl))),
            )
          ],
        ));
  }
}
