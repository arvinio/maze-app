


import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_post_data_request.freezed.dart';


@freezed
class CommunityPostDataRequest with _$CommunityPostDataRequest {
  const factory CommunityPostDataRequest({
    @JsonKey(name: "communityId") String? communityId,
    @JsonKey(name: "page") int? page,
  }) = _CommunityPostDataRequest;

}