// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderBookModel {
  final String id;
  final DateTime createdAt;
  final dynamic idemPotencyId;
  final String marketCode;
  final String secId;
  final String clientId;
  final String instrumentId;
  final String clientCode;
  final String clientLabel;
  final String side;
  final String tif;
  final String orderStatus;
  final String routingStatus;
  final String routingMessage;
  final dynamic executionMessage;
  final String orderNo;
  final dynamic marketOrderId;
  final String orderDesc;
  final num requestedQty;
  final num filledQty;
  final DateTime requestTime;
  final DateTime expires;
  final num limitPrice;
  final String currency;
  final num numberOfLegs;
  final String assetType;
  final dynamic orderStrategy;
  final num consideration;
  final num commission;
  final num fees;
  final num totalValue;
  final dynamic faceValue;
  final String notes;
  final bool autoApprove;
  final bool allOrNone;
  final bool contractNoteReversed;
  final String channel;
  final String tradingAccountNo;
  final dynamic tradingSubAccountNo;
  final dynamic avgCost;
  final String accountId;
  final String accountLabel;
  final String accountNo;
  final DateTime tradeDate;
  final num openQuantity;
  OrderBookModel({
    required this.id,
    required this.createdAt,
    required this.idemPotencyId,
    required this.marketCode,
    required this.secId,
    required this.clientId,
    required this.instrumentId,
    required this.clientCode,
    required this.clientLabel,
    required this.side,
    required this.tif,
    required this.orderStatus,
    required this.routingStatus,
    required this.routingMessage,
    required this.executionMessage,
    required this.orderNo,
    required this.marketOrderId,
    required this.orderDesc,
    required this.requestedQty,
    required this.filledQty,
    required this.requestTime,
    required this.expires,
    required this.limitPrice,
    required this.currency,
    required this.numberOfLegs,
    required this.assetType,
    required this.orderStrategy,
    required this.consideration,
    required this.commission,
    required this.fees,
    required this.totalValue,
    required this.faceValue,
    required this.notes,
    required this.autoApprove,
    required this.allOrNone,
    required this.contractNoteReversed,
    required this.channel,
    required this.tradingAccountNo,
    required this.tradingSubAccountNo,
    required this.avgCost,
    required this.accountId,
    required this.accountLabel,
    required this.accountNo,
    required this.tradeDate,
    required this.openQuantity,
  });

  OrderBookModel copyWith({
    String? id,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
    bool? deleted,
    dynamic idemPotencyId,
    String? marketCode,
    String? secId,
    String? clientId,
    String? instrumentId,
    String? clientCode,
    String? clientLabel,
    String? side,
    String? tif,
    String? orderStatus,
    String? routingStatus,
    String? routingMessage,
    dynamic executionMessage,
    String? orderNo,
    dynamic marketOrderId,
    String? orderDesc,
    num? requestedQty,
    num? filledQty,
    DateTime? requestTime,
    DateTime? expires,
    double? limitPrice,
    String? currency,
    num? numberOfLegs,
    String? assetType,
    dynamic orderStrategy,
    num? consideration,
    num? commission,
    num? fees,
    num? totalValue,
    dynamic faceValue,
    String? notes,
    bool? autoApprove,
    bool? allOrNone,
    bool? contractNoteReversed,
    String? channel,
    String? tradingAccountNo,
    dynamic tradingSubAccountNo,
    dynamic avgCost,
    String? accountId,
    String? accountLabel,
    String? accountNo,
    DateTime? tradeDate,
    num? openQuantity,
  }) {
    return OrderBookModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      idemPotencyId: idemPotencyId ?? this.idemPotencyId,
      marketCode: marketCode ?? this.marketCode,
      secId: secId ?? this.secId,
      clientId: clientId ?? this.clientId,
      instrumentId: instrumentId ?? this.instrumentId,
      clientCode: clientCode ?? this.clientCode,
      clientLabel: clientLabel ?? this.clientLabel,
      side: side ?? this.side,
      tif: tif ?? this.tif,
      orderStatus: orderStatus ?? this.orderStatus,
      routingStatus: routingStatus ?? this.routingStatus,
      routingMessage: routingMessage ?? this.routingMessage,
      executionMessage: executionMessage ?? this.executionMessage,
      orderNo: orderNo ?? this.orderNo,
      marketOrderId: marketOrderId ?? this.marketOrderId,
      orderDesc: orderDesc ?? this.orderDesc,
      requestedQty: requestedQty ?? this.requestedQty,
      filledQty: filledQty ?? this.filledQty,
      requestTime: requestTime ?? this.requestTime,
      expires: expires ?? this.expires,
      limitPrice: limitPrice ?? this.limitPrice,
      currency: currency ?? this.currency,
      numberOfLegs: numberOfLegs ?? this.numberOfLegs,
      assetType: assetType ?? this.assetType,
      orderStrategy: orderStrategy ?? this.orderStrategy,
      consideration: consideration ?? this.consideration,
      commission: commission ?? this.commission,
      fees: fees ?? this.fees,
      totalValue: totalValue ?? this.totalValue,
      faceValue: faceValue ?? this.faceValue,
      notes: notes ?? this.notes,
      autoApprove: autoApprove ?? this.autoApprove,
      allOrNone: allOrNone ?? this.allOrNone,
      contractNoteReversed: contractNoteReversed ?? this.contractNoteReversed,
      channel: channel ?? this.channel,
      tradingAccountNo: tradingAccountNo ?? this.tradingAccountNo,
      tradingSubAccountNo: tradingSubAccountNo ?? this.tradingSubAccountNo,
      avgCost: avgCost ?? this.avgCost,
      accountId: accountId ?? this.accountId,
      accountLabel: accountLabel ?? this.accountLabel,
      accountNo: accountNo ?? this.accountNo,
      tradeDate: tradeDate ?? this.tradeDate,
      openQuantity: openQuantity ?? this.openQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'idemPotencyId': idemPotencyId,
      'marketCode': marketCode,
      'secId': secId,
      'clientId': clientId,
      'instrumentId': instrumentId,
      'clientCode': clientCode,
      'clientLabel': clientLabel,
      'side': side,
      'tif': tif,
      'orderStatus': orderStatus,
      'routingStatus': routingStatus,
      'routingMessage': routingMessage,
      'executionMessage': executionMessage,
      'orderNo': orderNo,
      'marketOrderId': marketOrderId,
      'orderDesc': orderDesc,
      'requestedQty': requestedQty,
      'filledQty': filledQty,
      'requestTime': requestTime.millisecondsSinceEpoch,
      'expires': expires.millisecondsSinceEpoch,
      'limitPrice': limitPrice,
      'currency': currency,
      'numberOfLegs': numberOfLegs,
      'assetType': assetType,
      'orderStrategy': orderStrategy,
      'consideration': consideration,
      'commission': commission,
      'fees': fees,
      'totalValue': totalValue,
      'faceValue': faceValue,
      'notes': notes,
      'autoApprove': autoApprove,
      'allOrNone': allOrNone,
      'contractNoteReversed': contractNoteReversed,
      'channel': channel,
      'tradingAccountNo': tradingAccountNo,
      'tradingSubAccountNo': tradingSubAccountNo,
      'avgCost': avgCost,
      'accountId': accountId,
      'accountLabel': accountLabel,
      'accountNo': accountNo,
      'tradeDate': tradeDate.millisecondsSinceEpoch,
      'openQuantity': openQuantity,
    };
  }

  factory OrderBookModel.fromMap(Map<String, dynamic> map) {
    return OrderBookModel(
      id: map['id'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      idemPotencyId: map['idemPotencyId'] ?? '',
      marketCode: map['marketCode'] ?? '',
      secId: map['secId'] ?? '',
      clientId: map['clientId'] ?? '',
      instrumentId: map['instrumentId'] ?? '',
      clientCode: map['clientCode'] ?? '',
      clientLabel: map['clientLabel'] ?? '',
      side: map['side'] ?? '',
      tif: map['tif'] ?? '',
      orderStatus: map['orderStatus'] ?? '',
      routingStatus: map['routingStatus'] ?? '',
      routingMessage: map['routingMessage'] ?? '',
      executionMessage: map['executionMessage'] ?? '',
      orderNo: map['orderNo'] ?? '',
      marketOrderId: map['marketOrderId'] ?? '',
      orderDesc: map['orderDesc'] ?? '',
      requestedQty: map['requestedQty'] ?? 0,
      filledQty: map['filledQty'] ?? 0,
      requestTime: map['requestTime'] == null
          ? DateTime.now()
          : DateTime.parse(map['requestTime']),
      expires: map['expires'] == null
          ? DateTime.now()
          : DateTime.parse(map['expires']),
      limitPrice: map['limitPrice'] ?? 0,
      currency: map['currency'] ?? '',
      numberOfLegs: map['numberOfLegs'] ?? 0,
      assetType: map['assetType'] ?? '',
      orderStrategy: map['orderStrategy'] ?? '',
      consideration: map['consideration'] ?? 0,
      commission: map['commission'] ?? 0,
      fees: map['fees'] ?? 0,
      totalValue: map['totalValue'] ?? 0,
      faceValue: map['faceValue'] ?? 0,
      notes: map['notes'] ?? '',
      autoApprove: map['autoApprove'] ?? false,
      allOrNone: map['allOrNone'] ?? false,
      contractNoteReversed: map['contractNoteReversed'] ?? false,
      channel: map['channel'] ?? '',
      tradingAccountNo: map['tradingAccountNo'] ?? '',
      tradingSubAccountNo: map['tradingSubAccountNo'] ?? '',
      avgCost: map['avgCost'] ?? 0,
      accountId: map['accountId'] ?? '',
      accountLabel: map['accountLabel'] ?? '',
      accountNo: map['accountNo'] ?? '',
      tradeDate: map['tradeDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['tradeDate']),
      openQuantity: map['openQuantity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderBookModel.fromJson(String source) =>
      OrderBookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant OrderBookModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.idemPotencyId == idemPotencyId &&
        other.marketCode == marketCode &&
        other.secId == secId &&
        other.clientId == clientId &&
        other.instrumentId == instrumentId &&
        other.clientCode == clientCode &&
        other.clientLabel == clientLabel &&
        other.side == side &&
        other.tif == tif &&
        other.orderStatus == orderStatus &&
        other.routingStatus == routingStatus &&
        other.routingMessage == routingMessage &&
        other.executionMessage == executionMessage &&
        other.orderNo == orderNo &&
        other.marketOrderId == marketOrderId &&
        other.orderDesc == orderDesc &&
        other.requestedQty == requestedQty &&
        other.filledQty == filledQty &&
        other.requestTime == requestTime &&
        other.expires == expires &&
        other.limitPrice == limitPrice &&
        other.currency == currency &&
        other.numberOfLegs == numberOfLegs &&
        other.assetType == assetType &&
        other.orderStrategy == orderStrategy &&
        other.consideration == consideration &&
        other.commission == commission &&
        other.fees == fees &&
        other.totalValue == totalValue &&
        other.faceValue == faceValue &&
        other.notes == notes &&
        other.autoApprove == autoApprove &&
        other.allOrNone == allOrNone &&
        other.contractNoteReversed == contractNoteReversed &&
        other.channel == channel &&
        other.tradingAccountNo == tradingAccountNo &&
        other.tradingSubAccountNo == tradingSubAccountNo &&
        other.avgCost == avgCost &&
        other.accountId == accountId &&
        other.accountLabel == accountLabel &&
        other.accountNo == accountNo &&
        other.tradeDate == tradeDate &&
        other.openQuantity == openQuantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        idemPotencyId.hashCode ^
        marketCode.hashCode ^
        secId.hashCode ^
        clientId.hashCode ^
        instrumentId.hashCode ^
        clientCode.hashCode ^
        clientLabel.hashCode ^
        side.hashCode ^
        tif.hashCode ^
        orderStatus.hashCode ^
        routingStatus.hashCode ^
        routingMessage.hashCode ^
        executionMessage.hashCode ^
        orderNo.hashCode ^
        marketOrderId.hashCode ^
        orderDesc.hashCode ^
        requestedQty.hashCode ^
        filledQty.hashCode ^
        requestTime.hashCode ^
        expires.hashCode ^
        limitPrice.hashCode ^
        currency.hashCode ^
        numberOfLegs.hashCode ^
        assetType.hashCode ^
        orderStrategy.hashCode ^
        consideration.hashCode ^
        commission.hashCode ^
        fees.hashCode ^
        totalValue.hashCode ^
        faceValue.hashCode ^
        notes.hashCode ^
        autoApprove.hashCode ^
        allOrNone.hashCode ^
        contractNoteReversed.hashCode ^
        channel.hashCode ^
        tradingAccountNo.hashCode ^
        tradingSubAccountNo.hashCode ^
        avgCost.hashCode ^
        accountId.hashCode ^
        accountLabel.hashCode ^
        accountNo.hashCode ^
        tradeDate.hashCode ^
        openQuantity.hashCode;
  }
}
