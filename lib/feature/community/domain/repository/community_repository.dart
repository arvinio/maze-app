import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';

abstract class CommunityRepository {
  Future<ApiResponse<CreateCommunityResponse>> createCommunity({required Community request});
  Future<ApiResponse<CreatePostResponse>> createPost({required PostDataRequest request});
  Future<ApiResponse>  communityDetails({required String id});
  Future<ApiResponse>  myCommunities();
  Future<ApiResponse>  otherCommunities();



}
