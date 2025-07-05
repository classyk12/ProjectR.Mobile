import 'package:projectr/services/api_services/historical_data/historical_data_service.dart';
import 'package:projectr/services/repositories/remote/historical_data/historical_data_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/historical_data/asset_index_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class HistoricalDataRepositoryImpl extends HistoricalDataRepository {
  final IHistoricalDataService service;

  HistoricalDataRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<AssetIndexDataModel>>> getAssetIndexData(
      {required String startDate,
      required String endDate,
      String symbol = 'ASI'}) async {
    return await service.getAssetIndexData(
        startDate: startDate, endDate: endDate, symbol: symbol);
  }
}
