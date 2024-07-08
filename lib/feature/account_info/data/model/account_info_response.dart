import 'dart:convert';
class AccountInfoResponse {
  List<Result>? resultList;

  AccountInfoResponse({this.resultList});

  factory AccountInfoResponse.fromRawJson(String str) => AccountInfoResponse.fromJson(json.decode(str));

  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) => AccountInfoResponse(
      resultList:
    json['result'] == null ? null : List<Result>.from(json['result'].map((x) => Result.fromJson(x))),

  );
}

class Result {
  String? id;
  String? name;

  Result({this.id, this.name});

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json['_id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
  };
}
