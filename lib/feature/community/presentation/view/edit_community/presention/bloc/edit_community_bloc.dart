

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:maze_app/feature/community/core/util/community_data_request/comunity.dart';
import 'package:maze_app/feature/community/data/model/community_details_response/community_details_response.dart';
import 'package:maze_app/feature/community/data/model/create_community/create_community_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';
import 'package:path_provider/path_provider.dart';

part 'edit_community_event.dart';
part 'edit_community_state.dart';
part 'edit_community_bloc.freezed.dart';

@injectable
class EditCommunityBloc extends Bloc<EditCommunityEvent, EditCommunityState> {
  final CommunityRepository repository;

  EditCommunityBloc(this.repository) : super(const EditCommunityState()) {
    on<_Init>(_onInit);
    on<_EditCommunityEvent>(_onEditCommunityEvent);
  }

  _onInit(_Init event, Emitter<EditCommunityState> emit) async {}

  _onEditCommunityEvent(_EditCommunityEvent event,
      Emitter<EditCommunityState> emit) async {
    emit(state.copyWith(editStatus: EditCommunityStatus.loading));
    final Community community = await convertCommunityDetails(event.communityRequest, event.avatarFile, event.coverFile);
    final apiResponse = await repository.editCommunity(request: community);
    apiResponse.when(completed: (data, int? statusCode) {
      CreateCommunityResponse response = data;
      emit(state.copyWith(editStatus: EditCommunityStatus.success,
          editResponse: response));
    }, error: (apiError) {
      emit(state.copyWith(editStatus: EditCommunityStatus.failure,
          errorMessage: apiError.message));
    });
  }

 Future<Community> convertCommunityDetails (CommunityDetails communityDetail , File? avatarFile , File? coverFile)async{
    Community community = Community(
      name: communityDetail.name,
      description: communityDetail.description,
      id: communityDetail.id,
    );

    if(avatarFile != null){
      community.avatar = avatarFile;
    }else if (communityDetail.avatar != null){
      final apiResponse = await repository.getImageFile(imageUrl: communityDetail.avatar!);
      apiResponse.when(completed: (data, statusCode) async{
        community.avatar =await _writeBytesToFile(data);
      }, error: (apiError) {
        Logger().w(apiError);
      },);
    }
    if(coverFile != null){
      community.cover = coverFile;
    }else if (communityDetail.cover != null){
      final apiResponse = await repository.getImageFile(imageUrl: communityDetail.cover!);
      apiResponse.when(completed: (data, statusCode)async {
        community.cover = await _writeBytesToFile(data);
      }, error: (apiError) {},);
    }
    return community;
 }

 Future<File> _writeBytesToFile(dynamic data)async{
     var buffer = data; // This is now a List<int>
     var tempDir = await getTemporaryDirectory();
     final file = await File('${tempDir.path}/img').writeAsBytes(buffer);
     return file;
 }
}
