// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InvestmentValuesData {
  final num totalCashBalance;
  final num totalInvestmentValue;
  final CashBreakdown cashBreakdown;
  final InvestmentBreakdownModel investmentBreakdown;
  InvestmentValuesData({
    required this.totalCashBalance,
    required this.totalInvestmentValue,
    required this.cashBreakdown,
    required this.investmentBreakdown,
  });

  InvestmentValuesData copyWith({
    num? totalCashBalance,
    num? totalInvestmentValue,
    CashBreakdown? cashBreakdown,
    InvestmentBreakdownModel? investmentBreakdown,
  }) {
    return InvestmentValuesData(
      totalCashBalance: totalCashBalance ?? this.totalCashBalance,
      totalInvestmentValue: totalInvestmentValue ?? this.totalInvestmentValue,
      cashBreakdown: cashBreakdown ?? this.cashBreakdown,
      investmentBreakdown: investmentBreakdown ?? this.investmentBreakdown,
    );
  }

  factory InvestmentValuesData.fromMap(Map<String, dynamic> map) {
    return InvestmentValuesData(
      totalCashBalance: map['totalCashBalance'] ?? 0,
      totalInvestmentValue: map['totalInvestmentValue'] ?? 0,
      cashBreakdown: CashBreakdown.fromMap(map['cashBreakdown']),
      investmentBreakdown:
          InvestmentBreakdownModel.fromMap(map['investmentBreakdown']),
    );
  }

  factory InvestmentValuesData.fromJson(String source) =>
      InvestmentValuesData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvestmentValuesData(totalCashBalance: $totalCashBalance, totalInvestmentValue: $totalInvestmentValue, cashBreakdown: $cashBreakdown, investmentBreakdown: $investmentBreakdown)';
  }

  @override
  bool operator ==(covariant InvestmentValuesData other) {
    if (identical(this, other)) return true;

    return other.totalCashBalance == totalCashBalance &&
        other.totalInvestmentValue == totalInvestmentValue &&
        other.cashBreakdown == cashBreakdown &&
        other.investmentBreakdown == investmentBreakdown;
  }

  @override
  int get hashCode {
    return totalCashBalance.hashCode ^
        totalInvestmentValue.hashCode ^
        cashBreakdown.hashCode ^
        investmentBreakdown.hashCode;
  }
}

class CashBreakdown {
  final num securitiesTrading;
  final num cardinalStoneSeparatelyManagedAccount;
  final num ngnCustomerWallet;
  final num fixedIncomeNote;
  final num cardinalStoneEquityFund;
  final num cardinalStoneFixedIncomeAlphaFund;

  CashBreakdown(
      {required this.securitiesTrading,
      required this.cardinalStoneSeparatelyManagedAccount,
      required this.ngnCustomerWallet,
      required this.fixedIncomeNote,
      required this.cardinalStoneEquityFund,
      required this.cardinalStoneFixedIncomeAlphaFund});

  CashBreakdown copyWith({
    num? securitiesTrading,
    num? cardinalStoneSeparatelyManagedAccount,
    num? fixedIncomeNote,
    num? ngnCustomerWallet,
    num? cardinalStoneFixedIncomeAlphaFund,
    num? cardinalStoneEquityFund,
  }) {
    return CashBreakdown(
      securitiesTrading: securitiesTrading ?? this.securitiesTrading,
      ngnCustomerWallet: ngnCustomerWallet ?? this.ngnCustomerWallet,
      fixedIncomeNote: fixedIncomeNote ?? this.fixedIncomeNote,
      cardinalStoneEquityFund:
          cardinalStoneEquityFund ?? this.cardinalStoneEquityFund,
      cardinalStoneFixedIncomeAlphaFund: cardinalStoneFixedIncomeAlphaFund ??
          this.cardinalStoneFixedIncomeAlphaFund,
      cardinalStoneSeparatelyManagedAccount:
          cardinalStoneSeparatelyManagedAccount ??
              this.cardinalStoneSeparatelyManagedAccount,
    );
  }

