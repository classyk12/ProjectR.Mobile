import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/foreign_exchange/exchange_rate_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class ForgeinExchangeRepository {
  ///get foreign exchanges
  Future<Either<AppException, ExchangeRateModel>> getExchangeRates();
}
