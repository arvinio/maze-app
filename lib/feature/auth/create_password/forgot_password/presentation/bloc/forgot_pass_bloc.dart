import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/data/model/forgot_password_response.dart';
import 'package:maze_app/feature/auth/create_password/forgot_password/domain/repository/forgot_pass_repository.dart';
part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';
part 'forgot_pass_bloc.freezed.dart';

@injectable
class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  final ForgotPassRepository repository;

  ForgotPassBloc(this.repository) : super(const ForgotPassState()) {
    on<_Init>(_onInit);
    on<_forgotPass>(_onForgot);
  }

  _onInit(_Init event, Emitter<ForgotPassState> emit) async {
  }


  _onForgot(_forgotPass event, Emitter<ForgotPassState> emit) async {
    emit(state.copyWith(forgotPassStatus: ForgotPassStatus.loading));
    final apiResponse = await repository.forgotPassword(email: event.email);
    apiResponse.when(completed: (data, int? statusCode) {
      ForgotPasswordResponse response = data;
      emit(state.copyWith(forgotPassResponse: response,
          forgotPassStatus: ForgotPassStatus.success));
    },
        error: (apiError) {
          emit(state.copyWith(forgotPassStatus: ForgotPassStatus.failure,errorMessage: apiError.message));
        });
  }
}