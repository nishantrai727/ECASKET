import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../../../providers/products.dart';
import '../../../providers/product.dart';

import '../../product_view.dart';

class SectionContent extends StatelessWidget {
  final List<String> prodIds;
  SectionContent(this.prodIds);

  @override
  Widget build(BuildContext context) {
    Product prod1 = Provider.of<Products>(context).getProduct(prodIds[0]);
    Product prod2 = Provider.of<Products>(context).getProduct(prodIds[1]);
    Product prod3 = Provider.of<Products>(context).getProduct(prodIds[2]);

    String category = prod1.category;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColorLight.withOpacity(0.2),
                Theme.of(context).primaryColorLight.withOpacity(1),
              ],
              ),
          color: Colors.blueGrey[100]),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductView.routeName,
                  arguments: prod1);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$category For You",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text("View all",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductView.routeName,
                  arguments: prod2);
            },
            child: Container(
              height: 350,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            width: 220,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  prod1.imageUrl,
                                ),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            children: [
                              Text(
                                prod1.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "₹" + prod1.price.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    (prod1.price + 20000).toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    prod1.offerTag,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductView.routeName,
                                    arguments: prod2);
                              },
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              prod2.imageUrl,
                                            ),
                                            fit: BoxFit.cover
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: 50,
                                      child: Column(
                                        children: [
                                          Text(
                                            prod2.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "₹" + prod2.price.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductView.routeName,
                                    arguments: prod3);
                              },
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              prod3.imageUrl,
                                            ),
                                            fit: BoxFit.cover
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: 50,
                                      child: Column(
                                        children: [
                                          Text(
                                            prod3.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "₹" + prod3.price.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
