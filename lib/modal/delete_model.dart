// To parse this JSON data, do
//
//     final deleteModal = deleteModalFromJson(jsonString);

import 'dart:convert';

DeleteModal deleteModalFromJson(String str) => DeleteModal.fromJson(json.decode(str));

String deleteModalToJson(DeleteModal data) => json.encode(data.toJson());

class DeleteModal {
    DeleteModal({
       required this.status,
       required this.msg,
    });

    int status;
    String msg;

    factory DeleteModal.fromJson(Map<String, dynamic> json) => DeleteModal(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
