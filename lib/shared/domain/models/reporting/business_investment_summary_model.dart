// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BusinessesInvestmentSummaryModel {
  final num treasuryBill;
  final num commercialPaper;
  final num securitiesTrading;
  final num mutualFund;
  final num separatelyManagedAccounts;
  BusinessesInvestmentSummaryModel({
    required this.treasuryBill,
    required this.commercialPaper,
    required this.securitiesTrading,
    required this.mutualFund,
    required this.separatelyManagedAccounts,
  });

  BusinessesInvestmentSummaryModel copyWith({
    num? treasuryBill,
    num? commercialPaper,
    num? securitiesTrading,
    num? mutualFund,
    num? separatelyManagedAccounts,
  }) {
    return BusinessesInvestmentSummaryModel(
      treasuryBill: treasuryBill ?? this.treasuryBill,
      commercialPaper: commercialPaper ?? this.commercialPaper,
      securitiesTrading: securitiesTrading ?? this.securitiesTrading,
      mutualFund: mutualFund ?? this.mutualFund,
      separatelyManagedAccounts:
          separatelyManagedAccounts ?? this.separatelyManagedAccounts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Treasury Bill': treasuryBill,
      'Commercial Paper': commercialPaper,
      'Securities Trading': securitiesTrading,
      'Mutual Fund': mutualFund,
      'Separately Managed Accounts': separatelyManagedAccounts,
    };
  }

  factory BusinessesInvestmentSummaryModel.fromMap(Map<String, dynamic> map) {
    return BusinessesInvestmentSummaryModel(
      treasuryBill: map['Treasury Bill'] ?? 0,
      commercialPaper: map['Commercial Paper'] ?? 0,
      securitiesTrading: map['Securities Trading'] ?? 0,
      mutualFund: map['Mutual Fund'] ?? 0,
      separatelyManagedAccounts: map['Separately Managed Accounts'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessesInvestmentSummaryModel.fromJson(String source) =>
      BusinessesInvestmentSummaryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant BusinessesInvestmentSummaryModel other) {
    if (identical(this, other)) return true;

    return other.treasuryBill == treasuryBill &&
        other.commercialPaper == commercialPaper &&
        other.securitiesTrading == securitiesTrading &&
        other.mutualFund == mutualFund &&
        other.separatelyManagedAccounts == separatelyManagedAccounts;
  }

  @override
  int get hashCode {
    return treasuryBill.hashCode ^
        commercialPaper.hashCode ^
        securitiesTrading.hashCode ^
        mutualFund.hashCode ^
        separatelyManagedAccounts.hashCode;
  }
}
