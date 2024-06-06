import 'package:equatable/equatable.dart';

class ApiError extends Equatable {
  final String message;
  final String? code;

  const ApiError(this.message, {this.code});

  @override
  String toString() => 'message: $message , code: $code';

  @override
  List<Object?> get props => [message, code];
}

class InternetError extends ApiError {
  const InternetError(super.message);
}

//HttpCode: 400
class BadRequest extends ApiError {
  const BadRequest(String message, String? code) : super(message, code: code);
}

//HttpCode: 401
class Unauthorized extends ApiError {
  const Unauthorized(String message, String? code) : super(message, code: code);
}

//HttpCode: 403
class Forbidden extends ApiError {
  const Forbidden(String message, String? code) : super(message, code: code);
}

//HttpCode: 404
class NotFound extends ApiError {
  const NotFound(String message) : super(message);
}

//HttpCode: 423
class UnavailableForThisOperation extends ApiError {
  const UnavailableForThisOperation(String message, String? code) : super(message, code: code);
}

//HttpCode: 451
class UnavailableForLegalReasons extends ApiError {
  const UnavailableForLegalReasons(String message, String? code) : super(message, code: code);
}

//HttpCode: 500
class ServerError extends ApiError {
  const ServerError(String message) : super(message);
}

//HttpCode: 503
class ServiceUnavailable extends ApiError {
  const ServiceUnavailable(String message, String? code) : super(message, code: code);
}

class UncaughtError extends ApiError {
  const UncaughtError(String message) : super(message);
}