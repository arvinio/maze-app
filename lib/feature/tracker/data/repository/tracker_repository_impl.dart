import 'package:injectable/injectable.dart';
import 'package:maze_app/core/network/model/api_response.dart';
import 'package:maze_app/feature/tracker/data/datasource/tracker_remote_data_source.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin_chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/domain/repo/tracker_repository.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';

@Injectable(as: TrackerRepository)
class TrackerRepositoryImpl implements TrackerRepository {
  final TrackerRemoteDataSource _trackerRemoteDataSource;

  TrackerRepositoryImpl({required TrackerRemoteDataSource trackerRemoteDataSource})
      : _trackerRemoteDataSource = trackerRemoteDataSource;
  @override
  Future<ApiResponse<List<Bin>>> getBinsList() async {
    final resp = await _trackerRemoteDataSource.getBinsList();
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
              return ChartData(name: e.name, value: e.value);
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
  Future<ApiResponse> createBin({required Bin bin}) async {
    final resp = await _trackerRemoteDataSource.createBin(bin);
    return resp;
  }

  @override
  Future<ApiResponse> createBinEntry({required Entry entry}) async {
    final resp = await _trackerRemoteDataSource.createBinEntry(entry);
    return resp;
  }

  @override
  Future<ApiResponse> deleteBin({required String binId}) async {
    final resp = await _trackerRemoteDataSource.deleteBin(binId);
    return resp;
  }

  @override
  Future<ApiResponse> deleteBinEntry({required String entryId}) async {
    final resp = await _trackerRemoteDataSource.deleteBinEntry(entryId);
    return resp;
  }

  @override
  Future<ApiResponse> editBin({required Bin bin}) async {
    final resp = await _trackerRemoteDataSource.editbin(bin);
    return resp;
  }

  @override
  Future<ApiResponse> editBinEntry({required EditEntry entry}) async {
    final resp = await _trackerRemoteDataSource.editBinEntry(entry);
    return resp;
  }

  @override
  Future<ApiResponse<List<EditEntry>>> getBinEntryList(
      {required String binId}) async {
    final resp = await _trackerRemoteDataSource.getBinEntryList(binId);
    return resp.when(
      completed: (data, statusCode) {
        final List<EditEntry> entries = [];
        for (var element in data.result) {
          entries.add(EditEntry(
            element.id,
            whatRecycled: element.whatRecycle,
            whatDidAdd: element.whatDidAdd,
            compostUsed: element.compostUsed,
            entryDate: element.entryDate,
            binId: binId,
            type: EntryType.fromString(element.type),
            mixed: element.isMixed,
            note: element.note ?? "",
            photo: element.photos ?? [],
            howFull: element.howFull,
            amount: element.amount.toString(),
          ));
        }
        return ApiResponse.completed(data: entries);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<Bin>> getBinDetails({required String binId}) async {
    final resp = await _trackerRemoteDataSource.getBinDetails(binId);
    return resp.when(
      completed: (data, statusCode) {
        var e = data.result;

        var type = BinType.values.firstWhere(
          (element) {
            return element.name == e!.type;
          },
        );
        var sizeT = SizeType.values.firstWhere(
          (element) {
            return element.name == e!.sizeType;
          },
        );

        var bin = Bin(
          type: type,
          id: e!.id,
          nickName: e!.nickname!,
          sizeType: sizeT,
          amountOfLiters: e!.amountOfLitres,
          isShare: e!.isShare!,
          imageUrl: e.photo,
          pickUpDate: e.pickupDate,
          typeOfCompostBin: e.typeOfCompostBin,
          is2Compostement: e.is2Compostement,
          width: e.width.toString(),
          length: e.length.toString(),
          height: e.height.toString(),
          totalAmount: e.totalAmount,
        );

        return ApiResponse.completed(data: bin);
      },
      error: (apiError) {
        return ApiResponse.error(apiError: apiError);
      },
    );
  }

  @override
  Future<ApiResponse<BinChartData>> getBinChartData(
      {required String binId}) async {
    final result = await _trackerRemoteDataSource.getBinChartData(binId);
    return result.when(
      completed: (data, statusCode) {
        var chartData = BinChartData(
          chartWeek: data.result.chartWeek.map(
            (e) {
              return ChartData(name: e.name, value: e.value);
            },
          ).toList(),
          chartMonth: data.result.chartMonth.map(
            (e) {
              return ChartData(name: e.name, value: e.value);
            },
          ).toList(),
          chartYear: data.result.chartYear.map(
            (e) {
              return ChartData(name: e.name, value: e.value);
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
  Future<ApiResponse<List<EditEntry>>> sortBinEntries({
    required String binId,
    required EntrySortOption sortOption,
  }) async {
    throw UnimplementedError();
    // try {
    //   // Implement the API call to sort entries
    //   // For now, we'll simulate an API call with a delay
    //   await Future.delayed(Duration(seconds: 1));

    //   // Simulated sorted entries
    //   List<EditEntry> sortedEntries = []; // Replace with actual sorted entries

    //   return ApiResponse.completed(sortedEntries);
    // } catch (e) {
    //   return ApiResponse.error(ApiError(message: e.toString()));
    // }
  }
}
