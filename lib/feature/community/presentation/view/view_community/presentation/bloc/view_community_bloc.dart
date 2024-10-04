
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/config/strings.dart';
import 'package:maze_app/feature/community/data/model/other_communities/other_communities_response.dart';
import 'package:maze_app/feature/community/domain/repository/community_repository.dart';

part 'view_community_event.dart';
part 'view_community_state.dart';
part 'view_community_bloc.freezed.dart';

@injectable
class ViewCommunityBloc extends Bloc<ViewCommunityEvent , ViewCommunityState> {
  final CommunityRepository repository;

  ViewCommunityBloc(this.repository) : super (const ViewCommunityState()){
    on<_Init>(_onInit);
    on<_joinCommunity>(_onJoinCommunity);
    on<_leaveCommunity>(_onLeaveCommunity);
    on<_deleteCommunity>(_onDeleteCommunity);

  }

   _onInit(_Init event, Emitter<ViewCommunityState> emit){
     emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.init));
   }
   _onJoinCommunity(_joinCommunity event ,  Emitter<ViewCommunityState> emit)async{
     emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunityLoading));

     final apiResponse = await repository.joinCommunity(
     id:  event.id);
     apiResponse.when(completed: (data, int? statusCode) {
       OtherCommunitiesResponse  response = data;
       if(response.success == true){
         emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunitySuccess,));
       }else{
         emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunityFailure,));
       }

     }, error: (apiError) {
       Fluttertoast.showToast(
           msg: apiError.message,
           toastLength: Toast.LENGTH_LONG,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0);
       emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunityFailure,
           errorMessage: apiError.message));
     });
   }

  _onLeaveCommunity(_leaveCommunity event ,  Emitter<ViewCommunityState> emit)async{
    emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunityLoading));

    final apiResponse = await repository.leaveCommunity(
        id:  event.id);
    apiResponse.when(completed: (data, int? statusCode) {
      OtherCommunitiesResponse  response = data;
      if(response.success == true){
        emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunitySuccess,));
      }else{
        emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunityFailure,));
      }

    }, error: (apiError) {
      Fluttertoast.showToast(
          msg: apiError.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.joinCommunityFailure,
          errorMessage: apiError.message));
    });
  }

  _onDeleteCommunity(_deleteCommunity event ,  Emitter<ViewCommunityState> emit)async{
    emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.deleteCommunityLoading));

    final apiResponse = await repository.deleteCommunity(
        id:  event.id);
    apiResponse.when(completed: (data, int? statusCode) {
      OtherCommunitiesResponse  response = data;
      if(response.success == true){
        emit(state.copyWith(viewCommunityStatus: ViewCommunityStatus.deleteCommunitySuccess,));
        Fluttertoast.showToast(
            msg: appStrings.communityDeleted,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }

    }, error: (apiError) {
      Fluttertoast.showToast(
          msg: apiError.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }


}