import 'package:freezed_annotation/freezed_annotation.dart';

import 'search_community_response.dart';
import 'search_user_response.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    @JsonKey(name: "_id") required String id,
    String? avatar,
    int? memberCount,
    String? name,
    String? content,
    DateTime? createdDate,
    SearchUserResponse? user,
    SearchCommunityResponse? community,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  static Map<String, List<SearchResponse>> fromResultJson(
      Map<String, dynamic> json) {
    /// Because the keys are tabs of results! so the server might have different keys
    /// We implement this method like this to handle the case
    final results = json["result"];
    final keys = results.keys;
    Map<String, List<SearchResponse>> parsed = {};
    for (var key in keys) {
      parsed[key] = results[key]
          .map<SearchResponse>((result) => SearchResponse.fromJson(result))
          .toList();
    }
    return parsed;
  }
}
