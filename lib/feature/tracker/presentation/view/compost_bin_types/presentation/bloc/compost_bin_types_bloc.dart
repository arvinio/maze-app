import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/data/model/compost_bin_types/compost_bin_types_response.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'compost_bin_types_event.dart';
part 'compost_bin_types_state.dart';
part 'compost_bin_types_bloc.freezed.dart';

@injectable
class CompostBinTypesBloc extends Bloc<CompostBinTypesEvent, CompostBinTypesState> {
  final TrackerRepository repository;

  CompostBinTypesBloc(this.repository) : super(const CompostBinTypesState()) {
    on<_Init>(_onInit);
    on<_GetCompostBinTypesEvent>(_onGetCompostBinTypesEvent);
  }

  _onInit(_Init event, Emitter<CompostBinTypesState> emit) async {
    emit(state.copyWith(status: CompostBinTypesStatus.init));
  }

  _onGetCompostBinTypesEvent(_GetCompostBinTypesEvent event,
      Emitter<CompostBinTypesState> emit) async {
    emit(state.copyWith(status: CompostBinTypesStatus.loading));
    final apiResponse = await repository.getListOfCompostBinTypes();
    apiResponse.when(completed: (data, int? statusCode) {
      CompostBinTypesResponse response = data;
      List<CompostBinTypes>? compostBinTypes = response.compostBinTypes;
      emit(state.copyWith(status: CompostBinTypesStatus.loadCompostBinTypes,
          retrievedCompostBinTypes: compostBinTypes));
    }, error: (apiError) {
      emit(state.copyWith(status: CompostBinTypesStatus.failure,
          errorMessage: apiError.message));
    });
  }
}