// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SmaInvestmentValueModel {
  final num portfolioValue;
  final num investmentValue;
  final num returnValue;
  final num roi;
  SmaInvestmentValueModel({
    required this.portfolioValue,
    required this.investmentValue,
    required this.returnValue,
    required this.roi,
  });

  SmaInvestmentValueModel copyWith({
    num? portfolioValue,
    num? investmentValue,
    num? returnValue,
    num? roi,
  }) {
    return SmaInvestmentValueModel(
      portfolioValue: portfolioValue ?? this.portfolioValue,
      investmentValue: investmentValue ?? this.investmentValue,
      returnValue: returnValue ?? this.returnValue,
      roi: roi ?? this.roi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'portfolioValue': portfolioValue,
      'investmentValue': investmentValue,
      'returnValue': returnValue,
      'roi': roi,
    };
  }

  factory SmaInvestmentValueModel.fromMap(Map<String, dynamic> map) {
    return SmaInvestmentValueModel(
      portfolioValue: map['portfolioValue'] ?? 0,
      investmentValue: map['investmentValue'] ?? 0,
      returnValue: map['returnValue'] ?? 0,
      roi: map['roi'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SmaInvestmentValueModel.fromJson(String source) =>
      SmaInvestmentValueModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant SmaInvestmentValueModel other) {
    if (identical(this, other)) return true;

    return other.portfolioValue == portfolioValue &&
        other.investmentValue == investmentValue &&
        other.returnValue == returnValue &&
        other.roi == roi;
  }

  @override
  int get hashCode {
    return portfolioValue.hashCode ^
        investmentValue.hashCode ^
        returnValue.hashCode ^
        roi.hashCode;
  }
}
