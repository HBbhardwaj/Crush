import 'dart:convert';

EditModal editModalFromJson(String str) => EditModal.fromJson(json.decode(str));

String editModalToJson(EditModal data) => json.encode(data.toJson());

class EditModal {
    EditModal({
        required this.status,
        required this.msg,
    });

    int status;
    String msg;

    factory EditModal.fromJson(Map<String, dynamic> json) => EditModal(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
