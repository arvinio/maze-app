import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'compost_bin_types_response.freezed.dart';
part 'compost_bin_types_response.g.dart';

CompostBinTypesResponse compostBinTypesResponseFromJson(String str) => CompostBinTypesResponse.fromJson(json.decode(str));

String compostBinTypesResponseToJson(CompostBinTypesResponse data) => json.encode(data.toJson());

@freezed
class CompostBinTypesResponse with _$CompostBinTypesResponse {
  const factory CompostBinTypesResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<CompostBinTypes>? compostBinTypes,
  }) = _CompostBinTypesResponse;

  factory CompostBinTypesResponse.fromJson(Map<String, dynamic> json) => _$CompostBinTypesResponseFromJson(json);
}

@freezed
class CompostBinTypes with _$CompostBinTypes {
  const factory CompostBinTypes({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "name")
    String? name,
  }) = _CompostBinTypes;

  factory CompostBinTypes.fromJson(Map<String, dynamic> json) => _$CompostBinTypesFromJson(json);
}
