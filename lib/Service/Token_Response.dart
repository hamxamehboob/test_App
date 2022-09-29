

import 'package:meta/meta.dart';
import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) => TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  TokenResponse({
   required this.status,
   required this.data,
   required this.maintenanceStatus,
   required this.msg,
  });

  int status;
  String data;
  bool maintenanceStatus;
  String msg;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    status: json["status"],
    data: json["data"],
    maintenanceStatus: json["maintenance_status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data,
    "maintenance_status": maintenanceStatus,
    "msg": msg,
  };
}
