// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) =>
    List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    this.id,
    this.customerId,
    this.customerName,
    this.address,
    this.phoneNumber,
    this.email,
    this.totalPrice,
    this.orderConfirmed,
    this.delivered,
    this.date,
    this.v,
  });

  String id;
  String customerId;
  String customerName;
  String address;
  int phoneNumber;
  String email;
  int totalPrice;
  String orderConfirmed;
  String delivered;
  String date;
  int v;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["_id"],
        customerId: json["CustomerID"],
        customerName: json["CustomerName"],
        address: json["Address"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        totalPrice: json["TotalPrice"],
        orderConfirmed: json["OrderConfirmed"],
        delivered: json["Delivered"],
        date: json["Date"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "CustomerID": customerId,
        "CustomerName": customerName,
        "Address": address,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "TotalPrice": totalPrice,
        "OrderConfirmed": orderConfirmed,
        "Delivered": delivered,
        "Date": date,
        "__v": v,
      };
}
