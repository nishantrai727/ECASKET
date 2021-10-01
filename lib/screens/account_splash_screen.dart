import 'package:ECASKET/screens/account_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/dialog_Form.dart';

class AccountSplashScreen extends StatefulWidget {
  static const routeName = "/account-splash-screen";

  @override
  _AccountSplashScreenState createState() => _AccountSplashScreenState();
}

class _AccountSplashScreenState extends State<AccountSplashScreen> {


  
    void _onButtonTap() {
    showDialog(
      context: context,
      builder: (context) => DialogForm(),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account")
      ),
      body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please enter your account details..."),
                    FlatButton(
                      color: Theme.of(context).buttonColor,
                      onPressed: _onButtonTap,
                      child: Text("Tap here"),
                    )
                  ],
                ),
              )
    ); 
      
  }
}


