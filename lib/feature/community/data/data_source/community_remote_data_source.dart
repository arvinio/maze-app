import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/core/util/community_leaderboard_data_request/community_leaderboard_data_request.dart';
import 'package:maze_app/feature/community/core/util/community_post_data_request/community_post_data_request.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';
import 'package:maze_app/feature/community/data/model/search/search_response.dart';

import '../model/community_post/community_post_response.dart';
import '../model/post_comments/post_comment.dart';

abstract class CommunityRemoteDataSource {
  Future<ApiResponse<CreateCommunityResponse>> createCommunity(
      {required Community request});

  Future<ApiResponse<CreatePostResponse>> createPost(
      {required PostDataRequest request});

  Future<ApiResponse> communityDetails({required String id});

  Future<ApiResponse> myCommunities();

  Future<ApiResponse> otherCommunities();

  Future<ApiResponse> joinCommunity({required String id});

  Future<ApiResponse> leaveCommunity({required String id});

  Future<ApiResponse> deleteCommunity({required String id});

  Future<ApiResponse> communityLeaderboardList(
      {required CommunityLeaderboardDataRequest request});

  Future<ApiResponse> communityPostList(
      {required CommunityPostDataRequest request});

  Future<ApiResponse> likePost({required String postId});

  Future<ApiResponse> unLikePost({required String postId});

  Future<ApiResponse<Map<String, List<SearchResponse>>>> search(
      {required String query});

  Future<ApiResponse<CommunityPost>> getPost({required String postId});

  Future<ApiResponse> leaveComment({required CommentRequest body});

  Future<ApiResponse<List<PostCommentResponse>>> getComments(String postId);
}
