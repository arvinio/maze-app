import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/data/model/bin_response/bin_response.dart';
import 'package:maze_app/feature/tracker/data/model/enum/create_bin_types.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'edit_bin_event.dart';
part 'edit_bin_state.dart';
part 'edit_bin_bloc.freezed.dart';

@injectable
class EditBinBloc extends Bloc<EditBinEvent, EditBinState> {
  final TrackerRepository repository;

  EditBinBloc(this.repository) : super(const EditBinState()) {
    on<_Init>(_onInit);
    on<_EditBin>(_onEditBin);
    on<_GetBinDetails>(_onGetBinDetails);
  }


  _onInit(_Init event, Emitter<EditBinState> emit) async {
  }

  _onEditBin(_EditBin event, Emitter<EditBinState> emit) async {
    emit(state.copyWith(status: EditBinStatus.loading));
    final response = await repository.editBin(bin: event.bin);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: EditBinStatus.success));
    }, error: (apiError) {
      emit(state.copyWith(status: EditBinStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onGetBinDetails(_GetBinDetails event, Emitter<EditBinState> emit) async {
    emit(state.copyWith(status: EditBinStatus.loading));

    final response = await repository.getBinDetails(binId: event.binId);
    response.when(completed: (data, int? statusCode) {
      BinDetails response=data.result!;
      emit(state.copyWith(status: EditBinStatus.success,response: response));
    }, error: (apiError) {
      emit(state.copyWith(status: EditBinStatus.failure,
          errorMessage: apiError.message));
    });
  }



}