import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../specific_category_screen.dart';

import '../../../providers/products.dart';
import '../../../providers/product.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.lightBlue[600],
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/home_screen/homescreenoffers/crosswave.png"))),
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        children: [
          ContainerWidget("assets/images/home_screen/homescreenoffers/1.jpg",
              "Stools & Chairs", "From ₹899", "Furniture"),
          ContainerWidget("assets/images/home_screen/homescreenoffers/2.jpg",
              "Naturals offer", "Up to 30% Off", "Beauty"),
          ContainerWidget("assets/images/home_screen/homescreenoffers/3.jpg",
              "Summer Utensils", "Get it for ₹299", "Home"),
          ContainerWidget("assets/images/home_screen/homescreenoffers/4.jpg",
              "Tresndy Footwears", "From ₹999", "Faishon"),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String line1;
  final String line2;
  final String category;

  ContainerWidget(this.imageUrl, this.line1, this.line2, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SpecificCategoryScreen.routeName, arguments: category);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            left: 5,
            right: 5,
            bottom: 5,
            child: Container(
              height: 50,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      line1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      line2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.green,
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
