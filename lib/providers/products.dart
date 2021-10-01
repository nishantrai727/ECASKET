import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './product.dart';

class Cat {
  String catName;
  String catImg;

  Cat({
    this.catName,
    this.catImg,
  });
}

class Products with ChangeNotifier {
  List<Cat> _categoriesName = [
    Cat(
      catName: "Faishon",
      catImg: "assets/images/categories/faishon/1.jpg",
    ),
    Cat(
      catName: "Mobiles",
      catImg: "assets/images/categories/mobiles/1.jpg",
    ),
    Cat(
      catName: "Electronics",
      catImg: "assets/images/categories/electronics/1.jpg",
    ),
    Cat(
      catName: "Home",
      catImg: "assets/images/categories/home/1.jpg",
    ),
    Cat(
      catName: "Appliances",
      catImg: "assets/images/categories/appliances/1.jpg",
    ),
    Cat(
      catName: "Beauty",
      catImg: "assets/images/categories/beauty/1.jpg",
    ),
    Cat(
      catName: "Toy",
      catImg: "assets/images/categories/toy/1.jpg",
    ),
    Cat(
      catName: "Furniture",
      catImg: "assets/images/categories/furniture/1.jpg",
    ),
    Cat(
      catName: "Sport",
      catImg: "assets/images/categories/sport/1.jpg",
    ),
    Cat(
      catName: "Grocery",
      catImg: "assets/images/categories/grocery/1.jpg",
    ),
  ];

  List get categoriesName {
    return [..._categoriesName];
  }

  List<Product> _items = [
    Product(
      id: "f001",
      category: "Faishon",
      price: 1299,
      title: "Levis T-Shirt",
      imageUrl: "assets/images/categories/faishon/1.jpg",
      offerTag: "20% Discount !",
      offerDescription: "Buy for more than 2000 and get 20% discount.",
    ),
    Product(
      id: "f002",
      category: "Faishon",
      price: 899,
      title: "Adidas T-Shirt",
      imageUrl: "assets/images/categories/faishon/2.jpg",
      offerTag: "10% Discount !",
      offerDescription: "Buy 3 and get 10% discount.",
    ),
    Product(
      id: "f003",
      category: "Faishon",
      price: 2999,
      title: "Van Heusen T-Shirt",
      imageUrl: "assets/images/categories/faishon/3.jpg",
      offerTag: "8% Discount !",
      offerDescription: "Buy for more than 2000 and get 8% discount.",
    ),
    Product(
      id: "f004",
      category: "Faishon",
      price: 1565,
      title: "Denim Flex Fit Jeans ",
      imageUrl: "assets/images/categories/faishon/4.jpg",
      offerTag: "Trendy",
      offerDescription: "Buy for more than 990 and get 12% off.",
    ),
    Product(
      id: "f005",
      category: "Faishon",
      price: 1899,
      title: "Men's DNMX SLIM Jeans",
      imageUrl: "assets/images/categories/faishon/5.jpg",
      offerTag: "On the counter!",
      offerDescription: "Buy for more than 2000 and get 30% discount.",
    ),
    Product(
      id: "f006",
      category: "Faishon",
      price: 1277,
      title: "Levis Men's T-Shirt",
      imageUrl: "assets/images/categories/faishon/6.jpg",
      offerTag: "20% Discount !",
      offerDescription: "Buy for more than 3000 and get 10% discount.",
    ),
    Product(
      id: "f007",
      category: "Faishon",
      price: 1115,
      title: "Cardio SweatShirt",
      imageUrl: "assets/images/categories/faishon/7.jpg",
      offerTag: "Trendy !",
      offerDescription: "Buy 2 and get 20% discount.",
    ),
    Product(
      id: "m001",
      category: "Mobiles",
      price: 119900,
      title: "Apple iPhone 12Pro",
      imageUrl: "assets/images/categories/mobiles/1.jpg",
      offerTag: "5% Discount",
      offerDescription: "Use Credit Card to avail the 5% discount offer.",
    ),
    Product(
      id: "m002",
      category: "Mobiles",
      price: 89999,
      title: "Samsung Edge 9t",
      imageUrl: "assets/images/categories/mobiles/2.jpg",
      offerTag: "1% Discount",
      offerDescription: "Use Credit Card to avail the 3% discount offer.",
    ),
    Product(
      id: "m003",
      category: "Mobiles",
      price: 29999,
      title: "Huwaei Z-plus 6",
      imageUrl: "assets/images/categories/mobiles/3.jpg",
      offerTag: "8% Discount",
      offerDescription: "Shop with Credit Card to avail the 8% discount offer.",
    ),
    Product(
      id: "m004",
      category: "Mobiles",
      price: 19999,
      title: "Redmi 10 Note Pro",
      imageUrl: "assets/images/categories/mobiles/4.jpg",
      offerTag: "12% Discount",
      offerDescription: "Buy with with the EMI on selected banks.",
    ),
    Product(
      id: "m005",
      category: "Mobiles",
      price: 29999,
      title: "Moto G4 Note",
      imageUrl: "assets/images/categories/mobiles/5.jpg",
      offerTag: "3% Discount",
      offerDescription: "Get Motoship membership free.",
    ),
    Product(
      id: "m006",
      category: "Mobiles",
      price: 78800,
      title: "Redmi 6 Pro 8GB",
      imageUrl: "assets/images/categories/mobiles/6.jpg",
      offerTag: "3% Discount",
      offerDescription: "Get Xiomi membership free.",
    ),
    Product(
        id: "e001",
        category: "Electronics",
        price: 80999,
        title: "Macbook",
        imageUrl: "assets/images/categories/electronics/1.jpg",
        offerTag: "7% Discount",
        offerDescription: "Use Credit Card to avail the 7% discount offer"),
    Product(
      id: "h001",
      category: "Home",
      price: 15000,
      title: "Wardrobe",
      imageUrl: "assets/images/categories/home/1.jpg",
      offerTag: "10% Discount",
      offerDescription: "Order Now to avail the offer.",
    ),
    Product(
      id: "a001",
      category: "Appliances",
      price: 8999,
      title: "Iron",
      imageUrl: "assets/images/categories/appliances/1.jpg",
      offerTag: "",
      offerDescription: "",
    ),
    Product(
      id: "b001",
      category: "Beauty",
      price: 599,
      title: "Lakme Cream",
      imageUrl: "assets/images/categories/beauty/1.jpg",
      offerDescription: "",
      offerTag: "",
    ),
    Product(
      id: "t001",
      category: "Toy",
      price: 800,
      title: "Teddy Bear",
      imageUrl: "assets/images/categories/toy/1.jpg",
      offerTag: "",
      offerDescription: "",
    ),
    Product(
      id: "u001",
      category: "Furniture",
      price: 8579,
      title: "Sofa set",
      imageUrl: "assets/images/categories/furniture/1.jpg",
    ),
    Product(
      id: "s001",
      category: "Sport",
      price: 1200,
      title: "Yonex Racket",
      imageUrl: "assets/images/categories/sport/1.jpg",
    ),
    Product(
        id: "g001",
        category: "Grocery",
        price: 80,
        title: "Bell Pepper",
        imageUrl: "assets/images/categories/grocery/1.jpg")
  ];

