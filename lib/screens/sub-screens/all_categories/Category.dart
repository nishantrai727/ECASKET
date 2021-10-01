import 'package:flutter/material.dart';

import '../../specific_category_screen.dart';

class Category extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  Category(this.categoryName, this.imageUrl);

  void onSelection() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(SpecificCategoryScreen.routeName,
            arguments: categoryName);
      },
      child: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          // color: Colors.blue
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 20,
              width: 100,
              child: Text(
                categoryName,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