  factory CashBreakdown.fromMap(Map<String, dynamic> map) {
    return CashBreakdown(
      securitiesTrading: map['Securities Trading'] ?? 0,
      cardinalStoneSeparatelyManagedAccount:
          map['CardinalStone Separately Managed Account - NGN'] ?? 0,
      fixedIncomeNote: map['Fixed Income Note'] ?? 0,
      ngnCustomerWallet: map['NGN Customer Wallet'] ?? 0,
      cardinalStoneFixedIncomeAlphaFund:
          map['CardinalStone Fixed Income Alpha Fund'] ?? 0,
      cardinalStoneEquityFund: map['CardinalStone Equity Fund'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
        "Securities Trading": securitiesTrading,
        "CardinalStone Separately Managed Account - NGN":
            cardinalStoneSeparatelyManagedAccount,
        "Fixed Income Note": fixedIncomeNote,
        "NGN Customer Wallet": ngnCustomerWallet,
        "CardinalStone Fixed Income Alpha Fund":
            cardinalStoneFixedIncomeAlphaFund,
        "CardinalStone Equity Fund": cardinalStoneEquityFund,
      };

  factory CashBreakdown.fromJson(String source) =>
      CashBreakdown.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CashBreakdown(securitiesTrading: $securitiesTrading, ngnCustomerWallet: $ngnCustomerWallet, fixedIncomeNote: $fixedIncomeNote, cardinalStoneEquityFund: $cardinalStoneEquityFund, cardinalStoneFixedIncomeAlphaFund: $cardinalStoneFixedIncomeAlphaFund, cardinalstoneMoneyMarketFund: $cardinalStoneSeparatelyManagedAccount)';
  }

  @override
  bool operator ==(covariant CashBreakdown other) {
    if (identical(this, other)) return true;

    return other.securitiesTrading == securitiesTrading &&
        other.ngnCustomerWallet == ngnCustomerWallet &&
        other.fixedIncomeNote == fixedIncomeNote &&
        other.cardinalStoneEquityFund == cardinalStoneEquityFund &&
        other.cardinalStoneFixedIncomeAlphaFund ==
            cardinalStoneFixedIncomeAlphaFund &&
        other.cardinalStoneSeparatelyManagedAccount ==
            cardinalStoneSeparatelyManagedAccount;
  }

  @override
  int get hashCode {
    return securitiesTrading.hashCode ^
        ngnCustomerWallet.hashCode ^
        fixedIncomeNote.hashCode ^
        cardinalStoneEquityFund.hashCode ^
        cardinalStoneFixedIncomeAlphaFund.hashCode ^
        cardinalStoneSeparatelyManagedAccount.hashCode;
  }
}

class InvestmentBreakdownModel {
  final num securitiesTrading;
  final num mutualFund;
  final num treasuryBill;
  final num commercialPaper;
  final num eurobond;
  final num eurobondInvestmentNotes;
  final num fixedIncomeInvestmentNote;
  final SeparatelyManagedAccounts separatelyManagedAccounts;
  InvestmentBreakdownModel({
    required this.eurobond,
    required this.eurobondInvestmentNotes,
    required this.securitiesTrading,
    required this.mutualFund,
    required this.commercialPaper,
    required this.treasuryBill,
    required this.fixedIncomeInvestmentNote,
    required this.separatelyManagedAccounts,
  });

  InvestmentBreakdownModel copyWith({
    num? securitiesTrading,
    num? mutualFund,
    num? treasuryBill,
    num? commercialPaper,
    num? eurobond,
    num? eurobondInvestmentNotes,
    num? fixedIncomeInvestmentNote,
    SeparatelyManagedAccounts? separatelyManagedAccounts,
  }) {
    return InvestmentBreakdownModel(
      securitiesTrading: securitiesTrading ?? this.securitiesTrading,
      eurobondInvestmentNotes:
          eurobondInvestmentNotes ?? this.eurobondInvestmentNotes,
      eurobond: eurobond ?? this.eurobond,
      mutualFund: mutualFund ?? this.mutualFund,
      commercialPaper: commercialPaper ?? this.commercialPaper,
      fixedIncomeInvestmentNote:
          fixedIncomeInvestmentNote ?? this.fixedIncomeInvestmentNote,
      treasuryBill: treasuryBill ?? this.treasuryBill,
      separatelyManagedAccounts:
          separatelyManagedAccounts ?? this.separatelyManagedAccounts,
    );
  }

  factory InvestmentBreakdownModel.fromMap(Map<String, dynamic> map) {
    return InvestmentBreakdownModel(
      securitiesTrading: map['Securities Trading'] ?? 0,
      eurobond: map['Eurobond'] ?? 0,
      eurobondInvestmentNotes: map['Eurobond Investment Notes'] ?? 0,
      mutualFund: map['Mutual Fund'] ?? 0,
      treasuryBill: map['Treasury Bill'] ?? 0,
      commercialPaper: map['Commercial Paper'] ?? 0,
      fixedIncomeInvestmentNote: map['Fixed Income Investment Note'] ?? 0,
      separatelyManagedAccounts:
          SeparatelyManagedAccounts.fromMap(map['Separately Managed Accounts']),
    );
  }

