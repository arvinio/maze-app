

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:maze_app/feature/community/core/util/community_leaderboard_data_request/community_leaderboard_data_request.dart';
import 'package:maze_app/feature/community/data/model/community_leaderboard/community_leaderboard_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';


part 'community_leaderboard_event.dart';
part 'community_leaderboard_state.dart';
part 'community_leaderboard_bloc.freezed.dart';

@injectable
class CommunityLeaderboardBloc extends Bloc<CommunityLeaderboardEvent , CommunityLeaderboardState > {
  final CommunityRepository repository;

  CommunityLeaderboardBloc(this.repository) : super(const CommunityLeaderboardState()){
    on<_leaderboardList>(_onLeaderboardList);
  }


  _onLeaderboardList(_leaderboardList event ,  Emitter<CommunityLeaderboardState> emit)async{
    emit(state.copyWith(communityLeaderboardStatus: CommunityLeaderboardStatus.loading));

    final apiResponse = await repository.communityLeaderboardList(
 request: event.request
    );
    apiResponse.when(completed: (data, int? statusCode) {
      Logger().w('data : $data');
      CommunityLeaderboardResponse  response = data;
      if(response.success == true){
        emit(state.copyWith(communityLeaderboardStatus: CommunityLeaderboardStatus.success, communityLeaderboards: response.communityLeaderboards));
      }else{
        emit(state.copyWith(communityLeaderboardStatus: CommunityLeaderboardStatus.failure));
      }

    }, error: (apiError) {
      emit(state.copyWith(communityLeaderboardStatus: CommunityLeaderboardStatus.failure,
          errorMessage: apiError.message));
    });
  }
}