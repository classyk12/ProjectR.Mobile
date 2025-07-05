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

abstract class INeulogicService {
  Future<Either<AppException, FixedIncomeInvestmentValuesModel>>
      getFixedIncomeInvestmentValues({required String currency});

  Future<Either<AppException, List<ClientProductModel>>> getClientProduct(
      {required String currency, required String camID});

  Future<Either<AppException, SmaInvestmentValueModel>> getSMAInvestmentValues(
      {required String currency});

  Future<Either<AppException, List<FixedIncomeCashAccountModel>>>
      getCashAccounts();

  Future<Either<AppException, CashAccountTransactionResponseModel>>
      getCashAccountTransactions(
          {required String accountId,
          required String startDate,
          required String endDate});

  Future<Either<AppException, String>> getBusinessDate();

  Future<Either<AppException, List<MutualFundProductModel>>> getMutualFundList(
      {required String currency});

  Future<Either<AppException, MutualFundInvestmentValueModel>>
      getMutualFundInvestmentValues({required String currency});

  Future<Either<AppException, MutualFundPriceHistoryResponseModel>>
      getMutualFundPrice({required String fundID});

  Future<Either<AppException, MutualFundPriceYieldModel>> getMutualFundYields(
      {required String fundID});

  Future<Either<AppException, List<MutualFundPriceYieldModel>>>
      getAllMutualFundYields();

  Future<Either<AppException, MutualFundPricesHistoryResponseModel>>
      getMutualFundHistoricalYieldPrices(
          {required String fundID,
          required String startDate,
          required String endDate});

  Future<Either<AppException, bool>> redeem({required RedeemFundModel model});

  Future<Either<AppException, MutualFundTransactionResponseModel>>
      getMutualFundTransactions(
          {required String fundID,
          required String startDate,
          required String endDate});

  Future<Either<AppException, InitiatePaymentResponseData>> subscribe(
      {required FundSubscriptionModel model});

  Future<Either<AppException, List<MutualFundAccountModel>>>
      getAllSubscribedFunds({required String camID, required String currency});

  Future<Either<AppException, bool>> initiateDollarSubscription(
      {required DollarFundSubscriptionModel model});

  Future<Either<AppException, List<RelationShipModel>>> getRelationships();

  Future<Either<AppException, List<TreasuryBillsProductsModel>>>
      getTreasuryBillsProducts({required String currency});

  Future<Either<AppException, List<BondsProductsModel>>> getBondsProducts(
      {required String currency});
  Future<Either<AppException, FeaturedProductModel>> getFeaturedProduct();

  Future<Either<AppException, InitiatePaymentResponseData>> initiatePayment(
      {required InitiatePaymentModel model});
  Future<Either<AppException, List<SMAIndividualFundValuationModel>>>
      getSMAIndividualValuation({required String currency});
}
