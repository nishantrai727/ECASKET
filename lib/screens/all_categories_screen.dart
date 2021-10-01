import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

import './sub-screens/all_categories/Category.dart';
import '../widgets/appbar_actions.dart';

class AllCategoriesScreen extends StatelessWidget {
  static const routeName = "/all-category-screen";

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<Products>(context).categoriesName;
    final categoryList = categoryData;

    

    return Scaffold(
        appBar: AppBar(
          title: Text("All Categories"),
          actions: [
            AppBarActions()
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColorLight.withOpacity(0.5),
            Theme.of(context).primaryColorLight.withOpacity(1),
          ],
        ),
          ),
          child: GridView.builder(
            itemCount: categoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              childAspectRatio: 8 / 10,
            ),
            itemBuilder: (ctx, i) => Category(
              categoryList[i].catName,
              categoryList[i].catImg
            ),
          ),
        ));
  }
}
