// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SecuritiesStatModel {
  final String id;
  final String tenant;
  final String marketCode;
  final String marketSegmentId;
  final String secId;
  final String symbol;
  final String isin;
  final String secDesc;
  final String secText;
  final String secType;
  final String secSubType;
  final String underLyingSecId;
  final List<dynamic> boards;
  // final DateTime tradeDate;
  final num volume;
  final num price;
  final num openQty;
  final num proposals;
  final num numOfOrders;
  final num open;
  final num setlPrice;
  final num high;
  final num low;
  final num close;
  final num vwap;
  final num prevClose;
  final num refPx;
  final num delta;
  final num high52;
  final num low52;
  final num valTraded;
  final num volTraded;
  final num openInt;
  final num netChgPrevDay;
  final num netChgPrevDayPerc;
  final num bestBidPx;
  final num bestBidQty;
  final num bestOfferPx;
  final num bestOfferQty;
  final num lastPx;
  final num lastQty;
  final num bidDepth;
  final num offerDepth;
  final num tradeCnt;
  final num dailyForeignBuy;
  final num dailyForeignSell;
  final num marketCap;
  final List<Bid> bids;
  final List<Offers> offers;
  final List<Trade> trades;
  SecuritiesStatModel({
    required this.id,
    required this.tenant,
    required this.marketCode,
    required this.marketSegmentId,
    required this.secId,
    required this.symbol,
    required this.isin,
    required this.secDesc,
    required this.secText,
    required this.secType,
    required this.secSubType,
    required this.underLyingSecId,
    required this.boards,
    // required this.tradeDate,
    required this.volume,
    required this.price,
    required this.openQty,
    required this.proposals,
    required this.numOfOrders,
    required this.open,
    required this.setlPrice,
    required this.high,
    required this.low,
    required this.close,
    required this.vwap,
    required this.prevClose,
    required this.refPx,
    required this.delta,
    required this.high52,
    required this.low52,
    required this.valTraded,
    required this.volTraded,
    required this.openInt,
    required this.netChgPrevDay,
    required this.netChgPrevDayPerc,
    required this.bestBidPx,
    required this.bestBidQty,
    required this.bestOfferPx,
    required this.bestOfferQty,
    required this.lastPx,
    required this.lastQty,
    required this.bidDepth,
    required this.offerDepth,
    required this.tradeCnt,
    required this.dailyForeignBuy,
    required this.dailyForeignSell,
    required this.marketCap,
    required this.bids,
    required this.offers,
    required this.trades,
  });

  SecuritiesStatModel copyWith({
    String? id,
    String? tenant,
    String? marketCode,
    String? marketSegmentId,
    String? secId,
    String? symbol,
    String? isin,
    String? secDesc,
    String? secText,
    String? secType,
    String? secSubType,
    String? underLyingSecId,
    List<dynamic>? boards,
    // DateTime? tradeDate,
    num? volume,
    num? price,
    num? openQty,
    num? proposals,
    num? numOfOrders,
    num? open,
    num? setlPrice,
    num? high,
    num? low,
    num? close,
    num? vwap,
    num? prevClose,
    num? refPx,
    num? delta,
    num? high52,
    num? low52,
    num? valTraded,
    num? volTraded,
    num? openInt,
    num? netChgPrevDay,
    num? netChgPrevDayPerc,
    num? bestBidPx,
    num? bestBidQty,
    num? bestOfferPx,
    num? bestOfferQty,
    num? lastPx,
    num? lastQty,
    num? bidDepth,
    num? offerDepth,
    num? tradeCnt,
    num? dailyForeignBuy,
    num? dailyForeignSell,
    num? marketCap,
    List<Bid>? bids,
    List<Offers>? offers,
    List<Trade>? trades,
  }) {
    return SecuritiesStatModel(
      id: id ?? this.id,
      tenant: tenant ?? this.tenant,
      marketCode: marketCode ?? this.marketCode,
      marketSegmentId: marketSegmentId ?? this.marketSegmentId,
      secId: secId ?? this.secId,
      symbol: symbol ?? this.symbol,
      isin: isin ?? this.isin,
      secDesc: secDesc ?? this.secDesc,
      secText: secText ?? this.secText,
      secType: secType ?? this.secType,
      secSubType: secSubType ?? this.secSubType,
      underLyingSecId: underLyingSecId ?? this.underLyingSecId,
      boards: boards ?? this.boards,
      // tradeDate: tradeDate ?? this.tradeDate,
      volume: volume ?? this.volume,
      price: price ?? this.price,
      openQty: openQty ?? this.openQty,
      proposals: proposals ?? this.proposals,
      numOfOrders: numOfOrders ?? this.numOfOrders,
      open: open ?? this.open,
      setlPrice: setlPrice ?? this.setlPrice,
      high: high ?? this.high,
      low: low ?? this.low,
      close: close ?? this.close,
      vwap: vwap ?? this.vwap,
      prevClose: prevClose ?? this.prevClose,
      refPx: refPx ?? this.refPx,
      delta: delta ?? this.delta,
      high52: high52 ?? this.high52,
      low52: low52 ?? this.low52,
      valTraded: valTraded ?? this.valTraded,
      volTraded: volTraded ?? this.volTraded,
      openInt: openInt ?? this.openInt,
      netChgPrevDay: netChgPrevDay ?? this.netChgPrevDay,
      netChgPrevDayPerc: netChgPrevDayPerc ?? this.netChgPrevDayPerc,
      bestBidPx: bestBidPx ?? this.bestBidPx,
      bestBidQty: bestBidQty ?? this.bestBidQty,
      bestOfferPx: bestOfferPx ?? this.bestOfferPx,
      bestOfferQty: bestOfferQty ?? this.bestOfferQty,
      lastPx: lastPx ?? this.lastPx,
      lastQty: lastQty ?? this.lastQty,
      bidDepth: bidDepth ?? this.bidDepth,
      offerDepth: offerDepth ?? this.offerDepth,
      tradeCnt: tradeCnt ?? this.tradeCnt,
      dailyForeignBuy: dailyForeignBuy ?? this.dailyForeignBuy,
      dailyForeignSell: dailyForeignSell ?? this.dailyForeignSell,
      marketCap: marketCap ?? this.marketCap,
      bids: bids ?? this.bids,
      offers: offers ?? this.offers,
      trades: trades ?? this.trades,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tenant': tenant,
      'marketCode': marketCode,
      'marketSegmentId': marketSegmentId,
      'secId': secId,
      'symbol': symbol,
      'isin': isin,
      'secDesc': secDesc,
      'secText': secText,
      'secType': secType,
      'secSubType': secSubType,
      'underLyingSecId': underLyingSecId,
      'boards': boards,
      // 'tradeDate': tradeDate.millisecondsSinceEpoch,
      'volume': volume,
      'price': price,
      'openQty': openQty,
      'proposals': proposals,
      'numOfOrders': numOfOrders,
      'open': open,
      'setlPrice': setlPrice,
      'high': high,
      'low': low,
      'close': close,
      'vwap': vwap,
      'prevClose': prevClose,
      'refPx': refPx,
      'delta': delta,
      'high52': high52,
      'low52': low52,
      'valTraded': valTraded,
      'volTraded': volTraded,
      'openInt': openInt,
      'netChgPrevDay': netChgPrevDay,
      'netChgPrevDayPerc': netChgPrevDayPerc,
      'bestBidPx': bestBidPx,
      'bestBidQty': bestBidQty,
      'bestOfferPx': bestOfferPx,
      'bestOfferQty': bestOfferQty,
      'lastPx': lastPx,
      'lastQty': lastQty,
      'bidDepth': bidDepth,
      'offerDepth': offerDepth,
      'tradeCnt': tradeCnt,
      'dailyForeignBuy': dailyForeignBuy,
      'dailyForeignSell': dailyForeignSell,
      'marketCap': marketCap,
      'bids': bids.map((x) => x.toMap()).toList(),
      'offers': offers.map((x) => x.toJson()).toList(),
      'trades': trades.map((x) => x.toJson()).toList(),
    };
  }

  factory SecuritiesStatModel.fromMap(Map<String, dynamic> map) {
    return SecuritiesStatModel(
      id: map['id'] ?? '',
      tenant: map['tenant'] ?? '',
      marketCode: map['marketCode'] ?? '',
      marketSegmentId: map['marketSegmentId'] ?? '',
      secId: map['secId'] ?? '',
      symbol: map['symbol'] ?? '',
      isin: map['isin'] ?? '',
      secDesc: map['secDesc'] ?? '',
      secText: map['secText'] ?? '',
      secType: map['secType'] ?? '',
      secSubType: map['secSubType'] ?? '',
      underLyingSecId: map['underLyingSecId'] ?? '',
      boards: map['boards'] == null
          ? []
          : List<dynamic>.from((map['boards'] as List<dynamic>)),
      // tradeDate: map['tradeDate'] == null
      //     ? DateTime.now()
      //     : DateTime.parse(map['tradeDate']),
      volume: map['volume'] ?? 0,
      price: map['price'] ?? 0,
      openQty: map['openQty'] ?? 0,
      proposals: map['proposals'] ?? 0,
      numOfOrders: map['numOfOrders'] ?? 0,
      open: map['open'] ?? 0,
      setlPrice: map['setlPrice'] ?? 0,
      high: map['high'] ?? 0,
      low: map['low'] ?? 0,
      close: map['close'] ?? 0,
      vwap: map['vwap'] ?? 0,
      prevClose: map['prevClose'] ?? 0,
      refPx: map['refPx'] ?? 0,
      delta: map['delta'] ?? 0,
      high52: map['high52'] ?? 0,
      low52: map['low52'] ?? 0,
      valTraded: map['valTraded'] ?? 0,
      volTraded: map['volTraded'] ?? 0,
      openInt: map['openInt'] ?? 0,
      netChgPrevDay: map['netChgPrevDay'] ?? 0,
      netChgPrevDayPerc: map['netChgPrevDayPerc'] ?? 0,
      bestBidPx: map['bestBidPx'] ?? 0,
      bestBidQty: map['bestBidQty'] ?? 0,
      bestOfferPx: map['bestOfferPx'] ?? 0,
      bestOfferQty: map['bestOfferQty'] ?? 0,
      lastPx: map['lastPx'] ?? 0,
      lastQty: map['lastQty'] ?? 0,
      bidDepth: map['bidDepth'] ?? 0,
      offerDepth: map['offerDepth'] ?? 0,
      tradeCnt: map['tradeCnt'] ?? 0,
      dailyForeignBuy: map['dailyForeignBuy'] ?? 0,
      dailyForeignSell: map['dailyForeignSell'] ?? 0,
      marketCap: map['marketCap'] ?? 0,
      bids: map['bids'] == null
          ? []
          : List<Bid>.from(
              (map['bids'] as List<dynamic>).map<Bid>(
                (x) => Bid.fromMap(x as Map<String, dynamic>),
              ),
            ),
      offers: map['offers'] == null
          ? []
          : List<Offers>.from(
              (map['offers'] as List<dynamic>).map<Offers>(
                (x) => Offers.fromJson(x as Map<String, dynamic>),
              ),
            ),
      trades: map['trades'] == null
          ? []
          : List<Trade>.from(
              (map['trades'] as List<dynamic>).map<Trade>(
                (x) => Trade.fromJson(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  @override
  String toString() {
    return '';
  }

  @override
  bool operator ==(covariant SecuritiesStatModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tenant == tenant &&
        other.marketCode == marketCode &&
        other.marketSegmentId == marketSegmentId &&
        other.secId == secId &&
        other.symbol == symbol &&
        other.isin == isin &&
        other.secDesc == secDesc &&
        other.secText == secText &&
        other.secType == secType &&
        other.secSubType == secSubType &&
        other.underLyingSecId == underLyingSecId &&
        listEquals(other.boards, boards) &&
        // other.tradeDate == tradeDate &&
        other.volume == volume &&
        other.price == price &&
        other.openQty == openQty &&
        other.proposals == proposals &&
        other.numOfOrders == numOfOrders &&
        other.open == open &&
        other.setlPrice == setlPrice &&
        other.high == high &&
        other.low == low &&
        other.close == close &&
        other.vwap == vwap &&
        other.prevClose == prevClose &&
        other.refPx == refPx &&
        other.delta == delta &&
        other.high52 == high52 &&
        other.low52 == low52 &&
        other.valTraded == valTraded &&
        other.volTraded == volTraded &&
        other.openInt == openInt &&
        other.netChgPrevDay == netChgPrevDay &&
        other.netChgPrevDayPerc == netChgPrevDayPerc &&
        other.bestBidPx == bestBidPx &&
        other.bestBidQty == bestBidQty &&
        other.bestOfferPx == bestOfferPx &&
        other.bestOfferQty == bestOfferQty &&
        other.lastPx == lastPx &&
        other.bidDepth == bidDepth &&
        other.offerDepth == offerDepth &&
        other.tradeCnt == tradeCnt &&
        other.dailyForeignBuy == dailyForeignBuy &&
        other.dailyForeignSell == dailyForeignSell &&
        other.marketCap == marketCap &&
        listEquals(other.bids, bids) &&
        listEquals(other.offers, offers) &&
        listEquals(other.trades, trades);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tenant.hashCode ^
        marketCode.hashCode ^
        marketSegmentId.hashCode ^
        secId.hashCode ^
        symbol.hashCode ^
        isin.hashCode ^
        secDesc.hashCode ^
        secText.hashCode ^
        secType.hashCode ^
        secSubType.hashCode ^
        underLyingSecId.hashCode ^
        boards.hashCode ^
        // tradeDate.hashCode ^
        volume.hashCode ^
        price.hashCode ^
        openQty.hashCode ^
        proposals.hashCode ^
        numOfOrders.hashCode ^
        open.hashCode ^
        setlPrice.hashCode ^
        high.hashCode ^
        low.hashCode ^
        close.hashCode ^
        vwap.hashCode ^
        prevClose.hashCode ^
        refPx.hashCode ^
        delta.hashCode ^
        high52.hashCode ^
        low52.hashCode ^
        valTraded.hashCode ^
        volTraded.hashCode ^
        openInt.hashCode ^
        netChgPrevDay.hashCode ^
        netChgPrevDayPerc.hashCode ^
        bestBidPx.hashCode ^
        bestBidQty.hashCode ^
        bestOfferPx.hashCode ^
        bestOfferQty.hashCode ^
        lastPx.hashCode ^
        lastQty.hashCode ^
        bidDepth.hashCode ^
        offerDepth.hashCode ^
        tradeCnt.hashCode ^
        dailyForeignBuy.hashCode ^
        dailyForeignSell.hashCode ^
        marketCap.hashCode ^
        bids.hashCode ^
        offers.hashCode ^
        trades.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory SecuritiesStatModel.fromJson(String source) =>
      SecuritiesStatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Bid {
  final num price;
  final num qty;
  final num orderCount;

  Bid({
    required this.price,
    required this.qty,
    required this.orderCount,
  });

  factory Bid.fromJson(Map<String, dynamic> json) => Bid(
        price: json["price"] ?? 0,
        qty: json["qty"] ?? 0,
        orderCount: json["orderCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "qty": qty,
        "orderCount": orderCount,
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'qty': qty,
      'orderCount': orderCount,
    };
  }

  factory Bid.fromMap(Map<String, dynamic> map) {
    return Bid(
      price: map['price'] as num,
      qty: map['qty'] as num,
      orderCount: map['orderCount'] as num,
    );
  }

  String toJsonString() => json.encode(toMap());

  factory Bid.fromJsonString(String source) =>
      Bid.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Offers {
  final num price;
  final num qty;
  final num orderCount;

  Offers({
    required this.price,
    required this.qty,
    required this.orderCount,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        price: json["price"] ?? 0,
        qty: json["qty"] ?? 0,
        orderCount: json["orderCount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "qty": qty,
        "orderCount": orderCount,
      };
}

class Trade {
  final DateTime time;
  final String mdEntryId;
  final num tradePrice;
  final num size;
  final num volume;
  final num lastPx;

  Trade({
    required this.time,
    required this.mdEntryId,
    required this.tradePrice,
    required this.size,
    required this.volume,
    required this.lastPx,
  });

  factory Trade.fromJson(Map<String, dynamic> json) => Trade(
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json['time']),
        mdEntryId: json["mdEntryId"] ?? '',
        tradePrice: json["tradePrice"] ?? 0,
        size: json["size"] ?? 0,
        volume: json["volume"] ?? 0,
        lastPx: json["lastPx"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "mdEntryId": mdEntryId,
        "tradePrice": tradePrice,
        "size": size,
        "volume": volume,
        "lastPx": lastPx,
      };
}
