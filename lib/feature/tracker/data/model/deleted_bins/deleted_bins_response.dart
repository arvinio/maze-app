import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'deleted_bins_response.freezed.dart';
part 'deleted_bins_response.g.dart';

DeletedBinsResponse deletedBinsResponseFromJson(String str) => DeletedBinsResponse.fromJson(json.decode(str));

String deletedBinsResponseToJson(DeletedBinsResponse data) => json.encode(data.toJson());

@freezed
class DeletedBinsResponse with _$DeletedBinsResponse {
  const factory DeletedBinsResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<DeletedBin>? bins,
  }) = _DeletedBinsResponse;

  factory DeletedBinsResponse.fromJson(Map<String, dynamic> json) => _$DeletedBinsResponseFromJson(json);
}

@freezed
class DeletedBin with _$DeletedBin {
  const factory DeletedBin({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "nickname")
    String? nickname,
    @JsonKey(name: "sizeType")
    String? sizeType,
    @JsonKey(name: "width")
    int? width,
    @JsonKey(name: "height")
    int? height,
    @JsonKey(name: "length")
    int? length,
    @JsonKey(name: "is2Compostement")
    bool? is2Compostement,
    @JsonKey(name: "isShare")
    bool? isShare,
    @JsonKey(name: "createdDate")
    DateTime? createdDate,
    @JsonKey(name: "photo")
    dynamic photo,
  }) = _DeletedBin;

  factory DeletedBin.fromJson(Map<String, dynamic> json) => _$DeletedBinFromJson(json);
}
