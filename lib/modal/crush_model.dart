// To parse this JSON data, do
//
//     final getCrushModal = getCrushModalFromJson(jsonString);

import 'dart:convert';

GetCrushModal getCrushModalFromJson(String str) => GetCrushModal.fromJson(json.decode(str));

String getCrushModalToJson(GetCrushModal data) => json.encode(data.toJson());

class GetCrushModal {
    GetCrushModal({
       required this.status,
       required this.msg,
       required this.data,
    });

    int status;
    String msg;
    List<Datum> data;

    factory GetCrushModal.fromJson(Map<String, dynamic> json) => GetCrushModal(
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
      required this.id,
      required  this.userId,
      required  this.crushName,
      required  this.middleName,
      required  this.maidenName,
      required  this.marriedName,
      required  this.crushImage,
      required this.description,
      required  this.date,
      required  this.townCity,
     required this.schoolWork,
    });

    String id;
    String userId;
    String crushName;
    String middleName;
    String maidenName;
    String marriedName;
    String crushImage;
    String description;
    String date;
    String townCity;
    String schoolWork;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        crushName: json["crush_name"],
        middleName: json["middle_name"],
        maidenName: json["maiden_name"],
        marriedName: json["married_name"],
        crushImage: json["crush_image"],
        description: json["description"],
        date: json["date"],
        townCity: json["town_city"],
        schoolWork: json["school_work"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "crush_name": crushName,
        "middle_name": middleName,
        "maiden_name": maidenName,
        "married_name": marriedName,
        "crush_image": crushImage,
        "description": description,
        "date": date,
        "town_city": townCity,
        "school_work": schoolWork,
    };
}
