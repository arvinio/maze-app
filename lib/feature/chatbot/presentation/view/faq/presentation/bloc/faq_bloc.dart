import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/chatbot/core/update_faq_request/update_faq_request.dart';
import 'package:maze_app/feature/chatbot/core/util/create_faq_request/create_faq_request.dart';
import 'package:maze_app/feature/chatbot/data/model/crud_faq/crud_faq_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq/faq_list_response.dart';
import 'package:maze_app/feature/chatbot/data/model/faq_response/faq_response.dart';
import 'package:maze_app/feature/chatbot/domain/repository/chatbot_repository.dart';

part 'faq_event.dart';
part 'faq_state.dart';
part 'faq_bloc.freezed.dart';

@injectable
class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final CharBotRepository repository;

  FaqBloc(this.repository) : super(const FaqState()) {
    on<_Init>(_onInit);
    on<_FetchFaqListEvent>(_onFetchFaqListEvent);
    on<_GetFaqEvent>(_onGetFaqEvent);
    on<_CreateFaqEvent>(_onCreateFaqEvent);
    on<_UpdateFaqEvent>(_onUpdateFaqEvent);
    on<_DeleteFaqEvent>(_onDeleteFaq);
  }


  _onInit(_Init event, Emitter<FaqState> emit) async {}


  _onFetchFaqListEvent(_FetchFaqListEvent event, Emitter<FaqState> emit) async {
    emit(state.copyWith(faqStatus: FaqStatus.loading));

    final apiResponse = await repository.getFaqList();
    apiResponse.when(completed: (data, int? statusCode) {
      FaqListResponse response = data;
      List<FaqResult>? list = response.result;
      emit(state.copyWith(faqStatus: FaqStatus.loadFaqs,
          fetchedFaqs: list));
    }, error: (apiError) {
      emit(state.copyWith(faqStatus: FaqStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onGetFaqEvent(_GetFaqEvent event, Emitter<FaqState> emit) async {
    emit(state.copyWith(faqStatus: FaqStatus.loading));

    final apiResponse = await repository.getFaq(id: event.id);
    apiResponse.when(completed: (data, int? statusCode) {
      FaqResponse response = data;
      FaqResult? result = response.result;
      emit(state.copyWith(faqStatus: FaqStatus.success,
          faqResult: result));
    }, error: (apiError) {
      emit(state.copyWith(faqStatus: FaqStatus.failure,
          errorMessage: apiError.message));
    });
  }

  _onCreateFaqEvent(_CreateFaqEvent event, Emitter<FaqState> emit) async {
    emit(state.copyWith(faqStatus: FaqStatus.loading));

    final apiResponse = await repository.createFaq(request: event.request);
    apiResponse.when(completed: (data, int? statusCode) {
      CrudFaqResponse response = data;
      emit(state.copyWith(faqStatus: FaqStatus.crudSuccess,
          crudResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(faqStatus: FaqStatus.crudFailure,
          errorMessage: apiError.message));
    });
  }

  _onDeleteFaq(_DeleteFaqEvent event, Emitter<FaqState> emit) async {
    final apiResponse=await repository.deleteFaq(event.id);
    apiResponse.when(completed: (data,int? statusCode){

      CrudFaqResponse response=data;
      emit(state.copyWith(faqStatus: FaqStatus.deleted,crudResponse: response));

    }, error: (apiError){
      emit(state.copyWith(faqStatus: FaqStatus.deletedFailure,errorMessage: apiError.message));
    });
  }

  _onUpdateFaqEvent(_UpdateFaqEvent event, Emitter<FaqState> emit) async {
    emit(state.copyWith(faqStatus: FaqStatus.loading));

    final apiResponse = await repository.updateFaq(request: event.request);
    apiResponse.when(completed: (data, int? statusCode) {
      CrudFaqResponse response = data;
      emit(state.copyWith(faqStatus: FaqStatus.crudSuccess,
          crudResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(faqStatus: FaqStatus.crudFailure,
          errorMessage: apiError.message));
    });
  }
}