// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

List<Images> imagesFromJson(String str) =>
    List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imagesToJson(List<Images> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
  Images({
    this.id,
    this.productId,
    this.imageUrl,
    this.v,
  });

  String id;
  String productId;
  String imageUrl;
  int v;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["_id"],
        productId: json["ProductID"],
        imageUrl: json["ImageUrl"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ProductID": productId,
        "ImageUrl": imageUrl,
        "__v": v,
      };
}
