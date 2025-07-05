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

abstract class ZanibalRepository {
  ///get market status
  Future<Either<AppException, bool>> getMarketStatus();

  ///get stock recommendations
  Future<Either<AppException, List<StockRecommendationModel>>>
      getStockRecommendations();

//get customer's investment accounts
  Future<Either<AppException, List<InvestmentAccountModel>>>
      getInvestmentAccounts({required String secAccountId});

  //get customer's portfolio position
  Future<Either<AppException, PortfolioPositionReportModel>>
      getPortfolioPositionReport({required String investmentAccountId});

  ///get customer's rolling average
  Future<Either<AppException, List<RollingAverageModel>>> getRollingAverage(
      {required String investmentAccountId});

  ///validate customer's trade order
  Future<Either<AppException, ValidateOrderData>> validateTradeOrder(
      {required ValidateOrderModel model});

  ///submit customer's trade order
  Future<Either<AppException, ValidateOrderData>> submitOrder(
      {required ValidateOrderModel model});

  Future<Either<AppException, List<FavouriteModel>>> getFavourites(
      {required String clientId});

  Future<Either<AppException, bool>> deleteFavourite(
      {required String clientId, required String symbol});

  Future<Either<AppException, List<Equities>>> getEquities(
      {required String order, required String page, required String size});

  Future<Either<AppException, List<OrderBookModel>>> getOrders({
    required String clientId,
    required String order,
    required String page,
    required String size,
  });

  Future<Either<AppException, List<PostionReportModel>>> getPositionReport(
      {required String investmentAccountId});

  Future<Either<AppException, FavouriteModel>> addFavourite(
      {required String asset});

  Future<Either<AppException, bool>> cancelTrade({required String recordId});
  Future<Either<AppException, TransactionModel>> getStatement({
    required int pageSize,
    required int page,
    required String clientID,
    required String startDate,
    required String endDate,
  });

  ///initiate payment
  Future<Either<AppException, InitiatePaymentResponseData>> initiatePayment(
      {required InitiatePaymentModel model});

  ///get top gainers
  Future<Either<AppException, List<PerformingAssetModel>>> getTopGainers();

  ///get top losers
  Future<Either<AppException, List<PerformingAssetModel>>> getTopLosers();
}
