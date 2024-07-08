import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/account_info/data/model/account_info_response.dart';
import 'package:maze_app/feature/account_info/data/model/register_details_response.dart';
import 'package:maze_app/feature/account_info/domain/entity/user_info.dart';
import 'package:maze_app/feature/account_info/domain/repository/account_info_repository.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/entry_mode.dart';

part 'account_info_event.dart';
part 'account_info_state.dart';
part 'account_info_bloc.freezed.dart';

@Injectable()
class AccountInfoBloc extends Bloc<AccountInfoEvent, AccountInfoState> {
  final AccountInfoRepository repository;

  AccountInfoBloc(this.repository) : super(const AccountInfoState()) {
     on<_Init>(_onInit);
    on<_FetchCountryListEvent>(_onFetchCountryList);
    on<_FetchStateListEvent>(_onFetchStateList);
    on<_FetchCouncilListEvent>(_onFetchCouncilList);
    on<_SetSelectedResultEvent>(_onSetSelectedResult);
    on<_RegisterDetailsEvent>(_onRegisterDetails);
  }



  _onInit(_Init event, Emitter<AccountInfoState> emit) async {}
  _onFetchCountryList(_FetchCountryListEvent event, Emitter<AccountInfoState> emit) async {
    emit(state.copyWith(infoStatus: AccountInfoStatus.loading));

    final apiResponse=await repository.getCountryList();
    apiResponse.when(completed: (data,int? statusCode){

      AccountInfoResponse response=data;
      List<Result>? list=response.resultList;
      emit(state.copyWith(infoStatus: AccountInfoStatus.loadAllCountryList,allFetchedCountryList: list));

    }, error: (apiError){
      emit(state.copyWith(infoStatus: AccountInfoStatus.fetchFailure));
    });
  }

  _onFetchStateList(_FetchStateListEvent event, Emitter<AccountInfoState> emit) async {
    emit(state.copyWith(infoStatus: AccountInfoStatus.loading));

    final apiResponse=await repository.getStateList(countryId: event.countryId);
    apiResponse.when(completed: (data,int? statusCode){

      AccountInfoResponse response=data;
      List<Result>? list=response.resultList;
      emit(state.copyWith(infoStatus: AccountInfoStatus.loadAllStateList,allFetchedSateList: list));

    }, error: (apiError){
      emit(state.copyWith(infoStatus: AccountInfoStatus.fetchFailure));
    });
  }

  _onFetchCouncilList(_FetchCouncilListEvent event, Emitter<AccountInfoState> emit) async {
    emit(state.copyWith(infoStatus: AccountInfoStatus.loading));

    final apiResponse=await repository.getCouncilList(stateId: event.stateId);
    apiResponse.when(completed: (data,int? statusCode){

      AccountInfoResponse response=data;
      List<Result>? list=response.resultList;
      emit(state.copyWith(infoStatus: AccountInfoStatus.loadAllCouncilList,allFetchedCouncilList: list));

    }, error: (apiError){
      emit(state.copyWith(infoStatus: AccountInfoStatus.fetchFailure));
    });
  }

  _onSetSelectedResult(_SetSelectedResultEvent event, Emitter<AccountInfoState> emit) async {
    emit(state.copyWith(
        infoStatus: AccountInfoStatus.notifyChangeFieldsValue,
        entryMode: event.entryMode,
        selectedResult: event.selectedResult));
  }

  _onRegisterDetails(_RegisterDetailsEvent event, Emitter<AccountInfoState> emit) async {
    emit(state.copyWith(infoStatus: AccountInfoStatus.loading));

    final apiResponse=await repository.registerDetails(userInfoParam: event.userInfoParam );
    apiResponse.when(completed: (data,int? statusCode){

      RegisterDetailsResponse response=data;
      emit(state.copyWith(infoStatus: AccountInfoStatus.registerSuccess,response: response));

    }, error: (apiError){
      emit(state.copyWith(infoStatus: AccountInfoStatus.registerFailure));
    });
  }
}
