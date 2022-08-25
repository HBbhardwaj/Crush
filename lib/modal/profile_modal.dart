// To parse this JSON data, do
//
//     final profileModal = profileModalFromJson(jsonString);

import 'dart:convert';

ProfileModal profileModalFromJson(String str) => ProfileModal.fromJson(json.decode(str));

String profileModalToJson(ProfileModal data) => json.encode(data.toJson());

class ProfileModal {
    ProfileModal({
        required this.status,
        required this.msg,
        required this.data,
    });

    int status;
    String msg;
    Data data;

    factory ProfileModal.fromJson(Map<String, dynamic> json) => ProfileModal(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.name,
        required this.useremail,
        required this.middleName,
        required this.maidenName,
        required this.marriedName,
        required this.nickName,
        required this.schoolName,
        required this.age,
        required this.maritalStatus,
        required this.schoolNames,
        required this.collegeName,
        required this.youth,
        required this.city,
    });

    String id;
    String name;
    String useremail;
    String middleName;
    String maidenName;
    String marriedName;
    String nickName;
    String schoolName;
    String age;
    String maritalStatus;
    String schoolNames;
    String collegeName;
    String youth;
    String city;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        name: json["name"],
        useremail: json["user_email"],
        middleName: json["middle_name"],
        maidenName: json["maiden_name"],
        marriedName: json["married_name"],
        nickName: json["nick_name"],
        schoolName: json["school_name"],
        age: json["age"],
        maritalStatus: json["marital_status"],
        schoolNames: json["school_names"],
        collegeName: json["college_name"],
        youth: json["youth"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "useremail":useremail,
        "middle_name": middleName,
        "maiden_name": maidenName,
        "married_name": marriedName,
        "nick_name": nickName,
        "school_name": schoolName,
        "age": age,
        "marital_status": maritalStatus,
        "school_names": schoolNames,
        "college_name": collegeName,
        "youth": youth,
        "city": city,
    };
}
