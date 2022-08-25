
import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
      this.status,
      this.response,
      this.msg,
      this.error,
    });

    int? status;
    String? response;
    String? msg;
    String? error;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        status: json["status"],
        response: json["response"],
        msg: json["msg"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "msg": msg,
        "error": error,
    };
}
