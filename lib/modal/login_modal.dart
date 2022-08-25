// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    SignInModel({
      required  this.status,
      required  this.response,
      required  this.error,
      required  this.msg,
      required  this.data,
    });

    int status;
    String response;
    String error;
    String msg;
    Data data;

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        response: json["response"],
        error: json["error"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "error": error,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    Data({
       required this.userId,
       required this.userEmail,
       required this.userNicename,
       required this.userPass,
    });

    String userId;
    String userEmail;
    String userNicename;
    String userPass;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userPass: json["user_pass"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_pass": userPass,
    };
}
