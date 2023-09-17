import 'dart:convert';

SignUpRequestModel signUpRequestModelFromJson(String str) =>
    SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) =>
    json.encode(data.toJson());

class SignUpRequestModel {
  String name;
  String email;
  String password;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      SignUpRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
