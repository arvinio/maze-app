import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/resend_response/resend_response.dart';
import 'package:maze_app/feature/auth/signing_up/data/model/verify_response/verify_response.dart';
import 'package:maze_app/feature/auth/signing_up/domain/repository/verify_repository.dart';

part 'verify_event.dart';
part 'verify_state.dart';
part 'verify_bloc.freezed.dart';

@injectable
class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final VerifyRepository repository;

  VerifyBloc(this.repository) : super(const VerifyState()) {

    on<_Init>(_onInit);
    on<_VeifyCode>(_onVerify);
    on<_Resend>(_onResend);
  }

  _onInit(_Init event, Emitter<VerifyState> emit) async{
  }

  _onVerify(_VeifyCode event, Emitter<VerifyState> emit) async{
    emit(state.copyWith(verifyStatus: VerifyStatus.loading));

     final apiResponse=await repository.verify(userId: event.userId, code: event.code);
     apiResponse.when(completed: (data,int? statusCode){
       VerifyResponse response=data;

         inject<SettingsManager>().setBearerToken(response.token!);
         inject<SettingsManager>().setRefreshToken(response.refreshToken!);

       emit(state.copyWith(verifyResponse: response,verifyStatus: VerifyStatus.success));

     },
         error: (apiError){
       emit(state.copyWith(verifyStatus: VerifyStatus.failure));
     });
  }

  _onResend(_Resend event, Emitter<VerifyState> emit) async{

   emit(state.copyWith(verifyStatus: VerifyStatus.loading));

    final apiResponse=await repository.resend(userId: event.userId);
    apiResponse.when(completed: (data,int? statusCode){
      ResendResponse response=data;
      emit(state.copyWith(resendResponse: response,verifyStatus: VerifyStatus.resendSuccess));

    },
        error: (apiError){
          emit(state.copyWith(verifyStatus: VerifyStatus.failure));
        });
  }
}
