// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TransactionModel {
  final int pageCount;
  final int pageSize;
  final int pageNumber;
  final String clientId;
  final String clientLabel;
  final String clientCode;
  final String accountId;
  final String accountNo;
  final String accountLabel;
  final String currency;
  final num openingBalance;
  final num closingBalance;
  final String subAccountType;
  final DateTime startDate;
  final DateTime endDate;
  final List<StatementLine> statementLines;
  TransactionModel({
    required this.pageCount,
    required this.pageSize,
    required this.pageNumber,
    required this.clientId,
    required this.clientLabel,
    required this.clientCode,
    required this.accountId,
    required this.accountNo,
    required this.accountLabel,
    required this.currency,
    required this.openingBalance,
    required this.closingBalance,
    required this.subAccountType,
    required this.startDate,
    required this.endDate,
    required this.statementLines,
  });

  TransactionModel copyWith({
    int? pageCount,
    int? pageSize,
    int? pageNumber,
    String? clientId,
    String? clientLabel,
    String? clientCode,
    String? accountId,
    String? accountNo,
    String? accountLabel,
    String? currency,
    num? openingBalance,
    num? closingBalance,
    String? subAccountType,
    DateTime? startDate,
    DateTime? endDate,
    List<StatementLine>? statementLines,
  }) {
    return TransactionModel(
      pageCount: pageCount ?? this.pageCount,
      pageSize: pageSize ?? this.pageSize,
      pageNumber: pageNumber ?? this.pageNumber,
      clientId: clientId ?? this.clientId,
      clientLabel: clientLabel ?? this.clientLabel,
      clientCode: clientCode ?? this.clientCode,
      accountId: accountId ?? this.accountId,
      accountNo: accountNo ?? this.accountNo,
      accountLabel: accountLabel ?? this.accountLabel,
      currency: currency ?? this.currency,
      openingBalance: openingBalance ?? this.openingBalance,
      closingBalance: closingBalance ?? this.closingBalance,
      subAccountType: subAccountType ?? this.subAccountType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      statementLines: statementLines ?? this.statementLines,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageCount': pageCount,
      'pageSize': pageSize,
      'pageNumber': pageNumber,
      'clientId': clientId,
      'clientLabel': clientLabel,
      'clientCode': clientCode,
      'accountId': accountId,
      'accountNo': accountNo,
      'accountLabel': accountLabel,
      'currency': currency,
      'openingBalance': openingBalance,
      'closingBalance': closingBalance,
      'subAccountType': subAccountType,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'statementLines': statementLines.map((x) => x.toMap()).toList(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
        pageCount: map['pageCount'] ?? 0,
        pageSize: map['pageSize'] ?? 0,
        pageNumber: map['pageNumber'] ?? 0,
        clientId: map['clientId'] ?? '',
        clientLabel: map['clientLabel'] ?? '',
        clientCode: map['clientCode'] ?? '',
        accountId: map['accountId'] ?? '',
        accountNo: map['accountNo'] ?? '',
        accountLabel: map['accountLabel'] ?? '',
        currency: map['currency'] ?? '',
        openingBalance: map['openingBalance'] ?? 0,
        closingBalance: map['closingBalance'] ?? 0,
        subAccountType: map['subAccountType'] ?? '',
        startDate: map['startDate'] == null
            ? DateTime.now()
            : DateTime.parse(map['startDate']),
        endDate: map['endDate'] == null
            ? DateTime.now()
            : DateTime.parse(map['endDate']),
        statementLines: List<StatementLine>.from(
            map['statementLines'].map((x) => StatementLine.fromMap(x))));
  }

  factory TransactionModel.initial() {
    return TransactionModel(
        pageCount: 0,
        pageSize: 0,
        pageNumber: 0,
        clientId: '',
        clientLabel: '',
        clientCode: '',
        accountId: '',
        accountNo: '',
        accountLabel: '',
        currency: '',
        openingBalance: 0,
        closingBalance: 0,
        subAccountType: '',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        statementLines: []);
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(pageCount: $pageCount, pageSize: $pageSize, pageNumber: $pageNumber, clientId: $clientId, clientLabel: $clientLabel, clientCode: $clientCode, accountId: $accountId, accountNo: $accountNo, accountLabel: $accountLabel, currency: $currency, openingBalance: $openingBalance, closingBalance: $closingBalance, subAccountType: $subAccountType, startDate: $startDate, endDate: $endDate, statementLines: $statementLines)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.pageCount == pageCount &&
        other.pageSize == pageSize &&
        other.pageNumber == pageNumber &&
        other.clientId == clientId &&
        other.clientLabel == clientLabel &&
        other.clientCode == clientCode &&
        other.accountId == accountId &&
        other.accountNo == accountNo &&
        other.accountLabel == accountLabel &&
        other.currency == currency &&
        other.openingBalance == openingBalance &&
        other.closingBalance == closingBalance &&
        other.subAccountType == subAccountType &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        listEquals(other.statementLines, statementLines);
  }

  @override
  int get hashCode {
    return pageCount.hashCode ^
        pageSize.hashCode ^
        pageNumber.hashCode ^
        clientId.hashCode ^
        clientLabel.hashCode ^
        clientCode.hashCode ^
        accountId.hashCode ^
        accountNo.hashCode ^
        accountLabel.hashCode ^
        currency.hashCode ^
        openingBalance.hashCode ^
        closingBalance.hashCode ^
        subAccountType.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        statementLines.hashCode;
  }
}

