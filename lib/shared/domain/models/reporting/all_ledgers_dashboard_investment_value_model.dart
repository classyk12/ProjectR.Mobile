class AllLedgersDashboardInvestmentValueModel {
  InvestmentValue ngn;
  InvestmentValue usd;
  InvestmentValue gbp;
  InvestmentValue eur;

  AllLedgersDashboardInvestmentValueModel({
    required this.ngn,
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory AllLedgersDashboardInvestmentValueModel.fromJson(
          Map<String, dynamic> json) =>
      AllLedgersDashboardInvestmentValueModel(
        ngn: InvestmentValue.fromJson(json["NGN"]),
        usd: InvestmentValue.fromJson(json["USD"]),
        gbp: InvestmentValue.fromJson(json["GBP"]),
        eur: InvestmentValue.fromJson(json["EUR"]),
      );

  Map<String, dynamic> toJson() => {
        "NGN": ngn.toJson(),
        "USD": usd.toJson(),
        "GBP": gbp.toJson(),
        "EUR": eur.toJson(),
      };
}

class InvestmentValue {
  num totalCashBalance;
  num totalInvestmentValue;

  InvestmentValue({
    required this.totalCashBalance,
    required this.totalInvestmentValue,
  });

  factory InvestmentValue.fromJson(Map<String, dynamic> json) =>
      InvestmentValue(
        totalCashBalance: json["totalCashBalance"] ?? 0,
        totalInvestmentValue: json["totalInvestmentValue"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "totalCashBalance": totalCashBalance,
        "totalInvestmentValue": totalInvestmentValue,
      };
}
