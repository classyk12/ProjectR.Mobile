import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/foreign_exchange/exchange_rate_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class IForeignExchangeService {
  Future<Either<AppException, ExchangeRateModel>> getExchangeRates();
}

class ForeignExchangeService implements IForeignExchangeService {
  final NetworkService networkService;

  ForeignExchangeService(this.networkService);

  @override
  Future<Either<AppException, ExchangeRateModel>> getExchangeRates() async {
    try {
      final eitherType = await networkService.get(
        'foreign-exchange',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting exchange rates.',
            ),
          );
        },
        (response) {
          final data = ExchangeRateModel.fromMap(response.data);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting exchange rates.',
          error: 'Error!',
        ),
      );
    }
  }
}
