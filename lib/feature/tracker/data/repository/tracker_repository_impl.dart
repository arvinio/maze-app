import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source.dart';
import 'package:maze_app/feature/tracker/data/model/bin_entry_list/bin_entry_list_response.dart';
import 'package:maze_app/feature/tracker/data/model/bin_response/bin_response.dart';
import 'package:maze_app/feature/tracker/data/model/enum/create_bin_types.dart';
import 'package:maze_app/feature/tracker/data/model/success_response.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';

@Injectable(as: TrackerRepository)
class TrackerRepositoryImpl implements TrackerRepository {
  final TrackerRemoteDataSource _remoteDataSource;

  TrackerRepositoryImpl(
      {required TrackerRemoteDataSource trackerRemoteDataSource})
      : _remoteDataSource = trackerRemoteDataSource;

  //bin

  @override
  Future<ApiResponse<List<Bin>>> getBinsList() async {
    final resp = await _remoteDataSource.getBinsList();
    return resp.when(
      completed: (data, statusCode) {
        var bins = <Bin>[];
        for (var e in data!.result!) {
          var type = BinType.values.firstWhere(
                (element) {
              return element.name == e.type;
            },
          );
          var sizeT = SizeType.values.firstWhere(
                (element) {
              return element.name == e.sizeType;
            },
          );

          List<ChartData> charts = e.chartData!.map(
                (e) {
              return ChartData(name: e.name.toString(), value: e.value!);
            },
          ).toList();
          bins.add(
            Bin(
                type: type,
                id: e.id,
                nickName: e.nickname!,
                sizeType: sizeT,
                amountOfLiters: e.amountOfLitres,
                isShare: e.isShare!,
                imageUrl: e.photo,
                pickUpDate: e.pickupDate,
                typeOfCompostBin: e.typeOfCompostBin,
                is2Compostement: e.is2Compostement,
                width: e.width.toString(),
                length: e.length.toString(),
                height: e.height.toString(),
                totalAmount: e.totalAmount,
                lastEntry: e.lastEntry,
                isCouncil: e.isCouncil,
                chartData: charts),
          );
        }
        return ApiResponse.completed(data: bins);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse> createBin(
      {required Bin bin, required BinTypesEnum binType}) async {
    return await _remoteDataSource.createBin(bin, binType);
  }

  @override
  Future<ApiResponse> editBin({required Bin bin}) async {
    final resp = await _remoteDataSource.editBin(bin);
    return resp;
  }

  @override
  Future<ApiResponse<BinResponse>> getBinDetails(
      {required String binId}) async {
    return await _remoteDataSource.getBinDetails(binId);
  }

  @override
  Future<ApiResponse<BinChartData>> getBinChartData(
      {required String binId}) async {
    final result = await _remoteDataSource.getBinChartData(binId);
    return result.when(
      completed: (data, statusCode) {
        var chartData = BinChartData(
          chartWeek: data.chartDataResult!.chartWeek!.map(
                (e) {
              return ChartData(name: e.name!, value: e.value!);
            },
          ).toList(),
          chartMonth: data.chartDataResult!.chartMonth!.map(
                (e) {
              return ChartData(name: e.name!, value: e.value!);
            },
          ).toList(),
          chartYear: data.chartDataResult!.chartYear!.map(
                (e) {
              return ChartData(name: e.name!, value: e.value!);
            },
          ).toList(),
        );
        return ApiResponse.completed(data: chartData);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }


  @override
  Future<ApiResponse> deleteBin({required String binId}) async {
    return await _remoteDataSource.deleteBin(binId);
  }

  @override
  Future<ApiResponse> getDeletedBins() async {
    return await _remoteDataSource.getDeletedBins();
  }

  @override
  Future<ApiResponse> deleteBinPermanently({required String binId}) async {
    return await _remoteDataSource.deleteBinPermanently(binId);
  }

  @override
  Future<ApiResponse> restoreDeletedBin({required String binId}) async {
    return await _remoteDataSource.restoreDeletedBin(binId);
  }

  @override
  Future<ApiResponse<SuccessResponse>> transferBinData(String sourceBinId,
      String targetBinId) async {
    return await _remoteDataSource.transferBinData(sourceBinId, targetBinId);
  }

  @override
  Future<ApiResponse> getListOfCompostBinTypes() async {
    return await _remoteDataSource.getListOfCompostBinTypes();
  }

  @override
  Future<ApiResponse> muteNotification({required String binId}) async {
    return await _remoteDataSource.muteNotification(binId: binId);
  }

  @override
  Future<ApiResponse> unMuteNotification({required String binId}) async {
    return await _remoteDataSource.unMuteNotification(binId: binId);
  }

  //bin_entry

  @override
  Future<ApiResponse<BinEntryListResponse>> getBinEntryList(
      {required String binId, required String sort}) async {
    return await _remoteDataSource.getBinEntryList(binId: binId, sort: sort);
  }


  @override
  Future<ApiResponse<SuccessResponse>> createBinEntry({required Entry entry}) async {
    return await _remoteDataSource.createBinEntry(entry);
  }

  @override
  Future<ApiResponse> editBinEntry({required EditEntry entry}) async {
    final resp = await _remoteDataSource.editBinEntry(entry);
    return resp;
  }

  @override
  Future<ApiResponse> deleteBinEntry({required String entryId}) async {
    return await _remoteDataSource.deleteBinEntry(entryId);
  }
}