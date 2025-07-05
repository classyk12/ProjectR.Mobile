// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PortfolioPositionReportModel {
  final String accountId;
  final String accountLabel;
  final String accountNo;
  final DateTime positionDate;
  final String reportCurrency;
  final num totalValue;
  final num totalCost;
  final List<PositionInstrument> positionInstruments;
  final num gainLoss;
  final num gainLossPercent;
  PortfolioPositionReportModel({
    required this.accountId,
    required this.accountLabel,
    required this.accountNo,
    required this.positionDate,
    required this.reportCurrency,
    required this.totalValue,
    required this.totalCost,
    required this.positionInstruments,
    required this.gainLoss,
    required this.gainLossPercent,
  });

  PortfolioPositionReportModel copyWith({
    String? accountId,
    String? accountLabel,
    String? accountNo,
    DateTime? positionDate,
    String? reportCurrency,
    num? totalValue,
    num? totalCost,
    List<PositionInstrument>? positionInstruments,
    num? gainLoss,
    num? gainLossPercent,
  }) {
    return PortfolioPositionReportModel(
      accountId: accountId ?? this.accountId,
      accountLabel: accountLabel ?? this.accountLabel,
      accountNo: accountNo ?? this.accountNo,
      positionDate: positionDate ?? this.positionDate,
      reportCurrency: reportCurrency ?? this.reportCurrency,
      totalValue: totalValue ?? this.totalValue,
      totalCost: totalCost ?? this.totalCost,
      positionInstruments: positionInstruments ?? this.positionInstruments,
      gainLoss: gainLoss ?? this.gainLoss,
      gainLossPercent: gainLossPercent ?? this.gainLossPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountId': accountId,
      'accountLabel': accountLabel,
      'accountNo': accountNo,
      'positionDate': positionDate.millisecondsSinceEpoch,
      'reportCurrency': reportCurrency,
      'totalValue': totalValue,
      'totalCost': totalCost,
      'positionInstruments': positionInstruments.map((x) => x.toMap()).toList(),
      'gainLoss': gainLoss,
      'gainLossPercent': gainLossPercent,
    };
  }

  factory PortfolioPositionReportModel.fromMap(Map<String, dynamic> map) {
    return PortfolioPositionReportModel(
      accountId: map['accountId'] ?? '',
      accountLabel: map['accountLabel'] ?? '',
      accountNo: map['accountNo'] ?? '',
      positionDate: map['positionDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['positionDate']),
      reportCurrency: map['reportCurrency'] ?? '',
      totalValue: map['totalValue'] ?? 0,
      totalCost: map['totalCost'] ?? 0,
      positionInstruments: map['positionInstruments'] == null
          ? []
          : List<PositionInstrument>.from(
              map['positionInstruments'].map<PositionInstrument>(
                (x) => PositionInstrument.fromMap(x),
              ),
            ),
      gainLoss: map['gainLoss'] ?? 0,
      gainLossPercent: map['gainLossPercent'] ?? 0,
    );
  }

  factory PortfolioPositionReportModel.initial() {
    return PortfolioPositionReportModel(
      accountId: '',
      accountLabel: '',
      accountNo: '',
      positionDate: DateTime.now(),
      reportCurrency: '',
      totalValue: 0,
      totalCost: 0,
      positionInstruments: [],
      gainLoss: 0,
      gainLossPercent: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PortfolioPositionReportModel.fromJson(String source) =>
      PortfolioPositionReportModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PortfolioPositionReportModel(accountId: $accountId, accountLabel: $accountLabel, accountNo: $accountNo, positionDate: $positionDate, reportCurrency: $reportCurrency, totalValue: $totalValue, totalCost: $totalCost, positionInstruments: $positionInstruments, gainLoss: $gainLoss, gainLossPercent: $gainLossPercent)';
  }

  @override
  bool operator ==(covariant PortfolioPositionReportModel other) {
    if (identical(this, other)) return true;

    return other.accountId == accountId &&
        other.accountLabel == accountLabel &&
        other.accountNo == accountNo &&
        other.positionDate == positionDate &&
        other.reportCurrency == reportCurrency &&
        other.totalValue == totalValue &&
        other.totalCost == totalCost &&
        listEquals(other.positionInstruments, positionInstruments) &&
        other.gainLoss == gainLoss &&
        other.gainLossPercent == gainLossPercent;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        accountLabel.hashCode ^
        accountNo.hashCode ^
        positionDate.hashCode ^
        reportCurrency.hashCode ^
        totalValue.hashCode ^
        totalCost.hashCode ^
        positionInstruments.hashCode ^
        gainLoss.hashCode ^
        gainLossPercent.hashCode;
  }
}

class PositionInstrument {
  final String instrumentId;
  final String instrumentType;
  final String secId;
  final String secDesc;
  final String secNotes;
  final String isin;
  final String marketCode;
  final String instrumentCurrency;
  final num currencyRate;
  final num currentPrice;
  final num priceConvRatio;
  final num parValue;
  final num quantity;
  final num avgCost;
  final num totalCost;
  final num currentValue;
  final DateTime positionStartDate;
  final num interest;
  final String tradingAccountNo;
  final String assetAllocation;
  final String gainLossPercentage;
  final String gainLoss;
  PositionInstrument({
    required this.instrumentId,
    required this.instrumentType,
    required this.secId,
    required this.secDesc,
    required this.secNotes,
    required this.isin,
    required this.marketCode,
    required this.instrumentCurrency,
    required this.currencyRate,
    required this.currentPrice,
    required this.priceConvRatio,
    required this.parValue,
    required this.quantity,
    required this.avgCost,
    required this.totalCost,
    required this.currentValue,
    required this.positionStartDate,
    required this.interest,
    required this.tradingAccountNo,
    required this.assetAllocation,
    required this.gainLossPercentage,
    required this.gainLoss,
  });

  PositionInstrument copyWith({
    String? instrumentId,
    String? instrumentType,
    String? secId,
    String? secDesc,
    String? secNotes,
    String? isin,
    String? marketCode,
    String? instrumentCurrency,
    num? currencyRate,
    num? currentPrice,
    num? priceConvRatio,
    num? parValue,
    num? quantity,
    num? avgCost,
    num? totalCost,
    num? currentValue,
    DateTime? positionStartDate,
    num? interest,
    String? tradingAccountNo,
    String? assetAllocation,
    String? gainLossPercentage,
    String? gainLoss,
  }) {
    return PositionInstrument(
      instrumentId: instrumentId ?? this.instrumentId,
      instrumentType: instrumentType ?? this.instrumentType,
      secId: secId ?? this.secId,
      secDesc: secDesc ?? this.secDesc,
      secNotes: secNotes ?? this.secNotes,
      isin: isin ?? this.isin,
      marketCode: marketCode ?? this.marketCode,
      instrumentCurrency: instrumentCurrency ?? this.instrumentCurrency,
      currencyRate: currencyRate ?? this.currencyRate,
      currentPrice: currentPrice ?? this.currentPrice,
      priceConvRatio: priceConvRatio ?? this.priceConvRatio,
      parValue: parValue ?? this.parValue,
      quantity: quantity ?? this.quantity,
      avgCost: avgCost ?? this.avgCost,
      totalCost: totalCost ?? this.totalCost,
      currentValue: currentValue ?? this.currentValue,
      positionStartDate: positionStartDate ?? this.positionStartDate,
      interest: interest ?? this.interest,
      tradingAccountNo: tradingAccountNo ?? this.tradingAccountNo,
      assetAllocation: assetAllocation ?? this.assetAllocation,
      gainLossPercentage: gainLossPercentage ?? this.gainLossPercentage,
      gainLoss: gainLoss ?? this.gainLoss,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instrumentId': instrumentId,
      'instrumentType': instrumentType,
      'secId': secId,
      'secDesc': secDesc,
      'secNotes': secNotes,
      'isin': isin,
      'marketCode': marketCode,
      'instrumentCurrency': instrumentCurrency,
      'currencyRate': currencyRate,
      'currentPrice': currentPrice,
      'priceConvRatio': priceConvRatio,
      'parValue': parValue,
      'quantity': quantity,
      'avgCost': avgCost,
      'totalCost': totalCost,
      'currentValue': currentValue,
      'positionStartDate': positionStartDate.millisecondsSinceEpoch,
      'interest': interest,
      'tradingAccountNo': tradingAccountNo,
      'assetAllocation': assetAllocation,
      'gainLossPercentage': gainLossPercentage,
      'gainLoss': gainLoss,
    };
  }

  factory PositionInstrument.fromMap(Map<String, dynamic> map) {
    return PositionInstrument(
      instrumentId: map['instrumentId'] ?? '',
      instrumentType: map['instrumentType'] ?? '',
      secId: map['secId'] ?? '',
      secDesc: map['secDesc'] ?? '',
      secNotes: map['secNotes'] ?? '',
      isin: map['isin'] ?? '',
      marketCode: map['marketCode'] ?? '',
      instrumentCurrency: map['instrumentCurrency'] ?? '',
      currencyRate: map['currencyRate'] ?? 0,
      currentPrice: map['currentPrice'] ?? 0,
      priceConvRatio: map['priceConvRatio'] ?? 0,
      parValue: map['parValue'] ?? 0,
      quantity: map['quantity'] ?? 0,
      avgCost: map['avgCost'] ?? 0,
      totalCost: map['totalCost'] ?? 0,
      currentValue: map['currentValue'] ?? 0,
      positionStartDate: map['positionStartDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['positionStartDate']),
      interest: map['interest'] ?? 0,
      tradingAccountNo: map['tradingAccountNo'] ?? '',
      assetAllocation: map['assetAllocation'] ?? '',
      gainLossPercentage: map['gainLossPercentage'] ?? '',
      gainLoss: map['gainLoss'] ?? '',
    );
  }

  factory PositionInstrument.initial() {
    return PositionInstrument(
      instrumentId: '',
      instrumentType: '',
      secId: '',
      secDesc: '',
      secNotes: '',
      isin: '',
      marketCode: '',
      instrumentCurrency: '',
      currencyRate: 0,
      currentPrice: 0,
      priceConvRatio: 0,
      parValue: 0,
      quantity: 0,
      avgCost: 0,
      totalCost: 0,
      currentValue: 0,
      positionStartDate: DateTime.now(),
      interest:  0,
      tradingAccountNo: '',
      assetAllocation: '',
      gainLossPercentage:  '',
      gainLoss: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PositionInstrument.fromJson(String source) =>
      PositionInstrument.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PositionInstrument(instrumentId: $instrumentId, instrumentType: $instrumentType, secId: $secId, secDesc: $secDesc, secNotes: $secNotes, isin: $isin, marketCode: $marketCode, instrumentCurrency: $instrumentCurrency, currencyRate: $currencyRate, currentPrice: $currentPrice, priceConvRatio: $priceConvRatio, parValue: $parValue, quantity: $quantity, avgCost: $avgCost, totalCost: $totalCost, currentValue: $currentValue, positionStartDate: $positionStartDate, interest: $interest, tradingAccountNo: $tradingAccountNo, assetAllocation: $assetAllocation, gainLossPercentage: $gainLossPercentage, gainLoss: $gainLoss)';
  }

  @override
  bool operator ==(covariant PositionInstrument other) {
    if (identical(this, other)) return true;

    return other.instrumentId == instrumentId &&
        other.instrumentType == instrumentType &&
        other.secId == secId &&
        other.secDesc == secDesc &&
        other.secNotes == secNotes &&
        other.isin == isin &&
        other.marketCode == marketCode &&
        other.instrumentCurrency == instrumentCurrency &&
        other.currencyRate == currencyRate &&
        other.currentPrice == currentPrice &&
        other.priceConvRatio == priceConvRatio &&
        other.parValue == parValue &&
        other.quantity == quantity &&
        other.avgCost == avgCost &&
        other.totalCost == totalCost &&
        other.currentValue == currentValue &&
        other.positionStartDate == positionStartDate &&
        other.interest == interest &&
        other.tradingAccountNo == tradingAccountNo &&
        other.assetAllocation == assetAllocation &&
        other.gainLossPercentage == gainLossPercentage &&
        other.gainLoss == gainLoss;
  }

  @override
  int get hashCode {
    return instrumentId.hashCode ^
        instrumentType.hashCode ^
        secId.hashCode ^
        secDesc.hashCode ^
        secNotes.hashCode ^
        isin.hashCode ^
        marketCode.hashCode ^
        instrumentCurrency.hashCode ^
        currencyRate.hashCode ^
        currentPrice.hashCode ^
        priceConvRatio.hashCode ^
        parValue.hashCode ^
        quantity.hashCode ^
        avgCost.hashCode ^
        totalCost.hashCode ^
        currentValue.hashCode ^
        positionStartDate.hashCode ^
        interest.hashCode ^
        tradingAccountNo.hashCode ^
        assetAllocation.hashCode ^
        gainLossPercentage.hashCode ^
        gainLoss.hashCode;
  }
}
