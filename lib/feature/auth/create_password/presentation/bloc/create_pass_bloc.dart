import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/auth/create_password/data/model/create_password_response.dart';
import 'package:maze_app/feature/auth/create_password/domain/repository/create_password_repository.dart';

part 'create_pass_event.dart';
part 'create_pass_state.dart';
part 'create_pass_bloc.freezed.dart';

@injectable
class CreatePassBloc extends Bloc<CreatePassEvent, CreatePassState> {
  final CreatePasswordRepository repository;


  CreatePassBloc(this.repository) : super(const CreatePassState()) {
    on<_Init>(_onInit);
    on<_ConfirmPassword>(_onConfirm);
  }

  _onInit(_Init event, Emitter<CreatePassState> emit) async {
  }

  _onConfirm(_ConfirmPassword event, Emitter<CreatePassState> emit) async {
      emit(state.copyWith(createPassStatus: CreatePassStatus.loading));

    final apiResponse=await repository.setPassword(password: event.password);
    apiResponse.when(completed: (data,int? statusCode){
      CreatePasswordResponse response=data;
      emit(state.copyWith(createPassResponse: response,createPassStatus: CreatePassStatus.success));

    },
        error: (apiError){
          emit(state.copyWith(createPassStatus: CreatePassStatus.failure));
        });
  }
}
