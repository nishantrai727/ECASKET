import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sub-screens/specific_category/category_product.dart';

import '../providers/products.dart';
import '../providers/product.dart';

import '../widgets/appbar_actions.dart';

class SpecificCategoryScreen extends StatefulWidget {
  static const routeName = "/specific-category-screen";

  @override
  _SpecificCategoryScreenState createState() => _SpecificCategoryScreenState();
}

class _SpecificCategoryScreenState extends State<SpecificCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final String categoryName = ModalRoute.of(context).settings.arguments;

    List<Product> items =
        Provider.of<Products>(context).fetchAndSetCategoryList(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        actions: [
            AppBarActions()
          ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: ListView.separated(
          padding: EdgeInsets.all(5),
          separatorBuilder: (ctx, i) => const SizedBox(
            height: 5
          ),
          itemCount: items.length,
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 20,
          //     mainAxisSpacing: 20,
          //     childAspectRatio: 4 / 5),
          itemBuilder: (ctx, i) => CategoryProduct(items[i]),
        ),
      ),
    );
  }
}
