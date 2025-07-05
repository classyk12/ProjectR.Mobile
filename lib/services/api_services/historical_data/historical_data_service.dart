import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/historical_data/asset_index_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/helper.dart';

abstract class IHistoricalDataService {
  Future<Either<AppException, List<AssetIndexDataModel>>> getAssetIndexData(
      {required String startDate,
      required String endDate,
      String symbol = 'ASI'});
}

class HistoricalDataService implements IHistoricalDataService {
  final NetworkService networkService;

  HistoricalDataService(this.networkService);

  @override
  Future<Either<AppException, List<AssetIndexDataModel>>> getAssetIndexData(
      {required String startDate,
      required String endDate,
      String symbol = 'ASI'}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'historical-data/$symbol/$startDate/$endDate',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting historical data.',
            ),
          );
        },
        (response) {
          final data = List<AssetIndexDataModel>.from(
              response.data['data'].map((x) => AssetIndexDataModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting historical data.',
          error: 'Error!',
        ),
      );
    }
  }
}
