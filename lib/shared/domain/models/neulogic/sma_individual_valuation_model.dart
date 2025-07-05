class SMAIndividualFundValuationModel {
  String fundDescription;
  String fundId;
  String assetClassDescription;
  String assetSubclassDescription;
  num orderNo;
  num costAmount;
  dynamic costPrice;
  String currencyCode;
  String currencyDescription;
  num currentAmount;
  num accruedIncome;
  String customerId;
  num closePrice;
  String customerName;
  String effectiveDate;
  num interestRate;
  String maturityDate;
  num rptKey;
  String securityDescription;
  String valuationDate;
  num averageYieldRate;
  num holdingsValue;
  String marketSymbolId;
  num gainLossAmount;
  num gainLossPercent;
  num portfolioPercent;
  num marketValue;

  SMAIndividualFundValuationModel({
    required this.fundDescription,
    required this.fundId,
    required this.assetClassDescription,
    required this.assetSubclassDescription,
    required this.orderNo,
    required this.costAmount,
    required this.costPrice,
    required this.currencyCode,
    required this.currencyDescription,
    required this.currentAmount,
    required this.accruedIncome,
    required this.customerId,
    required this.closePrice,
    required this.customerName,
    required this.effectiveDate,
    required this.interestRate,
    required this.maturityDate,
    required this.rptKey,
    required this.securityDescription,
    required this.valuationDate,
    required this.averageYieldRate,
    required this.holdingsValue,
    required this.marketSymbolId,
    required this.gainLossAmount,
    required this.gainLossPercent,
    required this.portfolioPercent,
    required this.marketValue,
  });

  factory SMAIndividualFundValuationModel.fromJson(Map<String, dynamic> json) =>
      SMAIndividualFundValuationModel(
        fundDescription: json["FUND_DESCRIPTION"] ?? '',
        fundId: json["FUND_ID"] ?? '',
        assetClassDescription: json["ASSET_CLASS_DESCRIPTION"] ?? '',
        assetSubclassDescription: json["ASSET_SUBCLASS_DESCRIPTION"] ?? '',
        orderNo: json["ORDER_NO"] ?? 0,
        costAmount: json["COST_AMOUNT"] ?? 0,
        costPrice: json["COST_PRICE"] ?? 0,
        currencyCode: json["CURRENCY_CODE"],
        currencyDescription: json["CURRENCY_DESCRIPTION"] ?? '',
        currentAmount: json["CURRENT_AMOUNT"] ?? 0,
        accruedIncome: json["ACCRUED_INCOME"] ?? 0,
        customerId: json["CUSTOMER_ID"] ?? '',
        closePrice: json["CLOSE_PRICE"] ?? 0,
        customerName: json["CUSTOMER_NAME"] ?? '',
        effectiveDate: json["EFFECTIVE_DATE"] ?? '',
        interestRate: json["INTEREST_RATE"] ?? 0,
        maturityDate: json["MATURITY_DATE"] ?? '',
        rptKey: json["RPT_KEY"] ?? 0,
        securityDescription: json["SECURITY_DESCRIPTION"] ?? '',
        valuationDate: json["VALUATION_DATE"] ?? '',
        averageYieldRate: json["AVERAGE_YIELD_RATE"] ?? 0,
        holdingsValue: json["HOLDINGS_VALUE"] ?? 0,
        marketSymbolId: json["MARKET_SYMBOL_ID"] ?? '',
        gainLossAmount: json["GAIN_LOSS_AMOUNT"] ?? 0,
        gainLossPercent: json["GAIN_LOSS_PERCENT"] ?? 0,
        portfolioPercent: json["PORTFOLIO_PERCENT"] ?? 0,
        marketValue: json["MARKET_VALUE"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "FUND_DESCRIPTION": fundDescription,
        "FUND_ID": fundId,
        "ASSET_CLASS_DESCRIPTION": assetClassDescription,
        "ASSET_SUBCLASS_DESCRIPTION": assetSubclassDescription,
        "ORDER_NO": orderNo,
        "COST_AMOUNT": costAmount,
        "COST_PRICE": costPrice,
        "CURRENCY_CODE": currencyCode,
        "CURRENCY_DESCRIPTION": currencyDescription,
        "CURRENT_AMOUNT": currentAmount,
        "ACCRUED_INCOME": accruedIncome,
        "CUSTOMER_ID": customerId,
        "CLOSE_PRICE": closePrice,
        "CUSTOMER_NAME": customerName,
        "EFFECTIVE_DATE": effectiveDate,
        "INTEREST_RATE": interestRate,
        "MATURITY_DATE": maturityDate,
        "RPT_KEY": rptKey,
        "SECURITY_DESCRIPTION": securityDescription,
        "VALUATION_DATE": valuationDate,
        "AVERAGE_YIELD_RATE": averageYieldRate,
        "HOLDINGS_VALUE": holdingsValue,
        "MARKET_SYMBOL_ID": marketSymbolId,
        "GAIN_LOSS_AMOUNT": gainLossAmount,
        "GAIN_LOSS_PERCENT": gainLossPercent,
        "PORTFOLIO_PERCENT": portfolioPercent,
        "MARKET_VALUE": marketValue,
      };
}
