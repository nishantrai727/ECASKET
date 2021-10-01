import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import './product.dart';

class CartItem {
  String productId;
  String productName;
  double price;
  int quantity;
  String imageUrl;

  CartItem({
    this.productId,
    this.productName,
    this.price,
    this.quantity,
    this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }

  double get total {
    double sum = 0;
    items.forEach((productId, item) => {sum = sum + item.price});

    return sum;
  }


  void addItem(
    String prodId,
    String prodName,
    double prodPrice,
    String imgUrl,
  ) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingCartItem) => CartItem(
              productId: existingCartItem.productId,
              productName: existingCartItem.productName,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
              imageUrl: existingCartItem.imageUrl));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartItem(
              productId: prodId,
              productName: prodName,
              price: prodPrice,
              imageUrl: imgUrl,
              quantity: 1));
    }
    
    notifyListeners();
  }

  void removeItem(String productId){

    _items.remove(productId);
    notifyListeners();

  }

  void clear(){
    _items={};
    notifyListeners();
  }


}
