import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/historical_data/asset_index_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class HistoricalDataRepository {
  ///get ASI index chart data
  Future<Either<AppException, List<AssetIndexDataModel>>> getAssetIndexData(
      {required String startDate, required String endDate});
}
