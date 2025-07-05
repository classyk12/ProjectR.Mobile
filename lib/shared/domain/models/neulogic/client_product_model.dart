// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientProductModel {
  final String investmentType;
  final String effectiveDate;
  final String maturityDate;
  final num amountAtMaturity;
  final num rate;
  final num principal;
  final num accruedInterest;
  final num marketValue;
  final String nextCouponDate;
  final String instrumentName;
  ClientProductModel({
    required this.investmentType,
    required this.effectiveDate,
    required this.maturityDate,
    required this.amountAtMaturity,
    required this.rate,
    required this.principal,
    required this.accruedInterest,
    required this.marketValue,
    required this.nextCouponDate,
    required this.instrumentName,
  });

  ClientProductModel copyWith({
    String? investmentType,
    String? effectiveDate,
    String? maturityDate,
    num? amountAtMaturity,
    num? rate,
    num? principal,
    num? accruedInterest,
    num? marketValue,
    String? nextCouponDate,
    String? instrumentName,
  }) {
    return ClientProductModel(
      investmentType: investmentType ?? this.investmentType,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      maturityDate: maturityDate ?? this.maturityDate,
      amountAtMaturity: amountAtMaturity ?? this.amountAtMaturity,
      rate: rate ?? this.rate,
      principal: principal ?? this.principal,
      accruedInterest: accruedInterest ?? this.accruedInterest,
      marketValue: marketValue ?? this.marketValue,
      nextCouponDate: nextCouponDate ?? this.nextCouponDate,
      instrumentName: instrumentName ?? this.instrumentName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'investmentType': investmentType,
      'effectiveDate': effectiveDate,
      'maturityDate': maturityDate,
      'amountAtMaturity': amountAtMaturity,
      'rate': rate,
      'principal': principal,
      'accruedInterest': accruedInterest,
      'marketValue': marketValue,
      'nextCouponDate': nextCouponDate,
      'instrumentName': instrumentName,
    };
  }

  factory ClientProductModel.fromMap(Map<String, dynamic> map) {
    return ClientProductModel(
      investmentType: map['investmentType'] ?? '',
      effectiveDate: map['effectiveDate'] ?? '',
      maturityDate: map['maturityDate'] ?? '',
      amountAtMaturity: map['amountAtMaturity'] ?? 0,
      rate: map['rate'] ?? 0,
      principal: map['principal'] ?? 0,
      accruedInterest: map['accruedInterest'] ?? 0,
      marketValue: map['marketValue'] ?? 0,
      nextCouponDate: map['nextCouponDate'] ?? '',
      instrumentName: map['instrumentName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientProductModel.fromJson(String source) =>
      ClientProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientProductModel(investmentType: $investmentType, effectiveDate: $effectiveDate, maturityDate: $maturityDate, amountAtMaturity: $amountAtMaturity, rate: $rate, principal: $principal, accruedInterest: $accruedInterest, marketValue: $marketValue, nextCouponDate: $nextCouponDate, instrumentName: $instrumentName)';
  }

  @override
  bool operator ==(covariant ClientProductModel other) {
    if (identical(this, other)) return true;

    return other.investmentType == investmentType &&
        other.effectiveDate == effectiveDate &&
        other.maturityDate == maturityDate &&
        other.amountAtMaturity == amountAtMaturity &&
        other.rate == rate &&
        other.principal == principal &&
        other.accruedInterest == accruedInterest &&
        other.marketValue == marketValue &&
        other.nextCouponDate == nextCouponDate &&
        other.instrumentName == instrumentName;
  }

  @override
  int get hashCode {
    return investmentType.hashCode ^
        effectiveDate.hashCode ^
        maturityDate.hashCode ^
        amountAtMaturity.hashCode ^
        rate.hashCode ^
        principal.hashCode ^
        accruedInterest.hashCode ^
        marketValue.hashCode ^
        nextCouponDate.hashCode ^
        instrumentName.hashCode;
  }
}
