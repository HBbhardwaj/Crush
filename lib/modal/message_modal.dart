// To parse this JSON data, do
//
//     final messageModal = messageModalFromJson(jsonString);

import 'dart:convert';

MessageModal messageModalFromJson(String str) => MessageModal.fromJson(json.decode(str));

String messageModalToJson(MessageModal data) => json.encode(data.toJson());

class MessageModal {
    MessageModal({
        required this.status,
        required this.msg,
        required this.data,
    });

    int status;
    String msg;
    List<Datum> data;

    factory MessageModal.fromJson(Map<String, dynamic> json) => MessageModal(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.subject,
        required this.message,
        required this.dateSent,
         this.name,
    });

    String subject;
    String message;
    String dateSent;
    String? name;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subject: json["subject"],
        message: json["message"],
        dateSent: json["date_sent"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "subject": subject,
        "message": message,
        "date_sent": dateSent,
        "name": name == null ? null : name,
    };
}
