// ignore_for_file: public_member_api_docs, sort_constructors_first

class MutualFundInvestmentValueModel {
  final num portfolioValue;
  final num investmentValue;
  MutualFundInvestmentValueModel({
    required this.portfolioValue,
    required this.investmentValue,
  });

  MutualFundInvestmentValueModel copyWith({
    num? portfolioValue,
    num? investmentValue,
  }) {
    return MutualFundInvestmentValueModel(
      portfolioValue: portfolioValue ?? this.portfolioValue,
      investmentValue: investmentValue ?? this.investmentValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'portfolioValue': portfolioValue,
      'investmentValue': investmentValue,
    };
  }

  factory MutualFundInvestmentValueModel.fromMap(Map<String, dynamic> map) {
    return MutualFundInvestmentValueModel(
      portfolioValue: map['portfolioValue'] ?? 0,
      investmentValue: map['investmentValue'] ?? 0,
    );
  }

  @override
  bool operator ==(covariant MutualFundInvestmentValueModel other) {
    if (identical(this, other)) return true;

    return other.portfolioValue == portfolioValue &&
        other.investmentValue == investmentValue;
  }

  @override
  int get hashCode => portfolioValue.hashCode ^ investmentValue.hashCode;
}
