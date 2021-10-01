import 'package:flutter/material.dart';



class CartSplashScreen extends StatefulWidget {

  @override
  _CartSplashScreenState createState() => _CartSplashScreenState();
}

class _CartSplashScreenState extends State<CartSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(child: Text("Cart is empty...Go shop now..."),),
    );
  }
}