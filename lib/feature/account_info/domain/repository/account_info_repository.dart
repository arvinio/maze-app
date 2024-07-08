import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/account_info/data/model/register_details_response.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';

abstract class AccountInfoRepository {
  Future<ApiResponse> getCountryList();
  Future<ApiResponse> getStateList({required String countryId});
  Future<ApiResponse> getCouncilList({required String stateId});
  Future<ApiResponse<RegisterDetailsResponse>> registerDetails(  {required UserInfo userInfoParam});
}
