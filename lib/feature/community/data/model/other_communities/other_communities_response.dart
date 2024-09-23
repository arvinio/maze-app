import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';

part 'other_communities_response.freezed.dart';
part 'other_communities_response.g.dart';

OtherCommunitiesResponse otherCommunitiesResponseFromJson(String str) => OtherCommunitiesResponse.fromJson(json.decode(str));

String otherCommunitiesResponseToJson(OtherCommunitiesResponse data) => json.encode(data.toJson());

@freezed
class OtherCommunitiesResponse with _$OtherCommunitiesResponse {
  const factory OtherCommunitiesResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<CommunityDetails>? details,
  }) = _OtherCommunitiesResponse;

  factory OtherCommunitiesResponse.fromJson(Map<String, dynamic> json) => _$OtherCommunitiesResponseFromJson(json);
}
