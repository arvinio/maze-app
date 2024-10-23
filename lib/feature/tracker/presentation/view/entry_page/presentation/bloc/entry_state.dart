part of 'entry_bloc.dart';


enum EntryStatus {
  init,
  loading,
  success,
  deleted,
  deleteFailure,
  failure;

  bool get isInit => this == EntryStatus.init;
  bool get isLoading => this == EntryStatus.loading;
  bool get isSuccess => this == EntryStatus.success;
  bool get isDeleted => this == EntryStatus.deleted;
  bool get isDeleteFailure => this == EntryStatus.deleteFailure;
  bool get isFailure => this == EntryStatus.failure;
}

@freezed
class EntryState with _$EntryState {
  const factory EntryState ({
    @Default(EntryStatus.init) EntryStatus status,
    @Default([]) List<EditEntry>? entries ,
    int? totalAmount,
    String? errorMessage
  }) = _EntryState;
}