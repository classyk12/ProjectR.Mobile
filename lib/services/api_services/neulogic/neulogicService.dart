import 'package:projectr/services/api_services/neulogic/ineulogicService.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/remote/network_service.dart';
import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/domain/models/neulogic/bonds_products_model.dart';
import 'package:projectr/shared/domain/models/neulogic/cash_account_model.dart';
import 'package:projectr/shared/domain/models/neulogic/cash_account_transaction_model.dart';
import 'package:projectr/shared/domain/models/neulogic/client_product_model.dart';
import 'package:projectr/shared/domain/models/neulogic/featured_product_model.dart';
import 'package:projectr/shared/domain/models/neulogic/initiate_payment_model.dart';
import 'package:projectr/shared/domain/models/neulogic/initiate_payment_response_model.dart';
import 'package:projectr/shared/domain/models/neulogic/investment_values_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_price_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_prices_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_price_yield_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_redemption_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_subscription_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_transaction_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/investment_values_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/mutual_fund_account_model.dart';
import 'package:projectr/shared/domain/models/neulogic/mutual_funds/product_model.dart';
import 'package:projectr/shared/domain/models/neulogic/relationship_model.dart';
import 'package:projectr/shared/domain/models/neulogic/sma_individual_valuation_model.dart';
import 'package:projectr/shared/domain/models/neulogic/sma_invesment_value_model.dart';
import 'package:projectr/shared/domain/models/neulogic/tbills_products_model.dart';
import 'package:projectr/shared/domain/models/response.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';
import 'package:projectr/shared/helpers/extension.dart';
import 'package:projectr/shared/helpers/util.dart';
import 'package:dio/dio.dart';

class NeulogicService implements INeulogicService {
  final NetworkService networkService;

