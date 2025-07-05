// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MutualFundAccountModel {
  String accountDescription;
  String accountId;
  String accountOpenedDate;
  String balanceDate;
  num balanceQuantity;
  String cashAccountDescription;
  String cashAccountId;
  num costPrice;
  num costValue;
  num currentBidPrice;
  num currentValue;
  String customerId;
  String customerName;
  String externalReference;
  String fundCurrency;
  String fundDescription;
  String fundId;
  num gainLossAmount;
  String isMoneyMarketFund;
  num outstandingAccruedInterest;
  num registrarAccountId;
  num totalAccruedInterest;
  num totalBonusQuantity;
  num totalDividendAmount;
  num totalPurchaseAmount;
  num totalPurchaseQuantity;
  num totalSaleAmount;
  num totalSaleQuantity;
  MutualFundAccountModel({
    required this.accountDescription,
    required this.accountId,
    required this.accountOpenedDate,
    required this.balanceDate,
    required this.balanceQuantity,
    required this.cashAccountDescription,
    required this.cashAccountId,
    required this.costPrice,
    required this.costValue,
    required this.currentBidPrice,
    required this.currentValue,
    required this.customerId,
    required this.customerName,
    required this.externalReference,
    required this.fundCurrency,
    required this.fundDescription,
    required this.fundId,
    required this.gainLossAmount,
    required this.isMoneyMarketFund,
    required this.outstandingAccruedInterest,
    required this.registrarAccountId,
    required this.totalAccruedInterest,
    required this.totalBonusQuantity,
    required this.totalDividendAmount,
    required this.totalPurchaseAmount,
    required this.totalPurchaseQuantity,
    required this.totalSaleAmount,
    required this.totalSaleQuantity,
  });

  MutualFundAccountModel copyWith({
    String? accountDescription,
    String? accountId,
    String? accountOpenedDate,
    String? balanceDate,
    num? balanceQuantity,
    String? cashAccountDescription,
    String? cashAccountId,
    num? costPrice,
    num? costValue,
    num? currentBidPrice,
    num? currentValue,
    String? customerId,
    String? customerName,
    String? externalReference,
    String? fundCurrency,
    String? fundDescription,
    String? fundId,
    num? gainLossAmount,
    String? isMoneyMarketFund,
    num? outstandingAccruedInterest,
    num? registrarAccountId,
    num? totalAccruedInterest,
    num? totalBonusQuantity,
    num? totalDividendAmount,
    num? totalPurchaseAmount,
    num? totalPurchaseQuantity,
    num? totalSaleAmount,
    num? totalSaleQuantity,
  }) {
    return MutualFundAccountModel(
      accountDescription: accountDescription ?? this.accountDescription,
      accountId: accountId ?? this.accountId,
      accountOpenedDate: accountOpenedDate ?? this.accountOpenedDate,
      balanceDate: balanceDate ?? this.balanceDate,
      balanceQuantity: balanceQuantity ?? this.balanceQuantity,
      cashAccountDescription:
          cashAccountDescription ?? this.cashAccountDescription,
      cashAccountId: cashAccountId ?? this.cashAccountId,
      costPrice: costPrice ?? this.costPrice,
      costValue: costValue ?? this.costValue,
      currentBidPrice: currentBidPrice ?? this.currentBidPrice,
      currentValue: currentValue ?? this.currentValue,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      externalReference: externalReference ?? this.externalReference,
      fundCurrency: fundCurrency ?? this.fundCurrency,
      fundDescription: fundDescription ?? this.fundDescription,
      fundId: fundId ?? this.fundId,
      gainLossAmount: gainLossAmount ?? this.gainLossAmount,
      isMoneyMarketFund: isMoneyMarketFund ?? this.isMoneyMarketFund,
      outstandingAccruedInterest:
          outstandingAccruedInterest ?? this.outstandingAccruedInterest,
      registrarAccountId: registrarAccountId ?? this.registrarAccountId,
      totalAccruedInterest: totalAccruedInterest ?? this.totalAccruedInterest,
      totalBonusQuantity: totalBonusQuantity ?? this.totalBonusQuantity,
      totalDividendAmount: totalDividendAmount ?? this.totalDividendAmount,
      totalPurchaseAmount: totalPurchaseAmount ?? this.totalPurchaseAmount,
      totalPurchaseQuantity:
          totalPurchaseQuantity ?? this.totalPurchaseQuantity,
      totalSaleAmount: totalSaleAmount ?? this.totalSaleAmount,
      totalSaleQuantity: totalSaleQuantity ?? this.totalSaleQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountDescription': accountDescription,
      'accountId': accountId,
      'accountOpenedDate': accountOpenedDate,
      'balanceDate': balanceDate,
      'balanceQuantity': balanceQuantity,
      'cashAccountDescription': cashAccountDescription,
      'cashAccountId': cashAccountId,
      'costPrice': costPrice,
      'costValue': costValue,
      'currentBidPrice': currentBidPrice,
      'currentValue': currentValue,
      'customerId': customerId,
      'customerName': customerName,
      'externalReference': externalReference,
      'fundCurrency': fundCurrency,
      'fundDescription': fundDescription,
      'fundId': fundId,
      'gainLossAmount': gainLossAmount,
      'isMoneyMarketFund': isMoneyMarketFund,
      'outstandingAccruedInterest': outstandingAccruedInterest,
      'registrarAccountId': registrarAccountId,
      'totalAccruedInterest': totalAccruedInterest,
      'totalBonusQuantity': totalBonusQuantity,
      'totalDividendAmount': totalDividendAmount,
      'totalPurchaseAmount': totalPurchaseAmount,
      'totalPurchaseQuantity': totalPurchaseQuantity,
      'totalSaleAmount': totalSaleAmount,
      'totalSaleQuantity': totalSaleQuantity,
    };
  }

  factory MutualFundAccountModel.fromMap(Map<String, dynamic> map) {
    return MutualFundAccountModel(
      accountDescription: map['ACCOUNT_DESCRIPTION'] ?? '',
      accountId: map['ACCOUNT_ID'] ?? '',
      accountOpenedDate: map['ACCOUNT_OPENED_DATE'] ?? '',
      balanceDate: map['BALANCE_DATE'] ?? '',
      balanceQuantity: map['BALANCE_QUANTITY'] ?? 0,
      cashAccountDescription: map['CASH_ACCOUNT_DESCRIPTION'] ?? '',
      cashAccountId: map['CASH_ACCOUNT_ID'] ?? '',
      costPrice: map['COST_PRICE'] ?? 0,
      costValue: map['COST_VALUE'] ?? 0,
      currentBidPrice: map['CURRENT_BID_PRICE'] ?? 0,
      currentValue: map['CURRENT_VALUE'] ?? 0,
      customerId: map['CUSTOMER_ID'] ?? '',
      customerName: map['CUSTOMER_NAME'] ?? '',
      externalReference: map['EXTERNAL_REFERENCE'] ?? '',
      fundCurrency: map['FUND_CURRENCY'] ?? '',
      fundDescription: map['FUND_DESCRIPTION'] ?? '',
      fundId: map['FUND_ID'] ?? '',
      gainLossAmount: map['GAIN_LOSS_AMOUNT'] ?? 0,
      isMoneyMarketFund: map['IS_MONEY_MARKET_FUND'] ?? '',
      outstandingAccruedInterest: map['OUTSTANDING_ACCRUED_INTEREST'] ?? 0,
      registrarAccountId: map['REGISTRAR_ACCOUNT_ID'] ?? 0,
      totalAccruedInterest: map['TOTAL_ACCRUED_INTEREST'] ?? 0,
      totalBonusQuantity: map['TOTAL_BONUS_QUANTITY'] ?? 0,
      totalDividendAmount: map['TOTAL_DIVIDEND_AMOUNT'] ?? 0,
      totalPurchaseAmount: map['TOTAL_PURCHASE_AMOUNT'] ?? 0,
      totalPurchaseQuantity: map['TOTAL_PURCHASE_QUANTITY'] ?? 0,
      totalSaleAmount: map['TOTAL_SALE_AMOUNT'] ?? 0,
      totalSaleQuantity: map['TOTAL_SALE_QUANTITY'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MutualFundAccountModel.fromJson(String source) =>
      MutualFundAccountModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MutualFundAccountModel(accountDescription: $accountDescription, accountId: $accountId, accountOpenedDate: $accountOpenedDate, balanceDate: $balanceDate, balanceQuantity: $balanceQuantity, cashAccountDescription: $cashAccountDescription, cashAccountId: $cashAccountId, costPrice: $costPrice, costValue: $costValue, currentBidPrice: $currentBidPrice, currentValue: $currentValue, customerId: $customerId, customerName: $customerName, externalReference: $externalReference, fundCurrency: $fundCurrency, fundDescription: $fundDescription, fundId: $fundId, gainLossAmount: $gainLossAmount, isMoneyMarketFund: $isMoneyMarketFund, outstandingAccruedInterest: $outstandingAccruedInterest, registrarAccountId: $registrarAccountId, totalAccruedInterest: $totalAccruedInterest, totalBonusQuantity: $totalBonusQuantity, totalDividendAmount: $totalDividendAmount, totalPurchaseAmount: $totalPurchaseAmount, totalPurchaseQuantity: $totalPurchaseQuantity, totalSaleAmount: $totalSaleAmount, totalSaleQuantity: $totalSaleQuantity)';
  }

  @override
  bool operator ==(covariant MutualFundAccountModel other) {
    if (identical(this, other)) return true;

    return other.accountDescription == accountDescription &&
        other.accountId == accountId &&
        other.accountOpenedDate == accountOpenedDate &&
        other.balanceDate == balanceDate &&
        other.balanceQuantity == balanceQuantity &&
        other.cashAccountDescription == cashAccountDescription &&
        other.cashAccountId == cashAccountId &&
        other.costPrice == costPrice &&
        other.costValue == costValue &&
        other.currentBidPrice == currentBidPrice &&
        other.currentValue == currentValue &&
        other.customerId == customerId &&
        other.customerName == customerName &&
        other.externalReference == externalReference &&
        other.fundCurrency == fundCurrency &&
        other.fundDescription == fundDescription &&
        other.fundId == fundId &&
        other.gainLossAmount == gainLossAmount &&
        other.isMoneyMarketFund == isMoneyMarketFund &&
        other.outstandingAccruedInterest == outstandingAccruedInterest &&
        other.registrarAccountId == registrarAccountId &&
        other.totalAccruedInterest == totalAccruedInterest &&
        other.totalBonusQuantity == totalBonusQuantity &&
        other.totalDividendAmount == totalDividendAmount &&
        other.totalPurchaseAmount == totalPurchaseAmount &&
        other.totalPurchaseQuantity == totalPurchaseQuantity &&
        other.totalSaleAmount == totalSaleAmount &&
        other.totalSaleQuantity == totalSaleQuantity;
  }

  @override
  int get hashCode {
    return accountDescription.hashCode ^
        accountId.hashCode ^
        accountOpenedDate.hashCode ^
        balanceDate.hashCode ^
        balanceQuantity.hashCode ^
        cashAccountDescription.hashCode ^
        cashAccountId.hashCode ^
        costPrice.hashCode ^
        costValue.hashCode ^
        currentBidPrice.hashCode ^
        currentValue.hashCode ^
        customerId.hashCode ^
        customerName.hashCode ^
        externalReference.hashCode ^
        fundCurrency.hashCode ^
        fundDescription.hashCode ^
        fundId.hashCode ^
        gainLossAmount.hashCode ^
        isMoneyMarketFund.hashCode ^
        outstandingAccruedInterest.hashCode ^
        registrarAccountId.hashCode ^
        totalAccruedInterest.hashCode ^
        totalBonusQuantity.hashCode ^
        totalDividendAmount.hashCode ^
        totalPurchaseAmount.hashCode ^
        totalPurchaseQuantity.hashCode ^
        totalSaleAmount.hashCode ^
        totalSaleQuantity.hashCode;
  }
}
