import 'package:projectr/services/api_services/neulogic/ineulogicService.dart';
import 'package:projectr/services/repositories/remote/neulogic/neulogic_repository.dart';
import 'package:projectr/shared/constants.dart';
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
import 'package:projectr/shared/exceptions/app_exception.dart';

class NeulogicRepositoryImpl extends NeulogicRepository {
  final INeulogicService service;

  NeulogicRepositoryImpl(this.service);

  @override
  Future<Either<AppException, FixedIncomeInvestmentValuesModel>>
      getFixedIncomeInvestmentValues({required String currency}) async {
    return await service.getFixedIncomeInvestmentValues(currency: currency);
  }

  @override

  ///get fixed income client product
  Future<Either<AppException, List<ClientProductModel>>> getClientProduct(
      {required String currency, required String camID}) async {
    return await service.getClientProduct(currency: currency, camID: camID);
  }

  @override
  Future<Either<AppException, CashAccountTransactionResponseModel>>
      getCashAccountTransactions(
          {required String accountId,
          required String startDate,
          required String endDate}) async {
    return await service.getCashAccountTransactions(
        accountId: accountId, startDate: startDate, endDate: endDate);
  }

  @override
  Future<Either<AppException, List<FixedIncomeCashAccountModel>>>
      getCashAccounts({bool forceUpdate = true}) async {
    if (forceUpdate == true || CASH_ACCOUNTS.isEmpty) {
      return await service.getCashAccounts();
    }
    return Right(CASH_ACCOUNTS);
  }

  @override
  Future<Either<AppException, SmaInvestmentValueModel>> getSMAInvestmentValues(
      {required String currency}) async {
    return await service.getSMAInvestmentValues(currency: currency);
  }

  @override
  Future<Either<AppException, String>> getBusinessDate() async {
    return await service.getBusinessDate();
  }

  @override
  Future<Either<AppException, MutualFundPricesHistoryResponseModel>>
      getMutualFundHistoricalYieldPrices(
          {required String fundID,
          required String startDate,
          required String endDate}) async {
    return await service.getMutualFundHistoricalYieldPrices(
        fundID: fundID, startDate: startDate, endDate: endDate);
  }

  @override
  Future<Either<AppException, MutualFundInvestmentValueModel>>
      getMutualFundInvestmentValues({required String currency}) async {
    return await service.getMutualFundInvestmentValues(currency: currency);
  }

  @override
  Future<Either<AppException, List<MutualFundProductModel>>> getMutualFundList(
      {String? currency}) async {
    return await service.getMutualFundList(currency: currency ?? '');
  }

  @override
  Future<Either<AppException, MutualFundPriceHistoryResponseModel>>
      getMutualFundPrice({required String fundID}) async {
    return await service.getMutualFundPrice(fundID: fundID);
  }

  @override
  Future<Either<AppException, MutualFundPriceYieldModel>> getMutualFundYields(
      {required String fundID}) async {
    return await service.getMutualFundYields(fundID: fundID);
  }

  @override
  Future<Either<AppException, List<MutualFundPriceYieldModel>>>
      getAllMutualFundYields() async {
    return await service.getAllMutualFundYields();
  }

  @override
  Future<Either<AppException, MutualFundTransactionResponseModel>>
      getMutualFundTransactions(
          {required String fundID,
          required String startDate,
          required String endDate}) async {
    return await service.getMutualFundTransactions(
        fundID: fundID, startDate: startDate, endDate: endDate);
  }

  @override
  Future<Either<AppException, bool>> redeemFunds(
      {required RedeemFundModel model}) async {
    return await service.redeem(model: model);
  }

  @override
  Future<Either<AppException, InitiatePaymentResponseData>> subscribe(
      {required FundSubscriptionModel model}) async {
    return await service.subscribe(model: model);
  }

  @override
  Future<Either<AppException, List<MutualFundAccountModel>>>
      getAllSubscribedFunds(
          {required String camID,
          required String currency,
          bool forceUpdate = false}) async {
    if (forceUpdate == true || MY_MUTUAL_FUNDS_LIST.isEmpty) {
      return await service.getAllSubscribedFunds(
          camID: camID, currency: currency);
    }
    return Right(MY_MUTUAL_FUNDS_LIST);
  }

  @override
  Future<Either<AppException, bool>> initiateDollarSubscription(
      {required DollarFundSubscriptionModel model}) async {
    return await service.initiateDollarSubscription(model: model);
  }

  @override
  Future<Either<AppException, List<RelationShipModel>>>
      getRelationships() async {
    if (RELATIONSHIP_LIST.isNotEmpty) {
      return Right(RELATIONSHIP_LIST);
    }
    return await service.getRelationships();
  }

  @override
  Future<Either<AppException, List<TreasuryBillsProductsModel>>>
      getTreasuryBillsProducts({required String currency}) async {
    return await service.getTreasuryBillsProducts(currency: currency);
  }

  @override
  Future<Either<AppException, List<BondsProductsModel>>> getBondsProducts(
      {required String currency}) async {
    return await service.getBondsProducts(currency: currency);
  }

  @override
  Future<Either<AppException, FeaturedProductModel>>
      getFeaturedProduct() async {
    return await service.getFeaturedProduct();
  }

  @override
  Future<Either<AppException, InitiatePaymentResponseData>> initiatePayment(
      {required InitiatePaymentModel model}) async {
    return await service.initiatePayment(model: model);
  }

  @override
  Future<Either<AppException, List<SMAIndividualFundValuationModel>>>
      getSMAIndividualValuation({required String currency}) async {
    return await service.getSMAIndividualValuation(currency: currency);
  }
}
