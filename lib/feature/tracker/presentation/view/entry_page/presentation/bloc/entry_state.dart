part of 'entry_bloc.dart';


enum EntryStatus {
  init,
  loading,
  success,
  failure;

  bool get isInit => this == EntryStatus.init;
  bool get isLoading => this == EntryStatus.loading;
  bool get isSuccess => this == EntryStatus.success;
  bool get isFailure => this == EntryStatus.failure;
}

@freezed
class EntryState with _$EntryState {
  const factory EntryState ({
    @Default(EntryStatus.init) EntryStatus status,
    @Default([]) List<EditEntry>? entries ,
    String? errorMessage
  }) = _EntryState;
}