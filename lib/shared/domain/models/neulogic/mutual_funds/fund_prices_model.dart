class MutualFundPricesHistoryResponseModel {
  String status;
  List<Result> result;

  MutualFundPricesHistoryResponseModel({
    required this.status,
    required this.result,
  });

  factory MutualFundPricesHistoryResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MutualFundPricesHistoryResponseModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  List<MutualFundPriceModel> getFundTransactions;

  Result({
    required this.getFundTransactions,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        getFundTransactions: List<MutualFundPriceModel>.from(
            json["GetFundPrices"].map((x) => MutualFundPriceModel.fromJson(x))),
      );
}

class MutualFundPriceModel {
  String fundId;
  String fundDescription;
  String valueDate;
  num bidPrice;
  num offerPrice;

  MutualFundPriceModel({
    required this.fundId,
    required this.fundDescription,
    required this.valueDate,
    required this.bidPrice,
    required this.offerPrice,
  });

  factory MutualFundPriceModel.fromJson(Map<String, dynamic> json) =>
      MutualFundPriceModel(
        fundId: json["FUND_ID"],
        fundDescription: json["FUND_DESCRIPTION"],
        valueDate: json["VALUE_DATE"],
        bidPrice: json["BID_PRICE"],
        offerPrice: json["OFFER_PRICE"],
      );

  Map<String, dynamic> toJson() => {
        "FUND_ID": fundId,
        "FUND_DESCRIPTION": fundDescription,
        "VALUE_DATE": valueDate,
        "BID_PRICE": bidPrice,
        "OFFER_PRICE": offerPrice,
      };
}
