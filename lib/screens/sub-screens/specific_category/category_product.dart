import 'package:flutter/material.dart';

import '../../../providers/product.dart';
import '../../product_view.dart';

class CategoryProduct extends StatelessWidget {
  final Product prod;

  CategoryProduct(this.prod);

  String addPrice() {
    var newPrice = (prod.price * 105) / 100;
    return newPrice.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).pushNamed(ProductView.routeName,arguments: prod);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 180,
        child: Row(
          children: [
            Container(
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(prod.imageUrl), fit: BoxFit.fill)),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prod.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                      children: [
                        Text(
                          "\₹" + prod.price.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
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
                          width: 5,
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
                      height: 2,
                    ),
                    Text(prod.offerDescription),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
