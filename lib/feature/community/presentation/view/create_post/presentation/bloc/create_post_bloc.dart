import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/core/util/Post_data_request/post_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/data/model/create_post/create_post_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';
part 'create_post_bloc.freezed.dart';

@injectable
class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CommunityRepository repository;

  CreatePostBloc(this.repository) : super(const CreatePostState()) {
    on<_Init>(_onInit);
    on<_NewPostEvent>(_onNewPostEvent);
    on<_SetSelectedCommunityEvent>(_onSetSelectedCommunity);
  }

  _onInit(_Init event, Emitter<CreatePostState> emit) async {}

  _onNewPostEvent(_NewPostEvent event,
      Emitter<CreatePostState> emit) async {
    emit(state.copyWith(createStatus: CreatePostStatus.loading));

    final apiResponse = await repository.createPost(
        request: event.postRequest);
    apiResponse.when(completed: (data, int? statusCode) {
      CreatePostResponse response = data;
      emit(state.copyWith(createStatus: CreatePostStatus.success,
          createResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(createStatus: CreatePostStatus.failure,
          errorMessage: apiError.message));
    });
  }


  _onSetSelectedCommunity(_SetSelectedCommunityEvent event, Emitter<CreatePostState> emit) async {
    emit(state.copyWith(
        createStatus: CreatePostStatus.notifyChangeFieldsValue,
        selectedCommunity: event.selectedCommunity));
  }
}
