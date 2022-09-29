// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);import 'package:http/http.dart';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'Token_Response.dart';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  List<Datum> data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
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
    required this.name,
    required this.countryId,
    required this.stateId,
  });

  int id;
  String name;
  int countryId;
  int stateId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        stateId: json["state_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "state_id": stateId,
      };
}

class APIResponse {
  Future<ApiResponse> getAPIRESPONSE() async {
    final response = await get(Uri.parse(
        'https://fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&lang_id=1&country_id=189&token=a98f280d1b8f19c058870422bbb8fb69'));
    final activity = apiResponseFromJson(response.body);
    return activity;
  }
}

class tokenResponse {
  String? token;
   Future<String?> getTokenResponse() async {
    final response = await get(Uri.parse(
        'https://fluttertest.q3logics.com/api/trial?device_id=123456&token=?&lang_id=1'));
    final activity1 = apiResponseFromJson(response.body);
    print(activity1.data);
    token = activity1.data as String?;
    return token;
  }
}
