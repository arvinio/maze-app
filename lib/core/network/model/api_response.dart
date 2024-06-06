import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<D> with _$ApiResponse<D> {
  const factory ApiResponse.completed({required D data, int? statusCode}) = Completed;

  const factory ApiResponse.error({required ApiError apiError}) = Error;
}
