import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/profile/data/model/community_profile_response/community_profile_response.dart';
import 'package:maze_app/feature/profile/domain/repository/profile_repository.dart';

part 'community_profile_event.dart';
part 'community_profile_state.dart';
part 'community_profile_bloc.freezed.dart';

@injectable
class CommunityProfileBloc extends Bloc<CommunityProfileEvent, CommunityProfileState> {
  final ProfileRepository repository;

  CommunityProfileBloc(this.repository) : super(const CommunityProfileState()) {
    on<_Init>(_onInit);
    on<_GetCommunityProfile>(_onGetCommunityProfile);
  }
  _onInit(_Init event, Emitter<CommunityProfileState> emit) async {
  }

  _onGetCommunityProfile(_GetCommunityProfile event,
      Emitter<CommunityProfileState> emit) async {
    emit(state.copyWith(status: CommunityProfileStatus.loading));
    final response = await repository.getCommunityProfile();
    response.when(completed: (data, int? statusCode) {
      CommunityProfileResponse response = data;

      emit(state.copyWith(status: CommunityProfileStatus.success,
        wasteSaved: response.statistics!.landfill,
        wasteRecycled: response.statistics!.compost
      ));
    }, error: (apiError) {
      emit(state.copyWith(status: CommunityProfileStatus.failure,
          errorMessage: apiError.message));
    });
  }
}
