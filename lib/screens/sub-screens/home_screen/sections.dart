import 'package:flutter/material.dart';

import '../../specific_category_screen.dart';

class HomeScreenSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blueGrey[50]),
      padding: EdgeInsets.all(15),
      height: 210,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 9 / 10,
            mainAxisSpacing: 20,
            crossAxisSpacing: 0),
        children: [
          ColumnWidget("assets/images/home_screen/homescreenSections/1.png","Mobiles"),
          ColumnWidget("assets/images/home_screen/homescreenSections/2.png","Faishon"),
          ColumnWidget("assets/images/home_screen/homescreenSections/3.png","Electronics"),
          ColumnWidget("assets/images/home_screen/homescreenSections/4.png","Home"),
          ColumnWidget("assets/images/home_screen/homescreenSections/5.png","Appliances"),
          ColumnWidget("assets/images/home_screen/homescreenSections/6.png","Beauty"),
          ColumnWidget("assets/images/home_screen/homescreenSections/7.png","Toys"),
          ColumnWidget("assets/images/home_screen/homescreenSections/8.png","Furniture"),
          ColumnWidget("assets/images/home_screen/homescreenSections/9.png","Sports"),
          ColumnWidget("assets/images/home_screen/homescreenSections/10.png","Grocery"),
   
          
        ],
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {

  final String imageUrl;
  final String categoryName;

  ColumnWidget(
    this.imageUrl,
    this.categoryName
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
                Navigator.of(context).pushNamed(SpecificCategoryScreen.routeName,arguments: categoryName);

      },
          child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                image: DecorationImage(image: AssetImage(imageUrl))
              ),
            ),
          ),
          SizedBox(height:4),
          Text(categoryName,style: TextStyle(
            fontSize: 13
          ),)
        ],
      ),
    );
  }
}
