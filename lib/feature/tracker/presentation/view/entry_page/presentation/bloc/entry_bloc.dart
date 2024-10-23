import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

part 'entry_event.dart';
part 'entry_state.dart';
part 'entry_bloc.freezed.dart';

@injectable
class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final TrackerRepository repository;
  final List<EditEntry> entries = [];

  EntryBloc(this.repository) : super(const EntryState()) {
    on<_Init>(_onInit);
    on<_GetBinEntries>(_onGetBinEntries);
    on<_AddEntryToBin>(_onAddEntryToBin);
    on<_DeleteBinEntry>(_onDeleteBinEntry);
  }

  _onInit(_Init event, Emitter<EntryState> emit) async {
  }

  _onGetBinEntries(_GetBinEntries event, Emitter<EntryState> emit) async {
    emit(state.copyWith(status: EntryStatus.loading));
    final response = await repository.getBinEntryList(binId: event.binId,sort:event.sort);
    response.when(completed: (data, int? statusCode) {
      int totalAmount=data.result!.isNotEmpty ?data.result![0].bin!.totalAmount!:0;
      entries.clear();
      for (var element in data.result!) {
        entries.add(EditEntry(
          element.id!,
          whatDidAdd: element.whatDidAdd,
          compostUsed: element.compostUsed,
          entryDate: element.entryDate!,
          binId: event.binId,
          type: EntryType.fromString(element.type!),
          mixed: element.isMixed,
          note: element.note ?? "",
          photo: element.photos ?? [],
          howFull: element.howFull,
          amount: element.amount.toString(),
        ));
      }
      emit(state.copyWith(status: EntryStatus.success,entries: entries,totalAmount:totalAmount));
    }, error: (apiError) {
      emit(state.copyWith(status: EntryStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onAddEntryToBin(_AddEntryToBin event, Emitter<EntryState> emit) async {
    emit(state.copyWith(status: EntryStatus.loading));
    final response = await repository.createBinEntry(entry: event.entryDetails);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: EntryStatus.success));
    }, error: (apiError) {
      emit(state.copyWith(status: EntryStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onDeleteBinEntry(_DeleteBinEntry event, Emitter<EntryState> emit) async {
    emit(state.copyWith(status: EntryStatus.loading));
    final response = await repository.deleteBinEntry(entryId: event.entryId);
    response.when(completed: (data, int? statusCode) {
      emit(state.copyWith(status: EntryStatus.deleted));
    }, error: (apiError) {
      emit(state.copyWith(status: EntryStatus.deleteFailure,
          errorMessage: apiError.message));
    });
  }

}