  List<Product> _favoriteItems = [];

  List<Product> get favoriteItems {
    return [..._favoriteItems];
  }

  Future<void> addProduct(Product prod) async {
    const url =
        "https://ecasket-a62f2-default-rtdb.firebaseio.com/products.json";

    try {
      final response = await http.post(url,
          body: json.encode({
            "title": prod.title,
            "category": prod.category,
            "id": prod.id,
            "imageUrl": prod.imageUrl,
            "price": prod.price,
            "isFavorite": prod.isFavorite,
            "offerDescription": prod.offerDescription,
            "offerTag": prod.offerTag
          }));
    } catch (err) {
      print(err);
      throw (err);
    }

    // final newProd = Product(
    //     title: prod.title,
    //     category: prod.category,
    //     id: prod.id,
    //     imageUrl: prod.imageUrl,
    //     price: prod.price,
    //     isFavorite: prod.isFavorite,
    //     offerDescription: prod.offerDescription,
    //     offerTag: prod.offerTag);

    // _items.add(newProd);

    // notifyListeners();
  }

  void toggleFavoriteStatus(String prodId) {
    Product prod = _items.firstWhere((item) => item.id == prodId);
    prod.isFavorite = !prod.isFavorite;
    notifyListeners();

    if (prod.isFavorite == true) {
      _favoriteItems.add(prod);

      notifyListeners();
    } else {
      _favoriteItems.removeWhere((item) => item.id == prodId);

      notifyListeners();
    }
  }

  List<Product> get items {
    return [..._items];
  }

  Product getProduct(String prodId) {
    return items.firstWhere((p) => p.id == prodId);
  }

  List<Product> fetchAndSetCategoryList(String categoryName) {
    List<Product> loadItems = [];

    loadItems = items.where((item) => item.category == categoryName).toList();

    return loadItems;
  }
}
