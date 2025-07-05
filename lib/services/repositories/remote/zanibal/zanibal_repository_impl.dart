import 'package:projectr/services/api_services/zanibal/Izanibal_service.dart';
import 'package:projectr/services/repositories/remote/zanibal/zanibal_repository.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/favourties/favourites_model.dart';
import 'package:projectr/shared/domain/models/neulogic/initiate_payment_model.dart';
import 'package:projectr/shared/domain/models/neulogic/initiate_payment_response_model.dart';
import 'package:projectr/shared/domain/models/performing_assets/perfoming_asset_model.dart';
import 'package:projectr/shared/domain/models/transaction/transaction_model.dart';
import 'package:projectr/shared/domain/models/zanibal/equities_model.dart';
import 'package:projectr/shared/domain/models/zanibal/investment_account_model.dart';
import 'package:projectr/shared/domain/models/zanibal/order_book_model.dart';
import 'package:projectr/shared/domain/models/zanibal/portfolio_position_report_model.dart';
import 'package:projectr/shared/domain/models/zanibal/position_report_model.dart';
import 'package:projectr/shared/domain/models/zanibal/rolling_average_model.dart';
import 'package:projectr/shared/domain/models/zanibal/stock_recommendation_model.dart';
import 'package:projectr/shared/domain/models/zanibal/validate_order_model.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class ZanibalRepositoryImpl extends ZanibalRepository {
  final IZanibalService service;

  ZanibalRepositoryImpl(this.service);

  @override
  Future<Either<AppException, List<InvestmentAccountModel>>>
      getInvestmentAccounts({required String secAccountId}) async {
    if (INVESTMENT_ACCOUNTS.isEmpty) {
      return await service.getInvestmentAccounts(secAccountId: secAccountId);
    }
    return Right(INVESTMENT_ACCOUNTS);
  }

  @override
  Future<Either<AppException, bool>> getMarketStatus() async {
    return await service.getMarketStatus();
  }

  @override
  Future<Either<AppException, PortfolioPositionReportModel>>
      getPortfolioPositionReport({required String investmentAccountId}) async {
    return await service.getPortfolioPositionReport(
        investmentAccountId: investmentAccountId);
  }

  @override
  Future<Either<AppException, List<PostionReportModel>>> getPositionReport(
      {required String investmentAccountId}) async {
    return await service.getPositionReport(
        investmentAccountId: investmentAccountId);
  }

  @override
  Future<Either<AppException, List<StockRecommendationModel>>>
      getStockRecommendations() async {
    return await service.getStockRecommendations();
  }

  @override

  ///get customer's rolling average
  Future<Either<AppException, List<RollingAverageModel>>> getRollingAverage(
      {required String investmentAccountId}) async {
    return await service.getRollingAverage(
        investmentAccountId: investmentAccountId);
  }

  @override
  Future<Either<AppException, ValidateOrderData>> validateTradeOrder(
      {required ValidateOrderModel model}) async {
    return await service.validateTradeOrder(model: model);
  }

  @override
  Future<Either<AppException, ValidateOrderData>> submitOrder(
      {required ValidateOrderModel model}) async {
    return await service.submitOrder(model: model);
  }

  @override
  Future<Either<AppException, List<FavouriteModel>>> getFavourites(
      {required String clientId}) async {
    return await service.getFavourites(clientId: clientId);
  }

  @override
  Future<Either<AppException, FavouriteModel>> addFavourite(
      {required String asset}) async {
    return await service.addFavourite(asset: asset);
  }

  @override
  Future<Either<AppException, bool>> deleteFavourite(
      {required String clientId, required String symbol}) async {
    return await service.deleteFavourite(clientId: clientId, symbol: symbol);
  }

  @override
  Future<Either<AppException, List<Equities>>> getEquities({
    required String order,
    required String page,
    required String size,
  }) async {
    if (EQUITIES_LIST.isEmpty) {
      return await service.getEquities(order: order, page: page, size: size);
    }

    return Right(EQUITIES_LIST);
  }

//!orders
  @override
  Future<Either<AppException, List<OrderBookModel>>> getOrders({
    required String clientId,
    required String order,
    required String page,
    required String size,
  }) async {
    return await service.getOrders(
        clientId: clientId, order: order, page: page, size: size);
  }

  @override
  Future<Either<AppException, bool>> cancelTrade(
      {required String recordId}) async {
    return await service.cancelTrade(recordId: recordId);
  }

  @override
  Future<Either<AppException, TransactionModel>> getStatement({
    required int pageSize,
    required int page,
    required String clientID,
    required String startDate,
    required String endDate,
  }) async {
    return await service.getStatement(
        pageSize: pageSize,
        page: page,
        clientID: clientID,
        startDate: startDate,
        endDate: endDate);
  }

  @override
  Future<Either<AppException, InitiatePaymentResponseData>> initiatePayment(
      {required InitiatePaymentModel model}) async {
    return await service.initiatePayment(model: model);
  }

  @override
  Future<Either<AppException, List<PerformingAssetModel>>>
      getTopGainers() async {
    return await service.getTopGainers();
  }

  @override
  Future<Either<AppException, List<PerformingAssetModel>>>
      getTopLosers() async {
    return await service.getTopLosers();
  }
}
