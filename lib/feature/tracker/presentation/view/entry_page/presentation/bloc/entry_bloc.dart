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
  }

  _onInit(_Init event, Emitter<EntryState> emit) async {
  }

  _onGetBinEntries(_GetBinEntries event, Emitter<EntryState> emit) async {
    emit(state.copyWith(status: EntryStatus.loading));
    final response = await repository.getBinEntryList(binId: event.binId);
    response.when(completed: (data, int? statusCode) {
      for (var element in data.result!) {
        entries.add(EditEntry(
          element.id!,
          whatRecycled: element.whatRecycle,
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
      emit(state.copyWith(status: EntryStatus.success,entries: entries));
    }, error: (apiError) {
      emit(state.copyWith(status: EntryStatus.failure,
          errorMessage: apiError.message));
    });
  }
}