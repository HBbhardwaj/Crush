// To parse this JSON data, do
//
//     final addCrush = addCrushFromJson(jsonString);

import 'dart:convert';

AddCrush addCrushFromJson(String str) => AddCrush.fromJson(json.decode(str));

String addCrushToJson(AddCrush data) => json.encode(data.toJson());

class AddCrush {
    AddCrush({
   required this.status,
   required this.msg,
    });

    int status;
    String msg;

    factory AddCrush.fromJson(Map<String, dynamic> json) => AddCrush(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
