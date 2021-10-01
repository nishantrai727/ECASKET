import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/products.dart';
import '../../../providers/product.dart';

import '../../product_view.dart';

class FlexAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product prod = Provider.of<Products>(context).getProduct("m001");

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductView.routeName, arguments: prod);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 180,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/home_screen/homescreenflexadd/1.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              right: 5,
              child: Container(
                height: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stay Dope On the Go! APPLE iPhone",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                        Text(
                          "Shop Now",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        ">",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )
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
