import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomeScreenSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        StackWidget(
          "assets/images/home_screen/homescreenSlider/1.jpg",
          "Want an Upgrade?",
          "Here is Boat Bluetooth Headset!",
          "Shop Now!",
        ),
        StackWidget(
          "assets/images/home_screen/homescreenSlider/2.jpg",
          "Cool Gadget??",
          "Apple WATCH",
          "Wishlist Now!",
        ),
        StackWidget(
          "assets/images/home_screen/homescreenSlider/3.jpg",
          "This summer update yourself!",
          "With COOL Wayfarer",
          "20% Discount",
        ),
        StackWidget(
          "assets/images/home_screen/homescreenSlider/4.jpg",
          "Know your Best!",
          "Get NIKE AirMax",
          "Shop Now!",
        ),
        StackWidget(
          "assets/images/home_screen/homescreenSlider/5.jpg",
          "<Code Along>",
          "Get Macbook Pro!",
          "Order by 12am",
        ),
        StackWidget(
          "assets/images/home_screen/homescreenSlider/6.jpg",
          "Roam around this Season",
          "Get yourlself Flexy Apparels",
          "Up to 60% off",
        ),
      ],
      options: CarouselOptions(
        height: 180,
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        viewportFraction: 1,
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  final String imageUrl;
  final String line1;
  final String line2;
  final String line3;

  StackWidget(
    this.imageUrl,
    this.line1,
    this.line2,
    this.line3,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  line1,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.blueAccent),
                ),
              ),
              SizedBox(height:5),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  line2,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  line3,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
