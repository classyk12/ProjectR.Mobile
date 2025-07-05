// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PerformingAssetModel {
  num id;
  num calculateChangePercent;
  String symbol;
  num prevClosingPrice;
  num openingPrice;
  num highPrice;
  num lowPrice;
  num closePrice;
  num change;
  num percChange;
  num trades;
  num volume;
  num value;
  String market;
  String sector;
  String company2;
  DateTime tradeDate;
  PerformingAssetModel({
    required this.id,
    required this.calculateChangePercent,
    required this.symbol,
    required this.prevClosingPrice,
    required this.openingPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.change,
    required this.percChange,
    required this.trades,
    required this.volume,
    required this.value,
    required this.market,
    required this.sector,
    required this.company2,
    required this.tradeDate,
  });

  PerformingAssetModel copyWith({
    num? id,
    num? calculateChangePercent,
    String? symbol,
    num? prevClosingPrice,
    num? openingPrice,
    num? highPrice,
    num? lowPrice,
    num? closePrice,
    num? change,
    num? percChange,
    num? trades,
    num? volume,
    num? value,
    String? market,
    String? sector,
    String? company2,
    DateTime? tradeDate,
  }) {
    return PerformingAssetModel(
      id: id ?? this.id,
      calculateChangePercent:
          calculateChangePercent ?? this.calculateChangePercent,
      symbol: symbol ?? this.symbol,
      prevClosingPrice: prevClosingPrice ?? this.prevClosingPrice,
      openingPrice: openingPrice ?? this.openingPrice,
      highPrice: highPrice ?? this.highPrice,
      lowPrice: lowPrice ?? this.lowPrice,
      closePrice: closePrice ?? this.closePrice,
      change: change ?? this.change,
      percChange: percChange ?? this.percChange,
      trades: trades ?? this.trades,
      volume: volume ?? this.volume,
      value: value ?? this.value,
      market: market ?? this.market,
      sector: sector ?? this.sector,
      company2: company2 ?? this.company2,
      tradeDate: tradeDate ?? this.tradeDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'calculateChangePercent': calculateChangePercent,
      'symbol': symbol,
      'prevClosingPrice': prevClosingPrice,
      'openingPrice': openingPrice,
      'highPrice': highPrice,
      'lowPrice': lowPrice,
      'closePrice': closePrice,
      'change': change,
      'percChange': percChange,
      'trades': trades,
      'volume': volume,
      'value': value,
      'market': market,
      'sector': sector,
      'company2': company2,
      'tradeDate': tradeDate.millisecondsSinceEpoch,
    };
  }

  factory PerformingAssetModel.fromMap(Map<String, dynamic> map) {
    return PerformingAssetModel(
      id: map['Id'] ?? 0,
      calculateChangePercent: map['CalculateChangePercent'] ?? 0,
      symbol: map['Symbol'] ?? '',
      prevClosingPrice: map['PrevClosingPrice'] ?? 0,
      openingPrice: map['OpeningPrice'] ?? 0,
      highPrice: map['HighPrice'] ?? 0,
      lowPrice: map['LowPrice'] ?? 0,
      closePrice: map['ClosePrice'] ?? 0,
      change: map['Change'] ?? 0,
      percChange: map['PercChange'] ?? 0,
      trades: map['Trades'] ?? 0,
      volume: map['Volume'] ?? 0,
      value: map['Value'] ?? 0,
      market: map['Market'] ?? '',
      sector: map['Sector'] ?? '',
      company2: map['Company2'] ?? '',
      tradeDate: map['TradeDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['TradeDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PerformingAssetModel.fromJson(String source) =>
      PerformingAssetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant PerformingAssetModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.calculateChangePercent == calculateChangePercent &&
        other.symbol == symbol &&
        other.prevClosingPrice == prevClosingPrice &&
        other.openingPrice == openingPrice &&
        other.highPrice == highPrice &&
        other.lowPrice == lowPrice &&
        other.closePrice == closePrice &&
        other.change == change &&
        other.percChange == percChange &&
        other.trades == trades &&
        other.volume == volume &&
        other.value == value &&
        other.market == market &&
        other.sector == sector &&
        other.company2 == company2 &&
        other.tradeDate == tradeDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        calculateChangePercent.hashCode ^
        symbol.hashCode ^
        prevClosingPrice.hashCode ^
        openingPrice.hashCode ^
        highPrice.hashCode ^
        lowPrice.hashCode ^
        closePrice.hashCode ^
        change.hashCode ^
        percChange.hashCode ^
        trades.hashCode ^
        volume.hashCode ^
        value.hashCode ^
        market.hashCode ^
        sector.hashCode ^
        company2.hashCode ^
        tradeDate.hashCode;
  }
}
