// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.id,
    this.productName,
    this.description,
    this.image,
    this.price,
    this.quantityType,
    this.availability,
    this.baseQuantity,
    this.v,
  });

  String id;
  String productName;
  String description;
  String image;
  int price;
  String quantityType;
  bool availability;
  int baseQuantity;
  int v;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["_id"],
        productName: json["ProductName"],
        description: json["Description"],
        image: json["Image"],
        price: json["Price"],
        quantityType: json["QuantityType"],
        availability: json["Availability"],
        baseQuantity: json["BaseQuantity"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ProductName": productName,
        "Description": description,
        "Image": image,
        "Price": price,
        "QuantityType": quantityType,
        "Availability": availability,
        "BaseQuantity": baseQuantity,
        "__v": v,
      };
}
