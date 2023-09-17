import 'dart:convert';

CartAddRequestModel cartAddRequestModelFromJson(String str) =>
    CartAddRequestModel.fromJson(json.decode(str));

String cartAddRequestModelToJson(CartAddRequestModel data) =>
    json.encode(data.toJson());

class CartAddRequestModel {
  String title;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;

  CartAddRequestModel({
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
  });

  factory CartAddRequestModel.fromJson(Map<String, dynamic> json) =>
      CartAddRequestModel(
        title: json["title"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
      };
}
