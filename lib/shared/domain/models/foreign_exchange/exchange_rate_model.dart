// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExchangeRateModel {
  final int timestamp;
  final String baseCurrency;
  final double usdRate;
  final double gbpRate;
  final double eurRate;
  final double cadRate;
  final double cnyRate;
  final double audRate;
  ExchangeRateModel({
    required this.timestamp,
    required this.baseCurrency,
    required this.usdRate,
    required this.gbpRate,
    required this.eurRate,
    required this.cadRate,
    required this.cnyRate,
    required this.audRate,
  });

  ExchangeRateModel copyWith({
    int? timestamp,
    String? base,
    double? usdRate,
    double? gbpRate,
    double? eurRate,
    double? cadRate,
    double? cnyRate,
    double? audRate,
  }) {
    return ExchangeRateModel(
      timestamp: timestamp ?? this.timestamp,
      baseCurrency: base ?? baseCurrency,
      usdRate: usdRate ?? this.usdRate,
      gbpRate: gbpRate ?? this.gbpRate,
      eurRate: eurRate ?? this.eurRate,
      cadRate: cadRate ?? this.cadRate,
      cnyRate: cnyRate ?? this.cnyRate,
      audRate: audRate ?? this.audRate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timestamp': timestamp,
      'base': baseCurrency,
      'USDRate': usdRate,
      'GBPRate': gbpRate,
      'EURRate': eurRate,
      'CADRate': cadRate,
      'CNYRate': cnyRate,
      'AUDRate': audRate,
    };
  }

  factory ExchangeRateModel.fromMap(Map<String, dynamic> map) {
    return ExchangeRateModel(
      timestamp: map['timestamp'] ?? 0,
      baseCurrency: map['base'] ?? '',
      usdRate: map['USDRate'] ?? 0,
      gbpRate: map['GBPRate'] ?? 0,
      eurRate: map['EURRate'] ?? 0,
      cadRate: map['CADRate'] ?? 0,
      cnyRate: map['CNYRate'] ?? 0,
      audRate: map['AUDRate'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExchangeRateModel.fromJson(String source) =>
      ExchangeRateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExchangeRateModel(timestamp: $timestamp, base: $baseCurrency, usdRate: $usdRate, gbpRate: $gbpRate, eurRate: $eurRate, cadRate: $cadRate, cnyRate: $cnyRate, audRate: $audRate)';
  }

  @override
  bool operator ==(covariant ExchangeRateModel other) {
    if (identical(this, other)) return true;

    return other.timestamp == timestamp &&
        other.baseCurrency == baseCurrency &&
        other.usdRate == usdRate &&
        other.gbpRate == gbpRate &&
        other.eurRate == eurRate &&
        other.cadRate == cadRate &&
        other.cnyRate == cnyRate &&
        other.audRate == audRate;
  }

  @override
  int get hashCode {
    return timestamp.hashCode ^
        baseCurrency.hashCode ^
        usdRate.hashCode ^
        gbpRate.hashCode ^
        eurRate.hashCode ^
        cadRate.hashCode ^
        cnyRate.hashCode ^
        audRate.hashCode;
  }
}
