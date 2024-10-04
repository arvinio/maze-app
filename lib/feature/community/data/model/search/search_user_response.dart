import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../tracker/presentation/widgets/tracker_widgets.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  const factory SearchUserResponse({
    @JsonKey(name: "_id") required String id,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);
}
