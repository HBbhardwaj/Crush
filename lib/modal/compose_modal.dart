// To parse this JSON data, do
//
//     final composeModal = composeModalFromJson(jsonString);

import 'dart:convert';

ComposeModal composeModalFromJson(String str) => ComposeModal.fromJson(json.decode(str));

String composeModalToJson(ComposeModal data) => json.encode(data.toJson());

class ComposeModal {
    ComposeModal({
        required this.status,
        required this.msg,
    });

    int status;
    String msg;

    factory ComposeModal.fromJson(Map<String, dynamic> json) => ComposeModal(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
