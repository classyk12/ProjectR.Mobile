import 'package:projectr/services/api_services/foreign_exchange/foreign_exchange_service.dart';
import 'package:projectr/services/repositories/remote/foreign_exchanges/foreign_exchange_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/foreign_exchange/exchange_rate_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class ForgeinExchangeRepositoryImpl extends ForgeinExchangeRepository {
  final IForeignExchangeService service;

  ForgeinExchangeRepositoryImpl(this.service);

  @override
  Future<Either<AppException, ExchangeRateModel>> getExchangeRates() async {
    return await service.getExchangeRates();
  }
}
