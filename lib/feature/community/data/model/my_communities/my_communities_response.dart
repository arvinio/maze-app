import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';

part 'my_communities_response.freezed.dart';
part 'my_communities_response.g.dart';

MyCommunitiesResponse myCommunitiesResponseFromJson(String str) => MyCommunitiesResponse.fromJson(json.decode(str));

String myCommunitiesResponseToJson(MyCommunitiesResponse data) => json.encode(data.toJson());

@freezed
class MyCommunitiesResponse with _$MyCommunitiesResponse {
  const factory MyCommunitiesResponse({
    @JsonKey(name: "success")
    bool? success,
    @JsonKey(name: "result")
    List<CommunityDetails>? details,
  }) = _MyCommunitiesResponse;

  factory MyCommunitiesResponse.fromJson(Map<String, dynamic> json) => _$MyCommunitiesResponseFromJson(json);
}
