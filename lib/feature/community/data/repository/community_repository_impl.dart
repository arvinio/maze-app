import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/data/data_source/community_remote_data_source.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';


@Injectable(as:CommunityRepository)
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityRemoteDataSource remoteDataSource;

  CommunityRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse<CreateCommunityResponse>> createCommunity(
      {required Community request}) {
    return remoteDataSource.createCommunity(request: request);
  }

  @override
  Future<ApiResponse<CreatePostResponse>> createPost({required PostDataRequest request}) {
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

}