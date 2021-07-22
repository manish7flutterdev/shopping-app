// To parse this JSON data, do
//
//     final orderedProduct = orderedProductFromJson(jsonString);

import 'dart:convert';

List<OrderedProduct> orderedProductFromJson(String str) =>
    List<OrderedProduct>.from(
        json.decode(str).map((x) => OrderedProduct.fromJson(x)));

String orderedProductToJson(List<OrderedProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderedProduct {
  OrderedProduct({
    this.id,
    this.productName,
    this.price,
    this.quantity,
    this.orderId,
    this.v,
  });

  String id;
  String productName;
  int price;
  int quantity;
  String orderId;
  int v;

  factory OrderedProduct.fromJson(Map<String, dynamic> json) => OrderedProduct(
        id: json["_id"],
        productName: json["ProductName"],
        price: json["Price"],
        quantity: json["Quantity"],
        orderId: json["OrderID"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ProductName": productName,
        "Price": price,
        "Quantity": quantity,
        "OrderID": orderId,
        "__v": v,
      };
}
