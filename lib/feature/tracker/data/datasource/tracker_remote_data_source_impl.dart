import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/dio_caller.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/di/di_const.dart';
import 'package:maze_app/feature/knowledge/data/model/resp_empty_model.dart';
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source.dart';
import 'package:maze_app/feature/tracker/data/model/bin_entry_list/bin_entry_list_response.dart';
import 'package:maze_app/feature/tracker/data/model/bin_list/bin_list_response.dart';
import 'package:maze_app/feature/tracker/data/model/bin_response/bin_response.dart';
import 'package:maze_app/feature/tracker/data/model/compost_bin_types/compost_bin_types_response.dart';
import 'package:maze_app/feature/tracker/data/model/deleted_bins/deleted_bins_response.dart';
import 'package:maze_app/feature/tracker/data/model/get_bin_chart_data_resp.dart';
import 'package:maze_app/feature/tracker/data/model/success_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

@Injectable(as: TrackerRemoteDataSource)
class TrackerRemoteDataSourceImpl implements TrackerRemoteDataSource {
  final DioCaller dioCaller;

  TrackerRemoteDataSourceImpl({
    @Named(DiConst.dioNamedToken) required this.dioCaller,
  });

  @override
  Future<ApiResponse<SuccessResponse>> createBin(Bin bin) async {
    final data = FormData.fromMap({
      'type': bin.type.name,
      'nickname': bin.nickName,
      'sizeType': bin.sizeType.name,
      'amountOfLitres': bin.amountOfLiters ?? 0,
      'isShare': bin.isShare,
      'pickupDate': 'every seconds, monthly',
      'typeOfCompostBinId':bin.typeOfCompostBin!=null? bin.typeOfCompostBin!.id:null,
      'is2Compostement': bin.is2Compostement ?? 'false',
      'width': bin.width ?? '23',
      'height': bin.height ?? '3',
      'length': bin.length ?? '33'
    });

    if (bin.imageUrl != null) {
      data.files.add(MapEntry("photo",await MultipartFile.fromFile(bin.imageUrl!, filename: bin.imageUrl)));
    }
    return await dioCaller.post<SuccessResponse>('api/bin', fromJson: SuccessResponse.fromJson, data: data);
  }

  @override
  Future<ApiResponse<BinListResponse>> getBinsList() async {
    return await dioCaller.get('api/bin', fromJson: BinListResponse.fromJson);
  }

  @override
  Future<ApiResponse> createBinEntry(Entry entry) async {
    var data = FormData.fromMap({
      'binId': entry.binId,
      'entryDate': DateTime.now(),
      'type': entry.type.toString(),

      if (entry.type == EntryType.emptiedBin ||
          entry.type == EntryType.emptiedCompost) ...{
        'howFull': entry.howFull,
        'amount': entry.amount,
      },
      // 'emptiedInto': '6683ca81b779145b4ba30503',
      'note': entry.note,
      if (entry.type == EntryType.emptiedBin) 'whatRecycle': 'glass, plastic',
      if (entry.type == EntryType.addedWaste) 'whatDidAdd': 'fruit',
      if (entry.type == EntryType.emptiedCompost)
        'compostUsed': 'for garden, for yard',
      // if (entry.type == EntryType.addedWaste)
      'isMixed': entry.mixed
    });

    for (int i = 0; i < entry.photo!.length; i++) {
      data.files.addAll([
        MapEntry("photos", await MultipartFile.fromFile(entry.photo![i],
            filename: entry.photo![i]))

      ]);
    }

    return await dioCaller.post(
      'api/bin/entry',
      fromJson: RespEmptyModel.fromJson,
      data: data,
    );
  }

  @override
  Future<ApiResponse> deleteBin(String binId) async {
    return await dioCaller.delete('api/bin/$binId',
        fromJson: SuccessResponse.fromJson);
  }

  @override
  Future<ApiResponse> deleteBinPermanently(String binId) async{
    return await dioCaller.delete('api/bin/permanent/$binId',
        fromJson: SuccessResponse.fromJson);
  }

  @override
  Future<ApiResponse> restoreDeletedBin(String binId) async{
    return await dioCaller.put('api/bin/$binId',
        fromJson: SuccessResponse.fromJson);
  }

  @override
  Future<ApiResponse> getDeletedBins() async{
    return await dioCaller.get('api/bin/deleted',
        fromJson: DeletedBinsResponse.fromJson);
  }


  @override
  Future<ApiResponse> deleteBinEntry(String entryId) async {
    return await dioCaller.delete('api/bin/entry/$entryId',
        fromJson: RespEmptyModel.fromJson);
  }

  @override
  Future<ApiResponse> deletebinEntryPhoto(
      String binEntryId, String photo) async {
    var data = FormData.fromMap({
      "binEntryId": binEntryId,
      "photo": photo,
    });
    return await dioCaller.delete(
      'api/bin/entry/photo',
      fromJson: RespEmptyModel.fromJson,
      data: data,
    );
  }

  @override
  Future<ApiResponse> editBinEntry(EditEntry entry) async {
    var data = FormData.fromMap({
      if (entry.photo != null)
        'files': [
          await MultipartFile.fromFile(entry.photo!.first,
              filename: entry.photo!.first)
        ],
      'binEntryId': entry.entryId,
      'binId': entry.binId,
      'entryDate': entry.entryDate,
      'type': entry.type.toString(),

      if (entry.type == EntryType.emptiedBin ||
          entry.type == EntryType.emptiedCompost) ...{
        'howFull': entry.howFull,
        'amount': entry.amount,
      },
      // 'emptiedInto': '6683ca81b779145b4ba30503',
      'note': entry.note,
      if (entry.type == EntryType.emptiedBin) 'whatRecycle': 'glass, plastic',
      if (entry.type == EntryType.addedWaste) 'whatDidAdd': 'fruit',
      if (entry.type == EntryType.emptiedCompost)
        'compostUsed': 'for garden, for yard',
      if (entry.type == EntryType.addedWaste) 'isMixed': 'true'
    });

    return await dioCaller.post(
      'api/bin/entry',
      fromJson: RespEmptyModel.fromJson,
      data: data,
    );
  }

  @override
  Future<ApiResponse> editBin(Bin bin) {
    // TODO: implement editbin
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<BinEntryListResponse>> getBinEntryList(
      String binId) async {
    return await dioCaller.get('api/bin/entry?binId=$binId&sort=desc&page=1',
        fromJson: BinEntryListResponse.fromJson);
  }

  @override
  Future<ApiResponse<BinResponse>> getBinDetails(String binId) async {
    return await dioCaller.get('api/bin/$binId', fromJson: BinResponse.fromJson);
  }

  @override
  Future<ApiResponse<GetBinChartDataResp>> getBinChartData(String binId) async {
    return await dioCaller.get('api/bin/chart?binId=$binId',
        fromJson: GetBinChartDataResp.fromJson);
  }

  @override
  Future<ApiResponse<SuccessResponse>> transferBinData(String sourceBinId, String targetBinId) async {
    return await dioCaller.put<SuccessResponse>('api/bin/transfer',
        fromJson: SuccessResponse.fromJson,
        data: {
          'sourceBinId': sourceBinId,
          'targetBinId': targetBinId
        }
    );
  }

  @override
  Future<ApiResponse> getListOfCompostBinTypes() async{
    return await dioCaller.get('api/typeofcompostbin', fromJson: CompostBinTypesResponse.fromJson);
  }
}