  Map<String, dynamic> toMap() => {
        "Securities Trading": securitiesTrading,
        "Treasury Bill": treasuryBill,
        "Commercial Paper": commercialPaper,
        "Mutual Fund": mutualFund,
        "Eurobond": eurobond,
        "Eurobond Investment Notes": eurobondInvestmentNotes,
        "Fixed Income Investment Note": fixedIncomeInvestmentNote,
        "Separately Managed Accounts": separatelyManagedAccounts,
      };

  factory InvestmentBreakdownModel.fromJson(String source) =>
      InvestmentBreakdownModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InvestmentBreakdown(securitiesTrading: $securitiesTrading, mutualFund: $mutualFund, separatelyManagedAccounts: $separatelyManagedAccounts)';

  @override
  bool operator ==(covariant InvestmentBreakdownModel other) {
    if (identical(this, other)) return true;

    return other.securitiesTrading == securitiesTrading &&
        other.mutualFund == mutualFund &&
        other.separatelyManagedAccounts == separatelyManagedAccounts;
  }

  @override
  int get hashCode =>
      securitiesTrading.hashCode ^
      mutualFund.hashCode ^
      separatelyManagedAccounts.hashCode;
}

class SeparatelyManagedAccounts {
  final num total;
  final Breakdown breakdown;
  SeparatelyManagedAccounts({
    required this.total,
    required this.breakdown,
  });

  SeparatelyManagedAccounts copyWith({
    num? total,
    Breakdown? breakdown,
  }) {
    return SeparatelyManagedAccounts(
      total: total ?? this.total,
      breakdown: breakdown ?? this.breakdown,
    );
  }

  factory SeparatelyManagedAccounts.fromMap(Map<String, dynamic> map) {
    return SeparatelyManagedAccounts(
      total: map['total'] ?? 0,
      breakdown: Breakdown.fromMap(map['breakdown'] as Map<String, dynamic>),
    );
  }

  factory SeparatelyManagedAccounts.fromJson(String source) =>
      SeparatelyManagedAccounts.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SeparatelyManagedAccounts(total: $total, breakdown: $breakdown)';

  @override
  bool operator ==(covariant SeparatelyManagedAccounts other) {
    if (identical(this, other)) return true;

    return other.total == total && other.breakdown == breakdown;
  }

  @override
  int get hashCode => total.hashCode ^ breakdown.hashCode;
}

class Breakdown {
  final num smaEquities;
  final num smaTreasuryBill;
  final num smaCommercialPaper;
  final num fixedIncomeSma;
  Breakdown({
    required this.smaEquities,
    required this.smaTreasuryBill,
    required this.smaCommercialPaper,
    required this.fixedIncomeSma,
  });

  Breakdown copyWith({
    num? smaEquities,
    num? smaTreasuryBill,
    num? smaCommercialPaper,
    num? fixedIncomeSma,
  }) {
    return Breakdown(
      smaEquities: smaEquities ?? this.smaEquities,
      smaTreasuryBill: smaTreasuryBill ?? this.smaTreasuryBill,
      smaCommercialPaper: smaCommercialPaper ?? this.smaCommercialPaper,
      fixedIncomeSma: fixedIncomeSma ?? this.fixedIncomeSma,
    );
  }

  factory Breakdown.fromMap(Map<String, dynamic> map) {
    return Breakdown(
      smaEquities: map['SMA Equities'] ?? 0,
      smaTreasuryBill: map['SMA Treasury Bill'] ?? 0,
      smaCommercialPaper: map['SMA Commercial Paper'] ?? 0,
      fixedIncomeSma: map['Fixed Income - SMA'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
        "SMA Equities": smaEquities,
        "SMA Treasury Bill": smaTreasuryBill,
        "SMA Commercial Paper": smaCommercialPaper,
        "Fixed Income - SMA": fixedIncomeSma,
      };

  factory Breakdown.fromJson(String source) =>
      Breakdown.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Breakdown(smaEquities: $smaEquities, smaTreasuryBill: $smaTreasuryBill, smaCommercialPaper: $smaCommercialPaper, fixedIncomeSma: $fixedIncomeSma)';
  }

  @override
  bool operator ==(covariant Breakdown other) {
    if (identical(this, other)) return true;

    return other.smaEquities == smaEquities &&
        other.smaTreasuryBill == smaTreasuryBill &&
        other.smaCommercialPaper == smaCommercialPaper &&
        other.fixedIncomeSma == fixedIncomeSma;
  }

  @override
  int get hashCode {
    return smaEquities.hashCode ^
        smaTreasuryBill.hashCode ^
        smaCommercialPaper.hashCode ^
        fixedIncomeSma.hashCode;
  }
}
