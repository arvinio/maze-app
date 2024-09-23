part of 'create_post_bloc.dart';

@freezed
class CreatePostEvent with _$CreatePostEvent {
  const factory CreatePostEvent.init() = _Init;
  const factory CreatePostEvent.newPostEvent( {required PostDataRequest postRequest}) = _NewPostEvent;
  const factory CreatePostEvent.setSelectedCommunityEvent(CommunityDetails selectedCommunity) = _SetSelectedCommunityEvent;
}