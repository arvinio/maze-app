import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/core/util/community_leaderboard_data_request/community_leaderboard_data_request.dart';
import 'package:maze_app/feature/community/core/util/community_post_data_request/community_post_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/data/model/community_leaderboard/community_leaderboard_response.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';
import 'package:maze_app/feature/community/data/model/my_communities/my_communities_response.dart';
import 'package:maze_app/feature/community/data/model/other_communities/other_communities_response.dart';
import 'package:maze_app/feature/community/data/model/search/search_response.dart';

import '../model/post_comments/post_comment.dart';
import 'community_remote_data_source.dart';

@Injectable(as: CommunityRemoteDataSource)
class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  final DioCaller dioCaller;

  CommunityRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});

  @override
  Future<ApiResponse<CreateCommunityResponse>> createCommunity(
      {required Community request}) async {
    FormData formData = FormData.fromMap({'description': request.description});

    if (request.name!.isNotEmpty) {
      formData.fields.add(MapEntry("name", request.name!));
    }

    if (request.avatar != null) {
      File file = request.avatar!;
      var fileName = file.path.split('/').last;

      formData.files.add(MapEntry("avatar",
          await MultipartFile.fromFile(file.path, filename: fileName)));
    }

    if (request.cover != null) {
      File file = request.cover!;
      var fileName = file.path.split('/').last;

      formData.files.add(MapEntry("cover",
          await MultipartFile.fromFile(file.path, filename: fileName)));
    }

    return await dioCaller.post<CreateCommunityResponse>('api/community',
        fromJson: CreateCommunityResponse.fromJson, data: formData);
  }

  @override
  Future<ApiResponse<CreatePostResponse>> createPost(
      {required PostDataRequest request}) async {
    FormData formData = FormData.fromMap({
      'title': request.title,
      'content': request.content,
    });

    if (request.communityId != null) {
      formData.fields.add(MapEntry("communityId", request.communityId!));
    }

    for (int i = 0; i < request.photos!.length; i++) {
      var path = request.photos![i].path;
      formData.files.addAll([
        MapEntry("photos",
            await MultipartFile.fromFile(path, filename: path.split('/').last))
      ]);
    }

    return await dioCaller.post<CreatePostResponse>('api/community/post',
        fromJson: CreatePostResponse.fromJson, data: formData);
  }

  @override
  Future<ApiResponse> communityDetails({required String id}) async {
    return await dioCaller.get('api/community/$id',
        fromJson: CommunityDetailsResponse.fromJson);
  }

  @override
  Future<ApiResponse> myCommunities() async {
    return await dioCaller.get('api/community',
        fromJson: MyCommunitiesResponse.fromJson);
  }

  @override
  Future<ApiResponse> otherCommunities() async {
    return await dioCaller.get('api/community/list',
        fromJson: OtherCommunitiesResponse.fromJson);
  }

  @override
  Future<ApiResponse> joinCommunity({required String id}) async {
    return await dioCaller.post(
        data: {"communityId": id},
        '/api/community/join',
        fromJson: OtherCommunitiesResponse.fromJson);
  }

  @override
  Future<ApiResponse> leaveCommunity({required String id}) async {
    return await dioCaller.post(
        data: {"communityId": id},
        '/api/community/leave',
        fromJson: OtherCommunitiesResponse.fromJson);
  }

  @override
  Future<ApiResponse> deleteCommunity({required String id}) async {
    return await dioCaller.delete(
        // data: {"id": id},
        '/api/community/$id',
        fromJson: OtherCommunitiesResponse.fromJson);
  }

  @override
  Future<ApiResponse> communityLeaderboardList(
      {required CommunityLeaderboardDataRequest request}) async {
    Map<String, dynamic> mapData = {
      'page': request.page,
      'communityId': request.communityId,
      'type': request.type,
    };
    return await dioCaller.get(
        queryParameters: mapData,
        '/api/community/leaderboard',
        fromJson: CommunityLeaderboardResponse.fromJson);
  }

  @override
  Future<ApiResponse> communityPostList(
      {required CommunityPostDataRequest request}) async {
    Map<String, dynamic> mapData = {
      'page': request.page,
      'communityId': request.communityId,
    };
    return await dioCaller.get(
        queryParameters: mapData,
        '/api/community/posts',
        fromJson: CommunityPostResponse.fromJson);
  }

  @override
  Future<ApiResponse> likePost({required String postId}) async {
    Map<String, dynamic> mapData = {
      "element": "post", // post,comment,comment-reply
      "elementId": postId,
      "action": "like" //like,unlike
    };
    return await dioCaller.post(
        data: mapData, '/api/like', fromJson: CommunityPostResponse.fromJson);
  }

  @override
  Future<ApiResponse> unLikePost({required String postId}) async {
    Map<String, dynamic> mapData = {
      "element": "post", // post,comment,comment-reply
      "elementId": postId,
      "action": "unlike"
    };
    return await dioCaller.post(
        data: mapData, '/api/like', fromJson: CommunityPostResponse.fromJson);
  }

  @override
  Future<ApiResponse> likeComment({required String commentId}) async {
    Map<String, dynamic> mapData = {
      "element": "comment", // post,comment,comment-reply
      "elementId": commentId,
      "action": "like" //like,unlike
    };
    return await dioCaller.post(
        data: mapData, '/api/like', fromJson: CommunityPostResponse.fromJson);
  }

  @override
  Future<ApiResponse> unLikeComment({required String commentId}) async {
    Map<String, dynamic> mapData = {
      "element": "comment", // post,comment,comment-reply
      "elementId": commentId,
      "action": "unlike"
    };
    return await dioCaller.post(
        data: mapData, '/api/like', fromJson: CommunityPostResponse.fromJson);
  }

  @override
  Future<ApiResponse<Map<String, List<SearchResponse>>>> search(
      {required String query}) async {
    return await dioCaller.get('api/community/search?query=$query',
        fromJson: SearchResponse.fromResultJson);
  }

  @override
  Future<ApiResponse<CommunityPost>> getPost({required String postId}) async {
    return await dioCaller.get(
      '/api/community/posts/$postId',
      fromJson: CommunityPost.fromResultJson,
    );
  }

  @override
  Future<ApiResponse> leaveComment({required CommentRequest body}) async {
    return await dioCaller.post(
      '/api/comment',
      data: body.toJson(),
      fromJson: (data) => data,
    );
  }

  @override
  Future<ApiResponse<List<PostCommentResponse>>> getComments(
      String postId) async {
    return await dioCaller.get(
      '/api/comment?postId=$postId',
      fromJson: PostCommentResponse.listFromJson,
    );
  }
}
