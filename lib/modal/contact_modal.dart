// To parse this JSON data, do
//
//     final contactModal = contactModalFromJson(jsonString);

import 'dart:convert';

ContactModal contactModalFromJson(String str) => ContactModal.fromJson(json.decode(str));

String contactModalToJson(ContactModal data) => json.encode(data.toJson());

class ContactModal {
    ContactModal({
       required this.status,
       required this.msg,
    });

    int status;
    String msg;

    factory ContactModal.fromJson(Map<String, dynamic> json) => ContactModal(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
