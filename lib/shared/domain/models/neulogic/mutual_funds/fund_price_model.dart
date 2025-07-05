import 'package:projectr/shared/domain/models/neulogic/mutual_funds/fund_prices_model.dart';

class MutualFundPriceHistoryResponseModel {
  String status;
  List<Result> result;

  MutualFundPriceHistoryResponseModel({
    required this.status,
    required this.result,
  });

  factory MutualFundPriceHistoryResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MutualFundPriceHistoryResponseModel(
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
            json["GetFundPrice"].map((x) => MutualFundPriceModel.fromJson(x))),
      );
}
