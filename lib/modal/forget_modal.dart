// To parse this JSON data, do
//
//     final forgotModel = forgotModelFromJson(jsonString);

import 'dart:convert';

ForgotModel forgotModelFromJson(String str) => ForgotModel.fromJson(json.decode(str));

String forgotModelToJson(ForgotModel data) => json.encode(data.toJson());

class ForgotModel {
    ForgotModel({
      required  this.status,
      required  this.response,
      required  this.error,
      required  this.msg,
      required  this.userId,
      required  this.type,
    });

    int status;
    String response;
    String error;
    String msg;
    String userId;
    String type;

    factory ForgotModel.fromJson(Map<String, dynamic> json) => ForgotModel(
        status: json["status"],
        response: json["response"],
        error: json["error"],
        msg: json["msg"],
        userId: json["user_id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "error": error,
        "msg": msg,
        "user_id": userId,
        "type": type,
    };
}
