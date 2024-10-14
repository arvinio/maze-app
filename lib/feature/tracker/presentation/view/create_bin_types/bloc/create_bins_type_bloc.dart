import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/data/model/enum/create_bin_types.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'create_bins_type_event.dart';
part 'create_bins_type_state.dart';
part 'create_bins_type_bloc.freezed.dart';

@injectable
class CreateBinsTypeBloc extends Bloc<CreateBinsTypeEvent, CreateBinsTypeState> {
  final TrackerRepository repository;

  CreateBinsTypeBloc(this.repository) : super(const CreateBinsTypeState()) {
    on<_Init>(_onInit);
    on<_CreateBin>(_onCreateBin);
  }


  _onInit(_Init event, Emitter<CreateBinsTypeState> emit) async {
  }

  _onCreateBin(_CreateBin event, Emitter<CreateBinsTypeState> emit) async {
    emit(state.copyWith(status: CreateBinsTypeStatus.loading));
    final response = await repository.createBin(
        bin: event.bin, binType: event.binType);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: CreateBinsTypeStatus.success));
    }, error: (apiError) {
      emit(state.copyWith(status: CreateBinsTypeStatus.failure,
          errorMessage: apiError.message));
    });
  }

}
