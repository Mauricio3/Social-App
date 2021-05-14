//import 'dart:convert';

import 'package:social_app/models/address.dart';

class User {
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        username = json["username"],
        email = json["email"],
        address = Address.fromJson(json["address"]),
        phone = json["phone"],
        website = json["website"];
}