  NeulogicService(this.networkService);
  @override
  Future<Either<AppException, FixedIncomeInvestmentValuesModel>>
      getFixedIncomeInvestmentValues({required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/fixed-deposit/dashboard/$currency',
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
          var res = response.data;
          final data = FixedIncomeInvestmentValuesModel.fromMap(res);
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
  Future<Either<AppException, List<ClientProductModel>>> getClientProduct(
      {required String currency, required String camID}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/fixed-deposit/client-products/$camID/$currency',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting client products.',
            ),
          );
        },
        (response) {
          final data = List<ClientProductModel>.from(
              response.data.map((x) => ClientProductModel.fromMap(x)));
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting client products.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, CashAccountTransactionResponseModel>>
      getCashAccountTransactions(
          {required String accountId,
          required String startDate,
          required String endDate}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/getCashAccountTransactionByCurrentDate/$accountId/$startDate/$endDate',
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
          var res = response.data;
          var result = CashAccountTransactionResponseModel.fromJson(res);
          return Right(result);
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
  Future<Either<AppException, List<FixedIncomeCashAccountModel>>>
      getCashAccounts() async {
    try {
      final eitherType = await networkService.get(
        'neulogic/getCashAccounts',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting cash accounts.',
            ),
          );
        },
        (response) {
          var res = response.data;
          final data = List<FixedIncomeCashAccountModel>.from(
              res.map((x) => FixedIncomeCashAccountModel.fromMap(x)));
          CASH_ACCOUNTS = data;
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting cash accounts.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, SmaInvestmentValueModel>> getSMAInvestmentValues(
      {required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/SMA/dashboard/$currency',
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
          final data = SmaInvestmentValueModel.fromMap(response.data['data']);
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
  Future<Either<AppException, String>> getBusinessDate() async {
    try {
      final eitherType = await networkService.get(
        'neulogic/business-date',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting business date',
            ),
          );
        },
        (response) {
          final data = response.data['date'];
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting business date.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, MutualFundPricesHistoryResponseModel>>
      getMutualFundHistoricalYieldPrices(
          {required String fundID,
          required String startDate,
          required String endDate}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/getFundPrices/$fundID/$startDate/$endDate',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting historical yield prices',
            ),
          );
        },
        (response) {
          var res = response.data;
          var result = MutualFundPricesHistoryResponseModel.fromJson(res);
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message:
              'Unknown error occurred while getting historical yield prices',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, MutualFundInvestmentValueModel>>
      getMutualFundInvestmentValues({required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/mutual-funds/dashboard/$currency',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting investment values',
            ),
          );
        },
        (response) {
          final data = response.data;
          final result = MutualFundInvestmentValueModel.fromMap(data);
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting investment values',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<MutualFundProductModel>>> getMutualFundList(
      {required String currency}) async {
    try {
      var url = currency.isNotEmpty
          ? 'mutual-funds-list/$currency'
          : 'all-mutual-funds-list';
      final eitherType = await networkService.get('neulogic/$url');
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting mutual funds',
            ),
          );
        },
        (response) {
          final data = response.data['data'];
          final result = List<MutualFundProductModel>.from(
              data.map((x) => MutualFundProductModel.fromMap(x)));
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting mutual funds',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, MutualFundPriceHistoryResponseModel>>
      getMutualFundPrice({required String fundID}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/getFundPrice/$fundID',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting prices',
            ),
          );
        },
        (response) {
          final data = response.data;
          final result = MutualFundPriceHistoryResponseModel.fromJson(data);
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting prices',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, MutualFundPriceYieldModel>> getMutualFundYields(
      {required String fundID}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/fund-yields/$fundID',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting mutual fund yields',
            ),
          );
        },
        (response) {
          final data = response.data['data'];
          final result = MutualFundPriceYieldModel.fromMap(data);
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting mutual fund yields',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<MutualFundPriceYieldModel>>>
      getAllMutualFundYields() async {
    try {
      final eitherType = await networkService.get(
        'neulogic/fund-yields',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting mutual fund yields',
            ),
          );
        },
        (response) {
          final data = response.data['data'];
          final result = List<MutualFundPriceYieldModel>.from(
              data.map((x) => MutualFundPriceYieldModel.fromMap(x)));

          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting mutual fund yields',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, MutualFundTransactionResponseModel>>
      getMutualFundTransactions(
          {required String fundID,
          required String startDate,
          required String endDate}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/getFundTransactions/$fundID/$startDate/$endDate',
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
          var res = response.data;
          var result = MutualFundTransactionResponseModel.fromJson(res);
          return Right(result);
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
  Future<Either<AppException, bool>> redeem(
      {required RedeemFundModel model}) async {
    try {
      final eitherType = await networkService
          .post('neulogic/mutual-funds/fund-redemption', data: model.toMap());
      return eitherType.fold(
        (exception) {
          // var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: exception.error ?? '',
              message: exception.message ??
                  'Unknown error occurred while getting transactions.',
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
          message: 'Unknown error occurred while getting transactions.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, InitiatePaymentResponseData>> subscribe(
      {required FundSubscriptionModel model}) async {
    try {
      final eitherType = await networkService
          .post('neulogic/mutual-funds/fund-subscription', data: model.toMap());
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while processing subscription.',
            ),
          );
        },
        (response) {
          var data = InitiatePaymentResponseData.fromMap(response.data);
          return Right(data);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while processing subscription.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<MutualFundAccountModel>>>
      getAllSubscribedFunds(
          {required String camID, required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/getFundAccounts/$camID/$currency',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting subscribed funds',
            ),
          );
        },
        (response) {
          final data = response.data['data'];
          final result = List<MutualFundAccountModel>.from(
              data.map((x) => MutualFundAccountModel.fromMap(x)));
          MY_MUTUAL_FUNDS_LIST = result;
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting subscribed funds',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> initiateDollarSubscription(
      {required DollarFundSubscriptionModel model}) async {
    try {
      FormData formData = FormData.fromMap({
        "fund": model.fund,
        "quantity": model.quantity,
        "amount": model.amount,
        "price": model.price,
        "paymentReceipt": await MultipartFile.fromFile(
            model.paymentReceipt.path,
            contentType: model.paymentReceipt.path.getMediaType(),
            filename: model.fileName),
      });

      if (model.accountId!.isNotEmpty) {
        formData.fields.add(MapEntry('accountId', model.accountId!));
      }

      final eitherType = await networkService
          .postObject('neulogic/initiate-dollar-subscription', data: formData);
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.error ?? '',
              message: exception.error ??
                  ''
                      'Unknown error occurred while initiating dollar subscription',
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
          message:
              'Unknown error occurred while initiating dollar subscription',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<RelationShipModel>>>
      getRelationships() async {
    try {
      final eitherType = await networkService.get(
        'neulogic/relationships',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting records.',
            ),
          );
        },
        (response) {
          var res = response.data;
          var result = RelationShipsResponseModel.fromJson(res);
          return Right(result.result.isEmpty ? [] : result.result.first.items);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting records.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, FeaturedProductModel>>
      getFeaturedProduct() async {
    try {
      final eitherType = await networkService.get(
        'neulogic/pop-up-notification',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting featured products.',
            ),
          );
        },
        (response) {
          var res = response.data;
          var result = FeaturedProductModel.fromJson(res);
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while  getting featured products.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, InitiatePaymentResponseData>> initiatePayment(
      {required InitiatePaymentModel model}) async {
    try {
      final eitherType = await networkService.post('neulogic/initiate-payment',
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
  Future<Either<AppException, List<SMAIndividualFundValuationModel>>>
      getSMAIndividualValuation({required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/individual-fund-valuation/$currency',
      );
      return eitherType.fold(
        (exception) {
          return Left(
            AppException(
              error: exception.message,
              message: exception.error ??
                  'Unknown error occurred while getting valuation',
            ),
          );
        },
        (response) {
          final data = response.data['data'];
          final result = List<SMAIndividualFundValuationModel>.from(
              data.map((x) => SMAIndividualFundValuationModel.fromJson(x)));
          return Right(result);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred while getting valuation',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<TreasuryBillsProductsModel>>>
      getTreasuryBillsProducts({required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/fixed-deposit/tbill-products/$currency',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting records.',
            ),
          );
        },
        (response) {
          var res = response.data;
          var result = TreasuryBillsResponse.fromMap(res);
          return Right(result.data ?? []);
        },
      );
    } catch (e) {
      customDebugPrint(message: e);
      return Left(
        AppException(
          message: 'Unknown error occurred while getting records.',
          error: 'Error!',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, List<BondsProductsModel>>> getBondsProducts(
      {required String currency}) async {
    try {
      final eitherType = await networkService.get(
        'neulogic/fixed-deposit/bonds-products/$currency',
      );
      return eitherType.fold(
        (exception) {
          var result = BaseResponse.fromMap(exception.error);
          return Left(
            AppException(
              error: result.message,
              message: result.message ??
                  'Unknown error occurred while getting records.',
            ),
          );
        },
        (response) {
          var res = response.data;
          var result = BondsProductResponse.fromMap(res);
          return Right(result.data ?? []);
        },
      );
    } catch (e) {
      customDebugPrint(message: e);
      return Left(
        AppException(
          message: 'Unknown error occurred while getting records.',
          error: 'Error!',
        ),
      );
    }
  }
}
