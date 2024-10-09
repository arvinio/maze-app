import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'manage_bins_event.dart';
part 'manage_bins_state.dart';
part 'manage_bins_bloc.freezed.dart';

@injectable
class ManageBinsBloc extends Bloc<ManageBinsEvent, ManageBinsState> {
  final TrackerRepository repository;

  ManageBinsBloc(this.repository) : super(const ManageBinsState()) {
    on<_Init>(_onInit);
    on<_DeleteBin>(_onDeleteBin);
    on<_DeleteBinPermanently>(_onDeleteBinPermanently);
    on<_RestoreBin>(_onRestoreBin);
    on<_GetDeletedBins>(_onGetDeletedBins);
    on<_TransferBinData>(_onTransferBinData);
  }


  _onInit(_Init event, Emitter<ManageBinsState> emit) async {
    emit(state.copyWith(status: ManageBinsStatus.init));
  }


  _onDeleteBin(_DeleteBin event, Emitter<ManageBinsState> emit) async {
    emit(state.copyWith(status: ManageBinsStatus.loading));
    final response = await repository.deleteBin(binId: event.id);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: ManageBinsStatus.deleted));
    }, error: (apiError) {
      emit(state.copyWith(status: ManageBinsStatus.deleteFailure,
          errorMessage: apiError.message));
    });
  }

  _onDeleteBinPermanently(_DeleteBinPermanently event,
      Emitter<ManageBinsState> emit) async {
    emit(state.copyWith(status: ManageBinsStatus.loading));
    final response = await repository.deleteBinPermanently(binId: event.id);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: ManageBinsStatus.deleted));
    }, error: (apiError) {
      emit(state.copyWith(status: ManageBinsStatus.deleteFailure,
          errorMessage: apiError.message));
    });
  }

  _onRestoreBin(_RestoreBin event, Emitter<ManageBinsState> emit) async {
    final response = await repository.restoreDeletedBin(binId: event.id);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: ManageBinsStatus.restored));
    }, error: (apiError) {
      emit(state.copyWith(status: ManageBinsStatus.failure,
          errorMessage: apiError.message));
    });
  }


  _onGetDeletedBins(_GetDeletedBins event,
      Emitter<ManageBinsState> emit) async {
    emit(state.copyWith(status: ManageBinsStatus.loading));
    final response = await repository.getDeletedBins();
    response.when(
      completed: (data, statusCode) {
        DeletedBinsResponse response = data;
        List<DeletedBin>? bins = response.bins;
        emit(state.copyWith(
            status: ManageBinsStatus.fetchDeletedBins, deletedBins: bins));
      },
      error: (apiError) {
        emit(state.copyWith(status: ManageBinsStatus.failure,
            errorMessage: apiError.message));
      },
    );
  }

  _onTransferBinData(_TransferBinData event,
      Emitter<ManageBinsState> emit) async {
    emit(state.copyWith(status: ManageBinsStatus.loading));
    final response = await repository.transferBinData(event.sourceBinId, event.targetBinId);
    response.when(
      completed: (data, statusCode) {
        emit(state.copyWith(
            status: ManageBinsStatus.transferSuccess));
      },
      error: (apiError) {
        emit(state.copyWith(status: ManageBinsStatus.transferFailure,
            errorMessage: apiError.message));
      },
    );
  }
}