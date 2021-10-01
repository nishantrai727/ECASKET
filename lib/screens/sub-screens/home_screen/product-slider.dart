import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/products.dart';
import '../../../providers/product.dart';

import '../../product_view.dart';

class ProductSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColorLight.withOpacity(0.5),
            Theme.of(context).accentColor.withOpacity(0.8)
          ],
        ),
      ),
      padding: EdgeInsets.all(10),
      height: 300,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ClipRRectWidget("m002"),
            SizedBox(width: 5),
            ClipRRectWidget("f001"),
            SizedBox(width: 5),
            ClipRRectWidget("m001"),
            SizedBox(width: 5),
            ClipRRectWidget("e001"),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class ClipRRectWidget extends StatelessWidget {
  final String prodId;

  ClipRRectWidget(this.prodId);

  @override
  Widget build(BuildContext context) {
    Product prod = Provider.of<Products>(context).getProduct(prodId);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductView.routeName, arguments: prod);
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                height: 250,
                width: (2 / 3) * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    image: DecorationImage(
                  image: AssetImage(prod.imageUrl),
                )),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: (2 / 3) * MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Text(
                          prod.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "₹" + prod.price.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "₹" + (prod.price + 20000).toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              prod.offerTag,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
