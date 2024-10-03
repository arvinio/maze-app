import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

import '../../../data/model/search/search_response.dart';

part 'search_community_bloc.freezed.dart';
part 'search_community_event.dart';
part 'search_community_state.dart';

@injectable
class SearchCommunityBloc
    extends Bloc<SearchCommunityEvent, SearchCommunityState> {
  final CommunityRepository repository;

  SearchCommunityBloc(this.repository) : super(const SearchCommunityState()) {
    on<SearchCommunityEvent>((event, emit) async {
      if (event is SearchCommunityWithQueryEvent) {
        emit(state.copyWith(
          searchStatus: SearchCommunityStatus.loading,
        ));
        final apiResponse = await repository.search(query: event.query);
        apiResponse.when(
          completed: (data, int? statusCode) {
            var isEmpty = true;
            for (var key in data.keys) {
              if (data[key]!.isNotEmpty) {
                isEmpty = false;
                break;
              }
            }

            data.removeWhere((key, list) => list.isEmpty);

            emit(state.copyWith(
              searchResults: data,
              searchStatus: SearchCommunityStatus.success,
              isEmpty: isEmpty,
            ));
          },
          error: (apiError) {
            emit(state.copyWith(
                searchStatus: SearchCommunityStatus.failure,
                errorMessage: apiError.message));
          },
        );
      }
    });
  }
}
