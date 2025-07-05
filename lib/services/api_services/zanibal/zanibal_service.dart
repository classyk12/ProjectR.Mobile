import 'package:projectr/services/api_services/zanibal/Izanibal_service.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/favourties/favourites_model.dart';
import 'package:projectr/shared/domain/models/neulogic/initiate_payment_model.dart';
import 'package:projectr/shared/domain/models/neulogic/initiate_payment_response_model.dart';
import 'package:projectr/shared/domain/models/performing_assets/perfoming_asset_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
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
import 'package:projectr/shared/helpers/extension.dart';
import 'package:projectr/shared/helpers/helper.dart';

class ZanibalService implements IZanibalService {
  final NetworkService networkService;

  ZanibalService(this.networkService);

  @override
  Future<Either<AppException, List<InvestmentAccountModel>>>
      getInvestmentAccounts({required String secAccountId}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/investment-accounts/$secAccountId',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting investment accounts.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          final data = List<InvestmentAccountModel>.from(
              res.map((x) => InvestmentAccountModel.fromMap(x)));
          INVESTMENT_ACCOUNTS = data;
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting investment accounts.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> getMarketStatus() async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/market-is-open',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting market status.',
            ),
          );
        },
        (response) {
          var res = response.data['isOpen'] as bool;
          return Right(res);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting market status.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, PortfolioPositionReportModel>>
      getPortfolioPositionReport({required String investmentAccountId}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/portfolio-position-report/$investmentAccountId/${DateTime.now().formatDateYYMMDD}',
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
          var data = PortfolioPositionReportModel.fromMap(res);
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
  Future<Either<AppException, List<StockRecommendationModel>>>
      getStockRecommendations() async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/stock-recommendation',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting stock recommendations.',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = List<StockRecommendationModel>.from(
              res.map((x) => StockRecommendationModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message:
              'Unknown error occurred while getting stock recommendations.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<RollingAverageModel>>> getRollingAverage(
      {required String investmentAccountId}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/rolling-average?accountId=$investmentAccountId&currentDate=${DateTime.now().formatDateYYMMDD}',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting rolling average data.',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = List<RollingAverageModel>.from(
              res.map((x) => RollingAverageModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting rolling average data.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, ValidateOrderData>> validateTradeOrder(
      {required ValidateOrderModel model}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      var json = model.toMap();
      final eitherType =
          await networkService.post('zanibal/validate-order', data: json);
      return eitherType.fold(
        (exception) {
          var result = exception.error;
          return Left(
            AppException(
              error: result,
              message: result ??
                  'Unknown error occurred while validating trade order.',
            ),
          );
        },
        (response) {
          var res = response.data;
          var data = ValidateOrderData.fromMap(res['data']);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while validating trade order.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, ValidateOrderData>> submitOrder(
      {required ValidateOrderModel model}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      var json = model.toMap();
      final eitherType =
          await networkService.post('zanibal/orders', data: json);
      return eitherType.fold(
        (exception) {
          var result = exception.error;
          return Left(
            AppException(
              error: result,
              message: result ??
                  'Unknown error occurred while submitting trade order.',
            ),
          );
        },
        (response) {
          var res = response.data;
          var data = ValidateOrderData.fromMap(res);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while submitting trade order.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<FavouriteModel>>> getFavourites(
      {required String clientId}) async {
    try {
      final eitherType = await networkService.get(
        'zanibal/favorite-stocks/$clientId',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting favourites.',
            ),
          );
        },
        (response) {
          final favourites = List<FavouriteModel>.from(
              response.data['data'].map((x) => FavouriteModel.fromMap(x)));
          return Right(favourites);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting favourites.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> deleteFavourite(
      {required String clientId, required String symbol}) async {
    try {
      final eitherType = await networkService.delete(
        'zanibal/favorite-stocks/$clientId/$symbol',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while deleting $symbol.',
            ),
          );
        },
        (response) {
          // var res = response.data;

          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while deleting $symbol.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<Equities>>> getEquities({
    required String order,
    required String page,
    required String size,
  }) async {
    try {
      var pageNum = int.parse(page);
      var sizeNum = int.parse(size);
      final eitherType = await networkService.get(
        'zanibal/equities?order=$order&page=$pageNum&size=$sizeNum',
      );

      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting equities.',
            ),
          );
        },
        (response) {
          final equities = List<Equities>.from(
              response.data['data']['content'].map((x) => Equities.fromMap(x)));
          EQUITIES_LIST = equities;
          return Right(equities);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting equities.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<OrderBookModel>>> getOrders({
    required String clientId,
    required String order,
    required String page,
    required String size,
  }) async {
    try {
      var pageNum = int.parse(page);
      var sizeNum = int.parse(size);
      final eitherType = await networkService.get(
        'zanibal/orders/client/$clientId?order=$order&page=$pageNum&size=$sizeNum',
      );

      return eitherType.fold(
        (exception) {
          var result = exception.error;
          return Left(
            AppException(
              error: result,
              message:
                  result ?? 'Unknown error occurred while getting equities.',
            ),
          );
        },
        (response) {
          final orders = List<OrderBookModel>.from(response.data['data']
                  ['content']
              .map((x) => OrderBookModel.fromMap(x)));
          return Right(orders);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting equities.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<PostionReportModel>>> getPositionReport(
      {required String investmentAccountId}) async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/position-report/$investmentAccountId?days=5',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting positions.',
            ),
          );
        },
        (response) {
          final reports = List<PostionReportModel>.from(
              response.data['data'].map((x) => PostionReportModel.fromJson(x)));
          return Right(reports);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting positions.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, FavouriteModel>> addFavourite(
      {required String asset}) async {
    try {
      final eitherType = await networkService
          .post('zanibal/create/favorite-stocks', data: {'symbol': asset});
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while adding $asset.',
            ),
          );
        },
        (response) {
          var res = response.data['data'];
          var data = FavouriteModel.fromMap(res);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while adding $asset.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> cancelTrade(
      {required String recordId}) async {
    try {
      final eitherType = await networkService.post(
        'zanibal/cancel-orders/$recordId',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while cancelling trade.',
            ),
          );
        },
        (response) {
          return const Right(true);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while cancelling trade.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, TransactionModel>> getStatement(
      {required int pageSize,
      required int page,
      required String clientID,
      required String startDate,
      required String endDate}) async {
    try {
      final eitherType = await networkService.get(
        'zanibal/accountStatement/$clientID?startDate=$startDate&endDate=$endDate&page=$page&size=$pageSize',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting transactions.',
            ),
          );
        },
        (response) {
          final res = TransactionModel.fromMap(response.data['data']);
          return Right(res);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting transactions.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, InitiatePaymentResponseData>> initiatePayment(
      {required InitiatePaymentModel model}) async {
    try {
      final eitherType = await networkService.post('zanibal/initiate-payment',
          data: model.toMap());
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.message,
              message: exception.error ??
                  'Unknown error occurred while initiating payment',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = InitiatePaymentResponseData.fromMap(res['data']);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while initiating payment',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<PerformingAssetModel>>>
      getTopGainers() async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/statistics/equities/gainers',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting top performing assets.',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = List<PerformingAssetModel>.from(
              res['data'].map((x) => PerformingAssetModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message:
              'Unknown error occurred while getting top performing assets.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<PerformingAssetModel>>>
      getTopLosers() async {
    try {
      networkService.updateHeader(AppHelper.setTokenHeader());
      final eitherType = await networkService.get(
        'zanibal/statistics/equities/losers',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting top performing assets.',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = List<PerformingAssetModel>.from(
              res['data'].map((x) => PerformingAssetModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message:
              'Unknown error occurred while getting top performing assets.',
          error: 'Error!',
        ),
      );
    }
  }
}
