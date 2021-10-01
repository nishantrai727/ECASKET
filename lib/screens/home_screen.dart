import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/appbar_actions.dart';
import 'sub-screens/home_screen/slider.dart';
import 'sub-screens/home_screen/sections.dart';
import './sub-screens/home_screen/flex-add.dart';
import './sub-screens/home_screen/offers.dart';
import './sub-screens/home_screen/section-content.dart';
import './sub-screens/home_screen/product-slider.dart';

import '../providers/account.dart';

     
class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // bool firstTimeLogin =
    //     Provider.of<Account>(context, listen: false).firstTimeLogin;
    // print(firstTimeLogin);
    // if (!firstTimeLogin) {
    //   print("hit");
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return DialogForm();
    //       });
    // }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "eCasket",
          ),
          actions: [AppBarActions()],
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              margin: EdgeInsets.only(
                bottom: 7,
                left: 3,
                right: 3,
                top: 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Search for Products, Brands and More"),
                      )),
                      SizedBox(width: 10),
                      Container(
                          decoration: BoxDecoration(color: Colors.white60),
                          child: Icon(
                            Icons.mic,
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          toolbarHeight: kToolbarHeight + 60,
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeScreenSlider(),
            Divider(thickness: 1),
            HomeScreenSections(),
            Divider(thickness: 1),
            FlexAdd(),
            Divider(thickness: 1),
            Offers(),
            Divider(thickness: 1),
            SectionContent([
              "f001",
              "f004",
              "f007",
            ]),
            Divider(thickness: 1),
            SectionContent([
              "m001",
              "m004",
              "m005",
            ]),
            Divider(thickness: 1),
            ProductSlider(),
          ],
        )));
  }
}
