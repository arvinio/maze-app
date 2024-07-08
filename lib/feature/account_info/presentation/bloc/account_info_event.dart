part of 'account_info_bloc.dart';

@freezed
class AccountInfoEvent with _$AccountInfoEvent {
  const factory AccountInfoEvent.init() = _Init;
  const factory AccountInfoEvent.fetchCountryListEvent() = _FetchCountryListEvent;
  const factory AccountInfoEvent.fetchStateListEvent({required String countryId}) = _FetchStateListEvent;
  const factory AccountInfoEvent.fetchCouncilResultEvent({required String stateId}) = _FetchCouncilListEvent;
  const factory AccountInfoEvent.setSelectedResultEvent(Result selectedResult,EntryMode entryMode) = _SetSelectedResultEvent;
  const factory AccountInfoEvent.registerDetailsEvent( {required UserInfo userInfoParam}
      ) = _RegisterDetailsEvent;
}