class StatementLine {
  final DateTime tranDate;
  final DateTime valueDate;
  final String label;
  final String refNo;
  final String entryType;
  final num debit;
  final num credit;
  final num balance;
  StatementLine({
    required this.tranDate,
    required this.valueDate,
    required this.label,
    required this.refNo,
    required this.entryType,
    required this.debit,
    required this.credit,
    required this.balance,
  });

  StatementLine copyWith({
    DateTime? tranDate,
    DateTime? valueDate,
    String? label,
    String? refNo,
    String? entryType,
    num? debit,
    num? credit,
    num? balance,
  }) {
    return StatementLine(
      tranDate: tranDate ?? this.tranDate,
      valueDate: valueDate ?? this.valueDate,
      label: label ?? this.label,
      refNo: refNo ?? this.refNo,
      entryType: entryType ?? this.entryType,
      debit: debit ?? this.debit,
      credit: credit ?? this.credit,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tranDate': tranDate.millisecondsSinceEpoch,
      'valueDate': valueDate.millisecondsSinceEpoch,
      'label': label,
      'refNo': refNo,
      'entryType': entryType,
      'debit': debit,
      'credit': credit,
      'balance': balance,
    };
  }

  factory StatementLine.fromMap(Map<String, dynamic> map) {
    return StatementLine(
      tranDate: map['tranDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['tranDate']),
      valueDate: map['valueDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['valueDate']),
      label: map['label'] ?? '',
      refNo: map['refNo'] ?? '',
      entryType: map['entryType'] ?? '',
      debit: map['debit'] ?? 0,
      credit: map['credit'] ?? 0,
      balance: map['balance'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatementLine.fromJson(String source) =>
      StatementLine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StatementLine(tranDate: $tranDate, valueDate: $valueDate, label: $label, refNo: $refNo, entryType: $entryType, debit: $debit, credit: $credit, balance: $balance)';
  }

  @override
  bool operator ==(covariant StatementLine other) {
    if (identical(this, other)) return true;

    return other.tranDate == tranDate &&
        other.valueDate == valueDate &&
        other.label == label &&
        other.refNo == refNo &&
        other.entryType == entryType &&
        other.debit == debit &&
        other.credit == credit &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return tranDate.hashCode ^
        valueDate.hashCode ^
        label.hashCode ^
        refNo.hashCode ^
        entryType.hashCode ^
        debit.hashCode ^
        credit.hashCode ^
        balance.hashCode;
  }
}
