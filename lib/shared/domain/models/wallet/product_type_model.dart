// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductTypeModel {
  bool? hasSecurities;
  bool? hasNGNWallet;
  bool? hasFixedIncomeNGN;
  bool? hasFixedincomeMMIUSD;
  bool? hasFixedincomeMMIGBP;
  bool? hasAlphaFund;
  bool? hasEquityFund;
  bool? hasDollarFund;
  bool? hasMMFFund;
  bool? hasSMANGN;
  ProductTypeModel({
    this.hasSecurities = false,
    this.hasNGNWallet = false,
    this.hasFixedIncomeNGN = false,
    this.hasFixedincomeMMIUSD = false,
    this.hasFixedincomeMMIGBP = false,
    this.hasAlphaFund = false,
    this.hasEquityFund = false,
    this.hasDollarFund = false,
    this.hasMMFFund = false,
    this.hasSMANGN = false,
  });

  ProductTypeModel copyWith({
    bool? hasSecurities,
    bool? hasNGNWallet,
    bool? hasFixedIncomeNGN,
    bool? hasFixedincomeMMIUSD,
    bool? hasFixedincomeMMIGBP,
    bool? hasAlphaFund,
    bool? hasEquityFund,
    bool? hasDollarFund,
    bool? hasMMFFund,
    bool? hasSMANGN,
  }) {
    return ProductTypeModel(
      hasSecurities: hasSecurities ?? this.hasSecurities,
      hasNGNWallet: hasNGNWallet ?? this.hasNGNWallet,
      hasFixedIncomeNGN: hasFixedIncomeNGN ?? this.hasFixedIncomeNGN,
      hasFixedincomeMMIUSD: hasFixedincomeMMIUSD ?? this.hasFixedincomeMMIUSD,
      hasFixedincomeMMIGBP: hasFixedincomeMMIGBP ?? this.hasFixedincomeMMIGBP,
      hasAlphaFund: hasAlphaFund ?? this.hasAlphaFund,
      hasEquityFund: hasEquityFund ?? this.hasEquityFund,
      hasDollarFund: hasDollarFund ?? this.hasDollarFund,
      hasMMFFund: hasMMFFund ?? this.hasMMFFund,
      hasSMANGN: hasSMANGN ?? this.hasSMANGN,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Securities Trading': hasSecurities,
      'NGN Wallet': hasNGNWallet,
      'Fixed Income NGN': hasFixedIncomeNGN,
      'Fixed Income/MMI USD': hasFixedincomeMMIUSD,
      'Fixed Income/MMI GBP': hasFixedincomeMMIGBP,
      'Alpha Fund': hasAlphaFund,
      'Equity Fund': hasEquityFund,
      'Dollar Fund': hasDollarFund,
      'MMF Fund': hasMMFFund,
      'SMA NGN': hasSMANGN,
    };
  }

  factory ProductTypeModel.fromMap(Map<String, dynamic> map) {
    return ProductTypeModel(
      hasSecurities: map['Securities Trading'] ?? false,
      hasNGNWallet: map['NGN Wallet'] ?? false,
      hasFixedIncomeNGN: map['Fixed Income NGN'] ?? false,
      hasFixedincomeMMIUSD: map['Fixed Income/MMI USD'] ?? false,
      hasFixedincomeMMIGBP: map['Fixed Income/MMI GBP'] ?? false,
      hasAlphaFund: map['Alpha Fund'] ?? false,
      hasEquityFund: map['Equity Fund'] ?? false,
      hasDollarFund: map['Dollar Fund'] ?? false,
      hasMMFFund: map['MMF Fund'] ?? false,
      hasSMANGN: map['SMA NGN'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductTypeModel.fromJson(String source) =>
      ProductTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductTypeModel(hasSecurities: $hasSecurities, hasNGNWallet: $hasNGNWallet, hasFixedIncomeNGN: $hasFixedIncomeNGN, hasFixedincomeMMIUSD: $hasFixedincomeMMIUSD, hasFixedincomeMMIGBP: $hasFixedincomeMMIGBP, hasAlphaFund: $hasAlphaFund, hasEquityFund: $hasEquityFund, hasDollarFund: $hasDollarFund, hasMMFFund: $hasMMFFund, hasSMANGN: $hasSMANGN)';
  }

  @override
  bool operator ==(covariant ProductTypeModel other) {
    if (identical(this, other)) return true;

    return other.hasSecurities == hasSecurities &&
        other.hasNGNWallet == hasNGNWallet &&
        other.hasFixedIncomeNGN == hasFixedIncomeNGN &&
        other.hasFixedincomeMMIUSD == hasFixedincomeMMIUSD &&
        other.hasFixedincomeMMIGBP == hasFixedincomeMMIGBP &&
        other.hasAlphaFund == hasAlphaFund &&
        other.hasEquityFund == hasEquityFund &&
        other.hasDollarFund == hasDollarFund &&
        other.hasMMFFund == hasMMFFund &&
        other.hasSMANGN == hasSMANGN;
  }

  @override
  int get hashCode {
    return hasSecurities.hashCode ^
        hasNGNWallet.hashCode ^
        hasFixedIncomeNGN.hashCode ^
        hasFixedincomeMMIUSD.hashCode ^
        hasFixedincomeMMIGBP.hashCode ^
        hasAlphaFund.hashCode ^
        hasEquityFund.hashCode ^
        hasDollarFund.hashCode ^
        hasMMFFund.hashCode ^
        hasSMANGN.hashCode;
  }
}
