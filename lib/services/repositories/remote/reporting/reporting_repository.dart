import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/reporting/all_ledgers_dashboard_investment_value_model.dart';
import 'package:projectr/shared/domain/models/reporting/business_investment_summary_model.dart';
import 'package:projectr/shared/domain/models/reporting/investment_values_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

abstract class ReportingRepository {
  ///get user kyc status
  Future<Either<AppException, InvestmentValuesData>> getInvestmentValues(
      {required String currency});

//get all businesses and their total investment value by currency
  Future<Either<AppException, BusinessesInvestmentSummaryModel>>
      getBusinessesInvesmentSummaryByCurrency({required String currency});

  //get all total investment values for all currencies in a summation
  Future<Either<AppException, AllLedgersDashboardInvestmentValueModel>>
      getAllCurrenciesInvestmentBreakdown();
}
