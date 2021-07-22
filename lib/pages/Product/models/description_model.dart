// To parse this JSON data, do
//
//     final descriptions = descriptionsFromJson(jsonString);

import 'dart:convert';

List<Descriptions> descriptionsFromJson(String str) => List<Descriptions>.from(
    json.decode(str).map((x) => Descriptions.fromJson(x)));

String descriptionsToJson(List<Descriptions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Descriptions {
  Descriptions({
    this.id,
    this.productId,
    this.description,
    this.v,
  });

  String id;
  String productId;
  String description;
  int v;

  factory Descriptions.fromJson(Map<String, dynamic> json) => Descriptions(
        id: json["_id"],
        productId: json["ProductID"],
        description: json["Description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ProductID": productId,
        "Description": description,
        "__v": v,
      };
}
