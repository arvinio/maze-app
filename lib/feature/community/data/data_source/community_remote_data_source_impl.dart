import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';
import 'package:maze_app/feature/community/data/model/my_communities/my_communities_response.dart';
import 'package:maze_app/feature/community/data/model/other_communities/other_communities_response.dart';
import 'community_remote_data_source.dart';


@Injectable(as:CommunityRemoteDataSource)
class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  final DioCaller dioCaller;

  CommunityRemoteDataSourceImpl(
      {@Named(DiConst.dioNamedToken) required this.dioCaller});

  @override
  Future<ApiResponse<CreateCommunityResponse>> createCommunity({required Community request}) async {

    FormData formData = FormData.fromMap({
      'description':request.description
    });

    if (request.name!.isNotEmpty) {
      formData.fields.add(
          MapEntry("name",request.name!));
    }


    if (request.avatar != null) {
      File file = request.avatar!;
      var fileName = file.path
          .split('/')
          .last;

      formData.files.add(MapEntry("avatar", await MultipartFile.fromFile(file.path, filename: fileName)));
    }

    if (request.cover != null) {
      File file = request.cover!;
      var fileName = file.path
          .split('/')
          .last;

      formData.files.add(MapEntry("cover", await MultipartFile.fromFile(file.path, filename: fileName)));
    }


    return await dioCaller.post<CreateCommunityResponse>(
        'api/community', fromJson: CreateCommunityResponse.fromJson,
        data: formData
    );
  }

  @override
  Future<ApiResponse<CreatePostResponse>> createPost({required PostDataRequest request}) async{
    FormData formData = FormData.fromMap({
      'title': request.title,
      'content': request.content,
    });

    if (request.communityId !=null ) {
      formData.fields.add(
          MapEntry("communityId",request.communityId!));
    }

    for (int i = 0; i < request.photos!.length; i++) {
      var path = request.photos![i].path;
      formData.files.addAll([
        MapEntry("photos", await MultipartFile.fromFile(path, filename: path.split('/')
            .last))
      ]);
    }

    return await dioCaller.post<CreatePostResponse>(
        'api/community/post', fromJson: CreatePostResponse.fromJson,
        data: formData
    );
  }
  @override
  Future<ApiResponse> communityDetails({required String id}) async{
    return await dioCaller.get(
        'api/community/$id', fromJson: CommunityDetailsResponse.fromJson);
  }

  @override
  Future<ApiResponse> myCommunities() async{
    return await dioCaller.get(
        'api/community', fromJson: MyCommunitiesResponse.fromJson);
  }

  @override
  Future<ApiResponse> otherCommunities() async{
    return await dioCaller.get(
        'api/community/list', fromJson: OtherCommunitiesResponse.fromJson);
  }
}