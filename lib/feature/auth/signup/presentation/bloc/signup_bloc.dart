import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/auth/signup/data/model/signup_response.dart';
import 'package:maze_app/feature/auth/signup/domain/repository/signup_repository.dart';


part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository signupRepository;

  SignupBloc(this.signupRepository) : super(const SignupState()) {
    on<_InitEvent>(_onInit);
  }

   _onInit(_InitEvent event, Emitter<SignupState> emit) async{
   emit(state.copyWith(signupStatus: SignupStatus.loading));
   final apiResponse=await signupRepository.signUp(email: event.userName);
   apiResponse.when(completed: (data,int? statusCode){
     SignupResponse response=data;
     if(statusCode==208) {
         emit(state.copyWith(
             signupStatus: SignupStatus.register, signupResponse: response));
       }else {
       emit(state.copyWith(
           signupStatus: SignupStatus.success, signupResponse: response));
     }
   }
       ,error:(apiError){
         emit(state.copyWith(signupStatus: SignupStatus.failure,errorMessage: apiError.message));
       }
    );

  }

}
