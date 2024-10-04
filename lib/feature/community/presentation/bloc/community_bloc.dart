import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/data/model/my_communities/my_communities_response.dart';
import 'package:maze_app/feature/community/data/model/other_communities/other_communities_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

part 'community_event.dart';
part 'community_state.dart';
part 'community_bloc.freezed.dart';

@injectable
class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository repository;

  CommunityBloc(this.repository) : super(const CommunityState()) {
    on<_Init>(_onInit);
    on<_GetCommunityDetailsEvent>(_onGetCommunityDetailsEvent);
    on<_GetMyCommunitiesEvent>(_onGetMyCommunitiesEvent);
    on<_GetOtherCommunitiesEvent>(_onGetOtherCommunitiesEvent);
  }

  _onInit(_Init event, Emitter<CommunityState> emit) async {}

  _onGetCommunityDetailsEvent(
      _GetCommunityDetailsEvent event, Emitter<CommunityState> emit) async {
    emit(state.copyWith(communityStatus: CommunityStatus.loading));

    final apiResponse = await repository.communityDetails(id: event.id);
    apiResponse.when(completed: (data, int? statusCode) {
      CommunityDetailsResponse response = data;
      emit(state.copyWith(
          communityStatus: CommunityStatus.success, details: response));
    }, error: (apiError) {
      emit(state.copyWith(
          communityStatus: CommunityStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onGetMyCommunitiesEvent(
      _GetMyCommunitiesEvent event, Emitter<CommunityState> emit) async {
    emit(state.copyWith(communityStatus: CommunityStatus.myCommunityLoading));

    final apiResponse = await repository.myCommunities();
    apiResponse.when(completed: (data, int? statusCode) {
      MyCommunitiesResponse response = data;
      emit(state.copyWith(
          communityStatus: CommunityStatus.myCommunitySuccess,
          myCommunities: response));
    }, error: (apiError) {
      emit(state.copyWith(
          communityStatus: CommunityStatus.myCommunityFailure,
          errorMessage: apiError.message));
    });
  }

  _onGetOtherCommunitiesEvent(
      _GetOtherCommunitiesEvent event, Emitter<CommunityState> emit) async {
    emit(state.copyWith(
        communityStatus: CommunityStatus.otherCommunitiesLoading));

    final apiResponse = await repository.otherCommunities();
    apiResponse.when(completed: (data, int? statusCode) {
      OtherCommunitiesResponse response = data;
      emit(state.copyWith(
          communityStatus: CommunityStatus.otherCommunitiesSuccess,
          otherCommunities: response));
    }, error: (apiError) {
      emit(state.copyWith(
          communityStatus: CommunityStatus.otherCommunitiesFailure,
          errorMessage: apiError.message));
    });
  }
}
