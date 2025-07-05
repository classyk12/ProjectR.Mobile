// ignore_for_file: public_member_api_docs, sort_constructors_first

class MutualFundProductModel {
  String fundId;
  String fundDescription;
  String fundCurrency;
  String fundType;
  String dateOpened;
  num minimumInvestmentAmount;
  num subsequentMultiples;
  num offerPrice;
  num bidPrice;
  num isMoneyMarket;
  String investmentBasis;

  MutualFundProductModel({
    required this.fundId,
    required this.fundDescription,
    required this.fundCurrency,
    required this.fundType,
    required this.dateOpened,
    required this.minimumInvestmentAmount,
    required this.subsequentMultiples,
    required this.offerPrice,
    required this.bidPrice,
    required this.isMoneyMarket,
    required this.investmentBasis,
  });

  factory MutualFundProductModel.fromMap(Map<String, dynamic> json) =>
      MutualFundProductModel(
        fundId: json["FUND_ID"],
        fundDescription: json["FUND_DESCRIPTION"],
        fundCurrency: json["FUND_CURRENCY"],
        fundType: json["FUND_TYPE"],
        dateOpened: json["DATE_OPENED"],
        minimumInvestmentAmount: json["MINIMUM_INVESTMENT_AMOUNT"] ?? 0,
        subsequentMultiples: json["SUBSEQUENT_MULTIPLES"] ?? 0,
        offerPrice: json["OFFER_PRICE"] ?? 0,
        bidPrice: json["BID_PRICE"] ?? 0,
        isMoneyMarket: json["IS_MONEY_MARKET"] ?? 0,
        investmentBasis: json["INVESTMENT_BASIS"],
      );

  factory MutualFundProductModel.initial() => MutualFundProductModel(
        fundId: '',
        fundDescription: '',
        fundCurrency: '',
        fundType: '',
        dateOpened: '',
        minimumInvestmentAmount: 0,
        subsequentMultiples: 0,
        offerPrice: 0,
        bidPrice: 0,
        isMoneyMarket: 0,
        investmentBasis: '',
      );

  Map<String, dynamic> toMap() => {
        "FUND_ID": fundId,
        "FUND_DESCRIPTION": fundDescription,
        "FUND_CURRENCY": fundCurrency,
        "FUND_TYPE": fundType,
        "DATE_OPENED": dateOpened,
        "MINIMUM_INVESTMENT_AMOUNT": minimumInvestmentAmount,
        "SUBSEQUENT_MULTIPLES": subsequentMultiples,
        "OFFER_PRICE": offerPrice,
        "BID_PRICE": bidPrice,
        "IS_MONEY_MARKET": isMoneyMarket,
        "INVESTMENT_BASIS": investmentBasis,
      };

  MutualFundProductModel copyWith({
    String? fundId,
    String? fundDescription,
    String? fundCurrency,
    String? fundType,
    String? dateOpened,
    int? minimumInvestmentAmount,
    int? subsequentMultiples,
    double? offerPrice,
    double? bidPrice,
    int? isMoneyMarket,
    String? investmentBasis,
  }) {
    return MutualFundProductModel(
      fundId: fundId ?? this.fundId,
      fundDescription: fundDescription ?? this.fundDescription,
      fundCurrency: fundCurrency ?? this.fundCurrency,
      fundType: fundType ?? this.fundType,
      dateOpened: dateOpened ?? this.dateOpened,
      minimumInvestmentAmount:
          minimumInvestmentAmount ?? this.minimumInvestmentAmount,
      subsequentMultiples: subsequentMultiples ?? this.subsequentMultiples,
      offerPrice: offerPrice ?? this.offerPrice,
      bidPrice: bidPrice ?? this.bidPrice,
      isMoneyMarket: isMoneyMarket ?? this.isMoneyMarket,
      investmentBasis: investmentBasis ?? this.investmentBasis,
    );
  }

  @override
  bool operator ==(covariant MutualFundProductModel other) {
    if (identical(this, other)) return true;

    return other.fundId == fundId &&
        other.fundDescription == fundDescription &&
        other.fundCurrency == fundCurrency &&
        other.fundType == fundType &&
        other.dateOpened == dateOpened &&
        other.minimumInvestmentAmount == minimumInvestmentAmount &&
        other.subsequentMultiples == subsequentMultiples &&
        other.offerPrice == offerPrice &&
        other.bidPrice == bidPrice &&
        other.isMoneyMarket == isMoneyMarket &&
        other.investmentBasis == investmentBasis;
  }

  @override
  int get hashCode {
    return fundId.hashCode ^
        fundDescription.hashCode ^
        fundCurrency.hashCode ^
        fundType.hashCode ^
        dateOpened.hashCode ^
        minimumInvestmentAmount.hashCode ^
        subsequentMultiples.hashCode ^
        offerPrice.hashCode ^
        bidPrice.hashCode ^
        isMoneyMarket.hashCode ^
        investmentBasis.hashCode;
  }
}
