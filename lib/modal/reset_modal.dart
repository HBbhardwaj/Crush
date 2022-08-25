// To parse this JSON data, do
//
//     final resetModel = resetModelFromJson(jsonString);

import 'dart:convert';

ResetModel resetModelFromJson(String str) => ResetModel.fromJson(json.decode(str));

String resetModelToJson(ResetModel data) => json.encode(data.toJson());

class ResetModel {
    ResetModel({
     required this.status,
      required this.response,
      required this.msg,
      required this.error,
      required this.type,
    });

    int status;
    String response;
    String msg;
    String error;
    String type;

    factory ResetModel.fromJson(Map<String, dynamic> json) => ResetModel(
        status: json["status"],
        response: json["response"],
        msg: json["msg"],
        error: json["error"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "msg": msg,
        "error": error,
        "type": type,
    };
}
