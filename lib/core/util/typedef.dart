import 'package:maze_app/core/network/model/api_response.dart';

typedef ResultFuture<T> = Future<ApiResponse<T>>;
typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;
