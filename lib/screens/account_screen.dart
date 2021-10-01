import '../providers/account.dart';
import 'package:ECASKET/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/orders_screen.dart';



class AccountScreen extends StatefulWidget {
  static const routeName = "/account-screen";

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // bool _isRegistered;
  String name = "Nishant";
  String email = "";
  String phoneNum = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    name = Provider.of<Account>(context).globname;
    email = Provider.of<Account>(context).globemail;
    phoneNum = Provider.of<Account>(context).globphoneNum;
    address = Provider.of<Account>(context).globaddress;

    

    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      drawer: AppDrawer(),
      body:
          SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 48,
                      // backgroundColor: Colors.grey[100],
                      backgroundImage:
                          AssetImage("assets/images/account_screen/hero.png"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    phoneNum,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Container(
                padding: EdgeInsets.all(10),
                // height: 12  0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Orders",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        FlatButton(
                          color: Colors.white,
                          child: Text("VIEW ALL ORDERS"),
                          onPressed: (){
                            Navigator.of(context).popAndPushNamed(OrdersScreen.routeName);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Container(
                padding: EdgeInsets.all(10),
                // height: 12  0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Address",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text(address)
                  ],
                ),
              ),
            ),
            
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/account_screen/heroine.png"))
              ),
            )
          ],
        ),
      ),
    );
  }
}
