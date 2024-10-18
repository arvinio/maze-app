import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/core/util/community_leaderboard_data_request/community_leaderboard_data_request.dart';
import 'package:maze_app/feature/community/core/util/community_post_data_request/community_post_data_request.dart';
import 'package:maze_app/feature/community/data/data_source/community_remote_data_source.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';
import 'package:maze_app/feature/community/data/model/post_comments/post_comment.dart';
import 'package:maze_app/feature/community/data/model/search/search_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

@Injectable(as: CommunityRepository)
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDataSource remoteDataSource;

  CommunityRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse<CreateCommunityResponse>> createCommunity(
      {required Community request}) {
    return remoteDataSource.createCommunity(request: request);
  }

  @override
  Future<ApiResponse<CreateCommunityResponse>> editCommunity(
      {required Community request}) {
    return remoteDataSource.editCommunity(request: request);
  }

  @override
  Future<ApiResponse<CreatePostResponse>> createPost(
      {required PostDataRequest request}) {
    return remoteDataSource.createPost(request: request);
  }

  @override
  Future<ApiResponse> communityDetails({required String id}) {
    return remoteDataSource.communityDetails(id: id);
  }

  @override
  Future<ApiResponse> myCommunities() {
    return remoteDataSource.myCommunities();
  }

  @override
  Future<ApiResponse> otherCommunities() {
    return remoteDataSource.otherCommunities();
  }

  Future<ApiResponse> joinCommunity({required String id}) {
    return remoteDataSource.joinCommunity(id: id);
  }

  @override
  Future<ApiResponse> leaveCommunity({required String id}) {
    return remoteDataSource.leaveCommunity(id: id);
  }

  @override
  Future<ApiResponse> deleteCommunity({required String id}) {
    return remoteDataSource.deleteCommunity(id: id);
  }

  @override
  Future<ApiResponse> communityLeaderboardList(
      {required CommunityLeaderboardDataRequest request}) {
    return remoteDataSource.communityLeaderboardList(request: request);
  }

  @override
  Future<ApiResponse> communityPostList(
      {required CommunityPostDataRequest request}) {
    return remoteDataSource.communityPostList(request: request);
  }

  @override
  Future<ApiResponse> likePost({required String postId}) {
    return remoteDataSource.likePost(postId: postId);
  }

  @override
  Future<ApiResponse> unLikePost({required String postId}) {
    return remoteDataSource.unLikePost(postId: postId);
  }

  @override
  Future<ApiResponse> likeComment({required String commentId}) {
    return remoteDataSource.likeComment(commentId: commentId);
  }

  @override
  Future<ApiResponse> unLikeComment({required String commentId}) {
    return remoteDataSource.unLikeComment(commentId: commentId);
  }

  @override
  Future<ApiResponse> getImageFile({required String imageUrl}) {
    return remoteDataSource.getImageFile(imageUrl: imageUrl);
  }

  @override
  Future<ApiResponse<Map<String, List<SearchResponse>>>> search(
      {required String query}) {
    return remoteDataSource.search(query: query);
  }

  @override
  Future<ApiResponse<CommunityPost>> getPost({required String postId}) {
    return remoteDataSource.getPost(postId: postId);
  }

  @override
  Future<ApiResponse<List<PostCommentResponse>>> getComments(
      {required String postId}) {
    return remoteDataSource.getComments(postId);
  }

  @override
  Future<ApiResponse> leaveComment({required CommentRequest body}) {
    return remoteDataSource.leaveComment(body: body);
  }

  @override
  Future<ApiResponse> deleteComment({required String commentId}) {
    return remoteDataSource.deleteComment(commentId: commentId);
  }

  @override
  Future<ApiResponse> editComment({required EditCommentRequest body}) {
    return remoteDataSource.editComment(body: body);
  }
}
