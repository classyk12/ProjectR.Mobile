import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/reporting/all_ledgers_dashboard_investment_value_model.dart';
import 'package:projectr/shared/domain/models/reporting/business_investment_summary_model.dart';
import 'package:projectr/shared/domain/models/reporting/investment_values_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/helper.dart';

abstract class IReportingService {
  ///get user kyc status
  Future<Either<AppException, InvestmentValuesData>> getInvestmentValues(
      {required String currency});

//get all businesses and their total investment value by currency
  Future<Either<AppException, BusinessesInvestmentSummaryModel>>
      getBusinessesInvesmentSummaryByCurrency({required String currency});

  Future<Either<AppException, AllLedgersDashboardInvestmentValueModel>>
      getAllCurrenciesInvestmentBreakdown();
}

class ReportingService implements IReportingService {
  final NetworkService networkService;

  ReportingService(this.networkService);

  @override
  Future<Either<AppException, BusinessesInvestmentSummaryModel>>
      getBusinessesInvesmentSummaryByCurrency(
          {required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'reporting/investment-value-chart-data/$currency',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting investment summary.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          final data = BusinessesInvestmentSummaryModel.fromMap(res);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting investment summary.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, InvestmentValuesData>> getInvestmentValues(
      {required String currency}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'reporting/all-dashboard-stats',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting investment values.',
            ),
          );
        },
        (response) {
          final data = InvestmentValuesData.fromMap(response.data['data']);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting investment values.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, AllLedgersDashboardInvestmentValueModel>>
      getAllCurrenciesInvestmentBreakdown() async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'reporting/all-currencies-investment-breakdown',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting investment values.',
            ),
          );
        },
        (response) {
          final data = AllLedgersDashboardInvestmentValueModel.fromJson(
              response.data['data']);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting investment values.',
          error: 'Error!',
        ),
      );
    }
  }
}
