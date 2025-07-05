import 'package:projectr/services/api_services/reporting/reporting_service.dart';
import 'package:projectr/services/repositories/remote/reporting/reporting_repository.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/reporting/all_ledgers_dashboard_investment_value_model.dart';
import 'package:projectr/shared/domain/models/reporting/business_investment_summary_model.dart';
import 'package:projectr/shared/domain/models/reporting/investment_values_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class ReportingRepositoryImpl extends ReportingRepository {
  final IReportingService service;

  ReportingRepositoryImpl(this.service);

  @override
  Future<Either<AppException, BusinessesInvestmentSummaryModel>>
      getBusinessesInvesmentSummaryByCurrency(
          {required String currency}) async {
    return await service.getBusinessesInvesmentSummaryByCurrency(
        currency: currency);
  }

  @override
  Future<Either<AppException, InvestmentValuesData>> getInvestmentValues(
      {required String currency}) async {
    return await service.getInvestmentValues(currency: currency);
  }

  @override
  Future<Either<AppException, AllLedgersDashboardInvestmentValueModel>>
      getAllCurrenciesInvestmentBreakdown() async {
    return await service.getAllCurrenciesInvestmentBreakdown();
  }
}
