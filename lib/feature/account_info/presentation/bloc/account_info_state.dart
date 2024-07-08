part of 'account_info_bloc.dart';

enum AccountInfoStatus {
  init,
  loading,
  loadAllCountryList,
  loadAllStateList,
  loadAllCouncilList,
  fetchFailure,
  notifyChangeFieldsValue,
  registerSuccess,
  registerFailure;

  bool get isInit => this == AccountInfoStatus.init;

  bool get isLoading => this == AccountInfoStatus.loading;
  bool get isLoadAllCountryList => this == AccountInfoStatus.loadAllCountryList;
  bool get isLoadAllStateList => this == AccountInfoStatus.loadAllStateList;
  bool get isLoadAllCouncilList => this == AccountInfoStatus.loadAllCouncilList;
  bool get isNotifyChangeFieldsValue => this == AccountInfoStatus.notifyChangeFieldsValue;
  bool get isFetchFailure => this == AccountInfoStatus.fetchFailure;
  bool get isRegisterSuccess => this == AccountInfoStatus.registerSuccess;
  bool get isRegisterFailure => this == AccountInfoStatus.registerFailure;

}


@freezed
class AccountInfoState with _$AccountInfoState {
  const factory AccountInfoState({
    @Default(AccountInfoStatus.init) AccountInfoStatus  infoStatus,
    @Default([]) List<AccountInfoResponse> infoTypes,
    Result? selectedResult,
    @Default([]) List<Result>? allFetchedCountryList,
    @Default([]) List<Result>? allFetchedSateList,
    @Default([]) List<Result>? allFetchedCouncilList,
    EntryMode? entryMode,
    RegisterDetailsResponse? response
  })=_AccountInfoState;
}
