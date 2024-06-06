import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/feature/versioning/data/model/check_client_version_response.dart';
import 'package:maze_app/feature/versioning/domain/repository/versioning_repository.dart';

part 'versioning_event.dart';
part 'versioning_state.dart';
part 'versioning_bloc.freezed.dart';

@injectable
class VersioningBloc extends Bloc<VersioningEvent, VersioningState> {
  final VersioningRepository versioningRepository;

  VersioningBloc(this.versioningRepository) : super(const VersioningState()) {
   on<_InitEvent>(_onInit);

  }

  FutureOr<void> _onInit(event, Emitter<VersioningState> emit) async{
    emit(state.copyWith(versioningStatus: VersioningStatus.loading));

    final apiResponse=await versioningRepository.getVersion();
    apiResponse.when(completed: (data,int? statusCode){
      CheckClientVersionResponse response=data;
      emit(state.copyWith(versioningStatus: VersioningStatus.success, versionResponse: response));
      if (kDebugMode) {
        print(response.updateExist.toString());
      }
    }, error: (apiError){
      emit(state.copyWith(versioningStatus: VersioningStatus.failure));
    });
  }
}
