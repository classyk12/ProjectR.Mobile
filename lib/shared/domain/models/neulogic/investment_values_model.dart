// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FixedIncomeInvestmentValuesModel {
  final num portfolioValue;
  final num totalInvestmentValue;
  final num totalReturn;
  final num roi;
  FixedIncomeInvestmentValuesModel({
    required this.portfolioValue,
    required this.totalInvestmentValue,
    required this.totalReturn,
    required this.roi,
  });

  FixedIncomeInvestmentValuesModel copyWith({
    num? portfolioValue,
    num? totalInvestmentValue,
    num? totalReturn,
    num? roi,
  }) {
    return FixedIncomeInvestmentValuesModel(
      portfolioValue: portfolioValue ?? this.portfolioValue,
      totalInvestmentValue: totalInvestmentValue ?? this.totalInvestmentValue,
      totalReturn: totalReturn ?? this.totalReturn,
      roi: roi ?? this.roi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'portfolioValue': portfolioValue,
      'totalInvestmentValue': totalInvestmentValue,
      'totalReturn': totalReturn,
      'roi': roi,
    };
  }

  factory FixedIncomeInvestmentValuesModel.fromMap(Map<String, dynamic> map) {
    return FixedIncomeInvestmentValuesModel(
      portfolioValue: map['portfolioValue'] ?? 0,
      totalInvestmentValue: map['totalInvestmentValue'] ?? 0,
      totalReturn: map['totalReturn'] ?? 0,
      roi: map['roi'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FixedIncomeInvestmentValuesModel.fromJson(String source) =>
      FixedIncomeInvestmentValuesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FixedIncomeInvestmentValuesModel(portfolioValue: $portfolioValue, totalInvestmentValue: $totalInvestmentValue, totalReturn: $totalReturn, roi: $roi)';
  }

  @override
  bool operator ==(covariant FixedIncomeInvestmentValuesModel other) {
    if (identical(this, other)) return true;

    return other.portfolioValue == portfolioValue &&
        other.totalInvestmentValue == totalInvestmentValue &&
        other.totalReturn == totalReturn &&
        other.roi == roi;
  }

  @override
  int get hashCode {
    return portfolioValue.hashCode ^
        totalInvestmentValue.hashCode ^
        totalReturn.hashCode ^
        roi.hashCode;
  }
}
