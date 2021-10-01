import 'package:flutter/foundation.dart';

import './products.dart';

// import 'package:provider/provider.dart';

class Product with ChangeNotifier {
  final String id;
  final String category;
  final double price;
  final String title;
  final String imageUrl;
  final String offerTag;
  final String offerDescription;

  bool isFavorite;

  Product({
    @required this.id,
    @required this.category,
    @required this.price,
    @required this.title,
    @required this.imageUrl,
    this.offerTag,
    this.offerDescription,
    this.isFavorite=false,
  });

  
  


}
