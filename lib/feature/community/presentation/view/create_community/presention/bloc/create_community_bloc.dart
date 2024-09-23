import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

part 'create_community_event.dart';
part 'create_community_state.dart';
part 'create_community_bloc.freezed.dart';

@injectable
class CreateCommunityBloc extends Bloc<CreateCommunityEvent, CreateCommunityState> {
  final CommunityRepository repository;

  CreateCommunityBloc(this.repository) : super(const CreateCommunityState()) {
    on<_Init>(_onInit);
    on<_NewCommunityEvent>(_onCreateCommunityEvent);
  }

  _onInit(_Init event, Emitter<CreateCommunityState> emit) async {}

  _onCreateCommunityEvent(_NewCommunityEvent event,
      Emitter<CreateCommunityState> emit) async {
    emit(state.copyWith(createStatus: CreateCommunityStatus.loading));
    final apiResponse = await repository.createCommunity(request: event.communityRequest);
    apiResponse.when(completed: (data, int? statusCode) {
      CreateCommunityResponse response = data;
      emit(state.copyWith(createStatus: CreateCommunityStatus.success,
          createResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(createStatus: CreateCommunityStatus.failure,
          errorMessage: apiError.message));
    });
  }
}
