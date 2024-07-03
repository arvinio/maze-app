import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/local/setting_manager.dart';
import 'package:maze_app/di/injection_container.dart';
import 'package:maze_app/feature/auth/login/data/model/login_response.dart';
import 'package:maze_app/feature/auth/login/domain/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository repository;

  LoginBloc(this.repository) : super(const LoginState()) {
    on<_Init>(_onInit);
    on<_LoginUser>(_onLoginUser);
  }

  _onInit(_Init event, Emitter<LoginState> emit) {
  }

  _onLoginUser(_LoginUser event, Emitter<LoginState> emit) async{
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    final apiResponse=await repository.login(email: event.email, password: event.password);
    apiResponse.when(completed: (data,int? statusCode){
      LoginResponse response=data;
      if(response.success!) {
        inject<SettingsManager>().setBearerToken(response.token!);
        inject<SettingsManager>().setRefreshToken(response.refreshToken!);
        inject<SettingsManager>().setRole(response.role!);
      }
      emit(state.copyWith(loginResponse: response,loginStatus: LoginStatus.success));

    },
        error: (apiError){
          emit(state.copyWith(loginStatus: LoginStatus.failure,errorMessage: apiError.message,errorCode: apiError.code));
        });
  }
}
