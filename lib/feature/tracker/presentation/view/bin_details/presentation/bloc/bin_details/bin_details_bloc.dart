import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/data/model/bin_response/bin_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'bin_details_event.dart';
part 'bin_details_state.dart';
part 'bin_details_bloc.freezed.dart';

@injectable
class BinDetailsBloc extends Bloc<BinDetailsEvent, BinDetailsState> {
  final TrackerRepository repository;

  BinDetailsBloc(this.repository) : super(const BinDetailsState()) {
    on<_Init>(_onInit);
    on<_EditBin>(_onEditBin);
    on<_GetBinDetails>(_onGetBinDetails);
    on<_MuteNotification>(_onMuteNotification);
    on<_UnMuteNotification>(_onUnMuteNotification);
  }

  _onInit(_Init event, Emitter<BinDetailsState> emit) async {
  }

  _onEditBin(_EditBin event, Emitter<BinDetailsState> emit) async {
    emit(state.copyWith(status: BinDetailsStatus.loading));
    final response = await repository.editBin(bin: event.bin);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: BinDetailsStatus.success));
    }, error: (apiError) {
      emit(state.copyWith(status: BinDetailsStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onGetBinDetails(_GetBinDetails event, Emitter<BinDetailsState> emit) async {
    emit(state.copyWith(status: BinDetailsStatus.loading));

    final response = await repository.getBinDetails(binId: event.binId);
    response.when(completed: (data, int? statusCode) {
      BinDetails response=data.result!;
      emit(state.copyWith(status: BinDetailsStatus.success,response: response));
    }, error: (apiError) {
      emit(state.copyWith(status: BinDetailsStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onMuteNotification(_MuteNotification event, Emitter<BinDetailsState> emit) async {
    emit(state.copyWith(status: BinDetailsStatus.loading));
    final response = await repository.muteNotification(binId: event.binId);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: BinDetailsStatus.muted));
    }, error: (apiError) {
      emit(state.copyWith(status: BinDetailsStatus.failureMuted,
          errorMessage: apiError.message));
    });
  }

  _onUnMuteNotification(_UnMuteNotification event, Emitter<BinDetailsState> emit) async {
    emit(state.copyWith(status: BinDetailsStatus.loading));
    final response = await repository.unMuteNotification(binId: event.binId);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: BinDetailsStatus.unMuted));
    }, error: (apiError) {
      emit(state.copyWith(status: BinDetailsStatus.failureUnMuted,
          errorMessage: apiError.message));
    });
  }
}