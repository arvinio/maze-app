import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data_request.freezed.dart';


@freezed
class PostDataRequest with _$PostDataRequest {
  const factory PostDataRequest({
    @JsonKey(name: "communityId") String? communityId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "content") String? content,
    @JsonKey(name: "photos") List<File>? photos
  }) = _PostDataRequest;

}