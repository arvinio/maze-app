import '../../../../core/network/model/api_response.dart';
import '../../core/util/Post_data_request/post_data_request.dart';
import '../model/create_community/create_community_response.dart';
import '../../core/util/community_data_request/comunity.dart';
import '../model/create_post/create_post_response.dart';

import '../model/search/search_response.dart';

abstract class CommunityRemoteDataSource {
  Future<ApiResponse<CreateCommunityResponse>> createCommunity(
      {required Community request});
  Future<ApiResponse<CreatePostResponse>> createPost(
      {required PostDataRequest request});
  Future<ApiResponse> communityDetails({required String id});
  Future<ApiResponse> myCommunities();
  Future<ApiResponse> otherCommunities();
  Future<ApiResponse<Map<String, List<SearchResponse>>>> search(
      {required String query});
}
