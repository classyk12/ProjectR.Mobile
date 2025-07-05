// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

String investmentAccountModelToJson(List<InvestmentAccountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

//  List<dynamic> jsonData = (String jsonString);

class InvestmentAccountModel {
  final String id;
  final num totalValue;
  final String clientId;
  final String mgmtType;
  final String status;
  final String accountUsage;
  final String tradingAccountNo;
  final dynamic tradingSubAccountNo;
  final String accountNo;
  final String accountLabel;
  final String clientCode;
  final String clientLabel;
  final String currency;
  final double cashBalance;
  final DateTime balanceTime;
  final num marginInterestRate;
  final num marginLimit;
  final String refCode;
  final String dividendDistribution;
  final bool directCashSettlement;
  final String clearingAccountNo;
  final num maxOpenBuyLimit;
  final num maxDailyBuyLimit;
  final num cashInterestRate;
  final List<TradingAccount> tradingAccounts;
  final String groupId;
  final bool marginAvailable;
  final String productCode;
  final String productId;
  final String branchId;
  final String glAccountId;
  final num effectiveCommissionRate;
  InvestmentAccountModel({
    required this.id,
    required this.totalValue,
    required this.clientId,
    required this.mgmtType,
    required this.status,
    required this.accountUsage,
    required this.tradingAccountNo,
    required this.tradingSubAccountNo,
    required this.accountNo,
    required this.accountLabel,
    required this.clientCode,
    required this.clientLabel,
    required this.currency,
    required this.cashBalance,
    required this.balanceTime,
    required this.marginInterestRate,
    required this.marginLimit,
    required this.refCode,
    required this.dividendDistribution,
    required this.directCashSettlement,
    required this.clearingAccountNo,
    required this.maxOpenBuyLimit,
    required this.maxDailyBuyLimit,
    required this.cashInterestRate,
    required this.tradingAccounts,
    required this.groupId,
    required this.marginAvailable,
    required this.productCode,
    required this.productId,
    required this.branchId,
    required this.glAccountId,
    required this.effectiveCommissionRate,
  });

  InvestmentAccountModel copyWith({
    String? id,
    num? totalValue,
    String? clientId,
    String? mgmtType,
    String? status,
    String? accountUsage,
    String? tradingAccountNo,
    String? tradingSubAccountNo,
    String? accountNo,
    String? accountLabel,
    String? clientCode,
    String? clientLabel,
    String? currency,
    double? cashBalance,
    DateTime? balanceTime,
    num? marginInterestRate,
    num? marginLimit,
    String? refCode,
    String? dividendDistribution,
    bool? directCashSettlement,
    String? clearingAccountNo,
    num? maxOpenBuyLimit,
    num? maxDailyBuyLimit,
    num? cashInterestRate,
    List<TradingAccount>? tradingAccounts,
    String? groupId,
    bool? marginAvailable,
    String? productCode,
    String? productId,
    String? branchId,
    String? glAccountId,
    num? effectiveCommissionRate,
  }) {
    return InvestmentAccountModel(
      id: id ?? this.id,
      totalValue: totalValue ?? this.totalValue,
      clientId: clientId ?? this.clientId,
      mgmtType: mgmtType ?? this.mgmtType,
      status: status ?? this.status,
      accountUsage: accountUsage ?? this.accountUsage,
      tradingAccountNo: tradingAccountNo ?? this.tradingAccountNo,
      tradingSubAccountNo: tradingSubAccountNo ?? this.tradingSubAccountNo,
      accountNo: accountNo ?? this.accountNo,
      accountLabel: accountLabel ?? this.accountLabel,
      clientCode: clientCode ?? this.clientCode,
      clientLabel: clientLabel ?? this.clientLabel,
      currency: currency ?? this.currency,
      cashBalance: cashBalance ?? this.cashBalance,
      balanceTime: balanceTime ?? this.balanceTime,
      marginInterestRate: marginInterestRate ?? this.marginInterestRate,
      marginLimit: marginLimit ?? this.marginLimit,
      refCode: refCode ?? this.refCode,
      dividendDistribution: dividendDistribution ?? this.dividendDistribution,
      directCashSettlement: directCashSettlement ?? this.directCashSettlement,
      clearingAccountNo: clearingAccountNo ?? this.clearingAccountNo,
      maxOpenBuyLimit: maxOpenBuyLimit ?? this.maxOpenBuyLimit,
      maxDailyBuyLimit: maxDailyBuyLimit ?? this.maxDailyBuyLimit,
      cashInterestRate: cashInterestRate ?? this.cashInterestRate,
      tradingAccounts: tradingAccounts ?? this.tradingAccounts,
      groupId: groupId ?? this.groupId,
      marginAvailable: marginAvailable ?? this.marginAvailable,
      productCode: productCode ?? this.productCode,
      productId: productId ?? this.productId,
      branchId: branchId ?? this.branchId,
      glAccountId: glAccountId ?? this.glAccountId,
      effectiveCommissionRate:
          effectiveCommissionRate ?? this.effectiveCommissionRate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'totalValue': totalValue,
      'clientId': clientId,
      'mgmtType': mgmtType,
      'status': status,
      'accountUsage': accountUsage,
      'tradingAccountNo': tradingAccountNo,
      'tradingSubAccountNo': tradingSubAccountNo,
      'accountNo': accountNo,
      'accountLabel': accountLabel,
      'clientCode': clientCode,
      'clientLabel': clientLabel,
      'currency': currency,
      'cashBalance': cashBalance,
      'balanceTime': balanceTime.millisecondsSinceEpoch,
      'marginInterestRate': marginInterestRate,
      'marginLimit': marginLimit,
      'refCode': refCode,
      'dividendDistribution': dividendDistribution,
      'directCashSettlement': directCashSettlement,
      'clearingAccountNo': clearingAccountNo,
      'maxOpenBuyLimit': maxOpenBuyLimit,
      'maxDailyBuyLimit': maxDailyBuyLimit,
      'cashInterestRate': cashInterestRate,
      'tradingAccounts': tradingAccounts.map((x) => x.toMap()).toList(),
      'groupId': groupId,
      'marginAvailable': marginAvailable,
      'productCode': productCode,
      'productId': productId,
      'branchId': branchId,
      'glAccountId': glAccountId,
      'effectiveCommissionRate': effectiveCommissionRate,
    };
  }

  factory InvestmentAccountModel.fromMap(Map<String, dynamic> map) {
    return InvestmentAccountModel(
      id: map['id'] ?? '',
      totalValue: map['totalValue'] ?? 0,
      clientId: map['clientId'] ?? '',
      mgmtType: map['mgmtType'] ?? '',
      status: map['status'] ?? '',
      accountUsage: map['accountUsage'] ?? '',
      tradingAccountNo: map['tradingAccountNo'] ?? '',
      tradingSubAccountNo: map['tradingSubAccountNo'] ?? '',
      accountNo: map['accountNo'] ?? '',
      accountLabel: map['accountLabel'] ?? '',
      clientCode: map['clientCode'] ?? '',
      clientLabel: map['clientLabel'] ?? '',
      currency: map['currency'] ?? '',
      cashBalance: map['cashBalance'] ?? 0,
      balanceTime: map['balanceTime'] == null
          ? DateTime.now()
          : DateTime.parse(map['balanceTime']),
      marginInterestRate: map['marginInterestRate'] ?? 0,
      marginLimit: map['marginLimit'] ?? 0,
      refCode: map['refCode'] ?? '',
      dividendDistribution: map['dividendDistribution'] ?? '',
      directCashSettlement: map['directCashSettlement'] ?? false,
      clearingAccountNo: map['clearingAccountNo'] ?? '',
      maxOpenBuyLimit: map['maxOpenBuyLimit'] ?? 0,
      maxDailyBuyLimit: map['maxDailyBuyLimit'] ?? 0,
      cashInterestRate: map['cashInterestRate'] ?? 0,
      tradingAccounts: map['tradingAccounts'] == null
          ? []
          : List<TradingAccount>.from(
              map['tradingAccounts'].map<TradingAccount>(
                (x) => TradingAccount.fromMap(x),
              ),
            ),
      groupId: map['groupId'] ?? '',
      marginAvailable: map['marginAvailable'] ?? false,
      productCode: map['productCode'] ?? '',
      productId: map['productId'] ?? '',
      branchId: map['branchId'] ?? '',
      glAccountId: map['glAccountId'] ?? '',
      effectiveCommissionRate: map['effectiveCommissionRate'] ?? 0,
    );
  }

  factory InvestmentAccountModel.initial() {
    return InvestmentAccountModel(
      id: '',
      totalValue: 0,
      clientId: '',
      mgmtType: '',
      status: '',
      accountUsage: '',
      tradingAccountNo: '',
      tradingSubAccountNo: '',
      accountNo: '',
      accountLabel: '',
      clientCode: '',
      clientLabel: '',
      currency: '',
      cashBalance: 0,
      balanceTime: DateTime.now(),
      marginInterestRate: 0,
      marginLimit: 0,
      refCode: '',
      dividendDistribution: '',
      directCashSettlement: false,
      clearingAccountNo: '',
      maxOpenBuyLimit: 0,
      maxDailyBuyLimit: 0,
      cashInterestRate: 0,
      tradingAccounts: [],
      groupId: '',
      marginAvailable: false,
      productCode: '',
      productId: '',
      branchId: '',
      glAccountId: '',
      effectiveCommissionRate: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvestmentAccountModel.fromJson(String source) =>
      InvestmentAccountModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant InvestmentAccountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.totalValue == totalValue &&
        other.clientId == clientId &&
        other.mgmtType == mgmtType &&
        other.status == status &&
        other.accountUsage == accountUsage &&
        other.tradingAccountNo == tradingAccountNo &&
        other.tradingSubAccountNo == tradingSubAccountNo &&
        other.accountNo == accountNo &&
        other.accountLabel == accountLabel &&
        other.clientCode == clientCode &&
        other.clientLabel == clientLabel &&
        other.currency == currency &&
        other.cashBalance == cashBalance &&
        other.balanceTime == balanceTime &&
        other.marginInterestRate == marginInterestRate &&
        other.marginLimit == marginLimit &&
        other.refCode == refCode &&
        other.dividendDistribution == dividendDistribution &&
        other.directCashSettlement == directCashSettlement &&
        other.clearingAccountNo == clearingAccountNo &&
        other.maxOpenBuyLimit == maxOpenBuyLimit &&
        other.maxDailyBuyLimit == maxDailyBuyLimit &&
        other.cashInterestRate == cashInterestRate &&
        listEquals(other.tradingAccounts, tradingAccounts) &&
        other.groupId == groupId &&
        other.marginAvailable == marginAvailable &&
        other.productCode == productCode &&
        other.productId == productId &&
        other.branchId == branchId &&
        other.glAccountId == glAccountId &&
        other.effectiveCommissionRate == effectiveCommissionRate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        totalValue.hashCode ^
        clientId.hashCode ^
        mgmtType.hashCode ^
        status.hashCode ^
        accountUsage.hashCode ^
        tradingAccountNo.hashCode ^
        tradingSubAccountNo.hashCode ^
        accountNo.hashCode ^
        accountLabel.hashCode ^
        clientCode.hashCode ^
        clientLabel.hashCode ^
        currency.hashCode ^
        cashBalance.hashCode ^
        balanceTime.hashCode ^
        marginInterestRate.hashCode ^
        marginLimit.hashCode ^
        refCode.hashCode ^
        dividendDistribution.hashCode ^
        directCashSettlement.hashCode ^
        clearingAccountNo.hashCode ^
        maxOpenBuyLimit.hashCode ^
        maxDailyBuyLimit.hashCode ^
        cashInterestRate.hashCode ^
        tradingAccounts.hashCode ^
        groupId.hashCode ^
        marginAvailable.hashCode ^
        productCode.hashCode ^
        productId.hashCode ^
        branchId.hashCode ^
        glAccountId.hashCode ^
        effectiveCommissionRate.hashCode;
  }
}

class TradingAccount {
  final String id;
  final String tradingAccountLabel;
  final String tradingAccountNo;
  final String clearingAccountNo;
  TradingAccount({
    required this.id,
    required this.tradingAccountLabel,
    required this.tradingAccountNo,
    required this.clearingAccountNo,
  });

  TradingAccount copyWith({
    String? id,
    String? tradingAccountLabel,
    String? tradingAccountNo,
    String? clearingAccountNo,
  }) {
    return TradingAccount(
      id: id ?? this.id,
      tradingAccountLabel: tradingAccountLabel ?? this.tradingAccountLabel,
      tradingAccountNo: tradingAccountNo ?? this.tradingAccountNo,
      clearingAccountNo: clearingAccountNo ?? this.clearingAccountNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tradingAccountLabel': tradingAccountLabel,
      'tradingAccountNo': tradingAccountNo,
      'clearingAccountNo': clearingAccountNo,
    };
  }

  factory TradingAccount.fromMap(Map<String, dynamic> map) {
    return TradingAccount(
      id: map['id'] ?? '',
      tradingAccountLabel: map['tradingAccountLabel'] ?? '',
      tradingAccountNo: map['tradingAccountNo'] ?? '',
      clearingAccountNo: map['clearingAccountNo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TradingAccount.fromJson(String source) =>
      TradingAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TradingAccount(id: $id, tradingAccountLabel: $tradingAccountLabel, tradingAccountNo: $tradingAccountNo, clearingAccountNo: $clearingAccountNo)';
  }

  @override
  bool operator ==(covariant TradingAccount other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tradingAccountLabel == tradingAccountLabel &&
        other.tradingAccountNo == tradingAccountNo &&
        other.clearingAccountNo == clearingAccountNo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tradingAccountLabel.hashCode ^
        tradingAccountNo.hashCode ^
        clearingAccountNo.hashCode;
  }
}
