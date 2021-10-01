import 'package:flutter/material.dart';

class WishlistTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/allCategoryScreen/1.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                child: Text("Faishon"),
              )
            ],
          ),
          Positioned(
            right: 3,
            top: 3,
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                // radius: 16,
                backgroundColor: Colors.white70,
                foregroundColor: Colors.grey,
                child: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
