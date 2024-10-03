import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_community_response.freezed.dart';
part 'search_community_response.g.dart';

@freezed
class SearchCommunityResponse with _$SearchCommunityResponse {
  const factory SearchCommunityResponse({
    @JsonKey(name: "_id") required String id,
    String? name,
  }) = _SearchResponse;

  factory SearchCommunityResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchCommunityResponseFromJson(json);
}
