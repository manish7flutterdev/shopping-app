// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.phoneNumber,
    this.address,
    this.v,
  });

  String id;
  String userName;
  String email;
  String password;
  int phoneNumber;
  String address;
  int v;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["_id"],
        userName: json["UserName"],
        email: json["Email"],
        password: json["Password"],
        phoneNumber: json["PhoneNumber"],
        address: json["Address"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "UserName": userName,
        "Email": email,
        "Password": password,
        "PhoneNumber": phoneNumber,
        "Address": address,
        "__v": v,
      };
}
