import '../providers/cart.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String imageUrl;
  final DateTime dateTime;

  OrderItem({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.imageUrl,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final String userId;
  List<OrderItem> _orders;

  Orders(this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void>  setAndFetchOrders() async {
    final url =
        "https://ecasket-a62f2-default-rtdb.firebaseio.com/$userId/orders.json";

    final response = await http.get(url);
    final List<OrderItem> loadedItems = [];

    final extractedData = json.decode(response.body) as Map<String,dynamic>;

    extractedData.forEach((orderId, orderData) {
      // String dateTime = orderData["dateTime"];
      List prodList = orderData["products"] as List<dynamic>;
      prodList.forEach((item) {
        loadedItems.add(OrderItem(
          id: item["id"],
          price: item["price"],
          quantity: item["quantity"],
          title: item["title"],
          imageUrl: item["imageUrl"],
          // dateTime: dateTime
        ));
       });
     });
    _orders = loadedItems;
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> products) async {
    final url =
        "https://ecasket-a62f2-default-rtdb.firebaseio.com/$userId/orders.json";
    final timestamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          "dateTime": timestamp.toIso8601String(),
          "products": products
              .map((cp) => {
                    "id": cp.productId,
                    "title": cp.productName,
                    "price": cp.price,
                    "quantity": cp.quantity,
                    "imageUrl": cp.imageUrl,
                    
                  })
              .toList()
        }));

    // products.forEach((item) {
    //   _orders.insert(0, item);
    // });

    notifyListeners();
    
  }
}
