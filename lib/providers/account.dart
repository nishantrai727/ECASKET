import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


class Account with ChangeNotifier {
  final String userId;
  Account(this.userId);

  String globname ="";
  String globphoneNum ="";
  String globemail ="";
  String globaddress ="";

  bool isRegistered = false;

  Map<String, String> temp = {
    "name": "",
    "phoneNum": "",
    "email": "",
    "address": "",
  };

  Future<void> addAccountDetails(
    String name,
    String phoneNum,
    String email,
    String address,
  ) async {
    print(userId);
    final url =
        "https://ecasket-a62f2-default-rtdb.firebaseio.com/$userId/accountDetails.json";

    

    final response = await http.post(url,
        body: json.encode({
          "name": name,
          "phoneNum": phoneNum,
          "email": email,
          "address": address
        }));

      
    globname = name;
    globphoneNum = phoneNum;
    globemail = email;
    globaddress = address;

    notifyListeners();
  }

  Future<void> fetchAndSetAccountDetails() async {
    final url =
        "https://ecasket-a62f2-default-rtdb.firebaseio.com/$userId/accountDetails.json";


    final response = await http.get(url);

    
  }
}
