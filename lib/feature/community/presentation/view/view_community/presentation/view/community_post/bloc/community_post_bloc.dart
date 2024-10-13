import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/core/util/community_post_data_request/community_post_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_post/community_post_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

part 'community_post_bloc.freezed.dart';
part 'community_post_event.dart';
part 'community_post_state.dart';

@injectable
class CommunityPostBloc extends Bloc<CommunityPostEvent, CommunityPostState> {
  final CommunityRepository repository;
  CommunityPostBloc(this.repository) : super(CommunityPostState()) {
    on<_init>(_onInit);
    on<_postList>(_onPostList);
    on<_likePost>(_onLikePost);
    on<_unLikePost>(_onUnLikePost);
  }

  _onInit(_init event, Emitter<CommunityPostState> emit) {
    emit(state.copyWith(state: CommunityPostStatus.init));
  }

  _onPostList(_postList event, Emitter<CommunityPostState> emit) async {
    emit(state.copyWith(state: CommunityPostStatus.loading));
    final apiResponse =
        await repository.communityPostList(request: event.request);
    apiResponse.when(completed: (data, int? statusCode) {
      CommunityPostResponse response = data;
      if (response.success == true) {
        emit(state.copyWith(
            state: CommunityPostStatus.success,
            communityPostList: response.communityPosts));
      } else {
        emit(state.copyWith(state: CommunityPostStatus.failure));
      }
    }, error: (apiError) {
      emit(state.copyWith(
          state: CommunityPostStatus.failure, errorMessage: apiError.message));
    });
  }

  _onLikePost(_likePost event, Emitter<CommunityPostState> emit) async {
    final apiResponse = await repository.likePost(postId: event.postId);
    apiResponse.when(
        completed: (data, int? statusCode) {
          CommunityPostResponse response = data;
          if (response.success == true) {
            emit(state.copyWith(
                state: CommunityPostStatus.likeSuccessful,
                likeActionPostId: event.postId,
                communityPostList: state.communityPostList));
          }
        },
        error: (apiError) {});
  }

  _onUnLikePost(_unLikePost event, Emitter<CommunityPostState> emit) async {
    final apiResponse = await repository.unLikePost(postId: event.postId);
    apiResponse.when(
        completed: (data, int? statusCode) {
          CommunityPostResponse response = data;
          if (response.success == true) {
            emit(state.copyWith(
                state: CommunityPostStatus.unLikeSuccessful,
                likeActionPostId: event.postId,
                communityPostList: state.communityPostList));
          }
        },
        error: (apiError) {});
  }
}
