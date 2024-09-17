part of 'faq_bloc.dart';

@freezed
class FaqEvent with _$FaqEvent {
  const factory FaqEvent.init() = _Init;
  const factory FaqEvent.fetchFaqListEvent() = _FetchFaqListEvent;
  const factory FaqEvent.getFaqEvent({required String id}) = _GetFaqEvent;
  const factory FaqEvent.createFaqEvent({required CreateFaqRequest request}) = _CreateFaqEvent;
  const factory FaqEvent.deleteFaqEvent({required String id}) = _DeleteFaqEvent;
  const factory FaqEvent.updateFaqEvent({required UpdateFaqRequest request}) = _UpdateFaqEvent;
}
