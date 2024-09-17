part of 'faq_bloc.dart';
enum FaqStatus {
  init,
  loading,
  loadFaqs,
  success,
  failure,
  deleted,
  deletedFailure,
  crudSuccess,
  crudFailure;

  bool get isInit => this == FaqStatus.init;
  bool get isLoading => this == FaqStatus.loading;
  bool get isLoadFaqs => this == FaqStatus.loadFaqs;
  bool get isSuccess => this == FaqStatus.success;
  bool get isFailure => this == FaqStatus.failure;
  bool get isDeleted => this == FaqStatus.deleted;
  bool get isDeletedFailure => this == FaqStatus.deletedFailure;
  bool get isCrudSuccess => this == FaqStatus.crudSuccess;
  bool get isCrudFailure => this == FaqStatus.crudFailure;
}

@freezed
class FaqState with _$FaqState {
  const factory FaqState({
    @Default(FaqStatus.init) FaqStatus faqStatus,
    @Default([]) List<FaqResult>? fetchedFaqs,
    FaqResult? faqResult,
    CrudFaqResponse? crudResponse,
    String? errorMessage
  })=_FaqState;
}
