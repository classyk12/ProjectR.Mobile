// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ValidateOrderModel {
  final String accountId;
  final String side;
  final String secId;
  final int requestedQty;
  final double limitPrice;
  final String assetType;
  final String expires;
  final String tif;
  final String notes;
  final String? tradingAccountNo;
  ValidateOrderModel({
    required this.accountId,
    required this.side,
    required this.secId,
    required this.requestedQty,
    required this.limitPrice,
    required this.assetType,
    required this.expires,
    required this.tif,
    required this.notes,
    required this.tradingAccountNo,
  });

  ValidateOrderModel copyWith(
      {String? accountId,
      String? side,
      String? secId,
      int? requestedQty,
      double? limitPrice,
      String? assetType,
      String? expires,
      String? tif,
      String? notes,
      String? tradingAccountNo}) {
    return ValidateOrderModel(
      accountId: accountId ?? this.accountId,
      side: side ?? this.side,
      secId: secId ?? this.secId,
      requestedQty: requestedQty ?? this.requestedQty,
      limitPrice: limitPrice ?? this.limitPrice,
      assetType: assetType ?? this.assetType,
      expires: expires ?? this.expires,
      tif: tif ?? this.tif,
      notes: notes ?? this.notes,
      tradingAccountNo: tradingAccountNo ?? this.tradingAccountNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountId': accountId,
      'side': side,
      'secId': secId,
      'requestedQty': requestedQty,
      'limitPrice': limitPrice == 0 ? null : limitPrice,
      'assetType': assetType,
      'expires': expires.isEmpty ? null : expires,
      'tif': tif,
      'notes': notes,
      'tradingAccountNo': tradingAccountNo,
    };
  }

  factory ValidateOrderModel.fromMap(Map<String, dynamic> map) {
    return ValidateOrderModel(
      accountId: map['accountId'] as String,
      side: map['side'] as String,
      secId: map['secId'] as String,
      requestedQty: map['requestedQty'] as int,
      limitPrice: map['limitPrice'] as double,
      assetType: map['assetType'] as String,
      expires: 'expires',
      tif: map['tif'] as String,
      tradingAccountNo: map['tradingAccountNo'] as String?,
      notes: map['notes'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ValidateOrderModel.fromJson(String source) =>
      ValidateOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ValidateOrderModel(accountId: $accountId, side: $side, secId: $secId, requestedQty: $requestedQty, limitPrice: $limitPrice, assetType: $assetType, expires: $expires, tif: $tif, notes: $notes)';
  }

  @override
  bool operator ==(covariant ValidateOrderModel other) {
    if (identical(this, other)) return true;

    return other.accountId == accountId &&
        other.side == side &&
        other.secId == secId &&
        other.requestedQty == requestedQty &&
        other.limitPrice == limitPrice &&
        other.assetType == assetType &&
        other.expires == expires &&
        other.tif == tif &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        side.hashCode ^
        secId.hashCode ^
        requestedQty.hashCode ^
        limitPrice.hashCode ^
        assetType.hashCode ^
        expires.hashCode ^
        tif.hashCode ^
        notes.hashCode;
  }
}

class ValidateOrderData {
  final dynamic id;

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
  final dynamic routingMessage;
  final dynamic executionMessage;
  final dynamic orderNo;
  final dynamic marketOrderId;
  final String orderDesc;
  final num requestedQty;
  final num filledQty;
  // final DateTime requestTime;
  // final DateTime expires;
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
  // final bool autoApprove;
  // final bool allOrNone;
  final bool contractNoteReversed;
  final String channel;
  final String tradingAccountNo;
  final dynamic tradingSubAccountNo;
  final dynamic avgCost;
  final String accountId;
  final String accountLabel;
  final String accountNo;
  //final DateTime tradeDate;
  final num openQuantity;
  ValidateOrderData({
    required this.id,
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
    // required this.requestTime,
    // required this.expires,
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
    // required this.autoApprove,
    // required this.allOrNone,
    required this.contractNoteReversed,
    required this.channel,
    required this.tradingAccountNo,
    required this.tradingSubAccountNo,
    required this.avgCost,
    required this.accountId,
    required this.accountLabel,
    required this.accountNo,
    // required this.tradeDate,
    required this.openQuantity,
  });

  ValidateOrderData copyWith({
    dynamic id,
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
    dynamic routingMessage,
    dynamic executionMessage,
    dynamic orderNo,
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
    double? commission,
    double? fees,
    double? totalValue,
    dynamic faceValue,
    String? notes,
    // bool? autoApprove,
    // bool? allOrNone,
    bool? contractNoteReversed,
    String? channel,
    String? tradingAccountNo,
    dynamic tradingSubAccountNo,
    dynamic avgCost,
    String? accountId,
    String? accountLabel,
    String? accountNo,
    //DateTime? tradeDate,
    num? openQuantity,
  }) {
    return ValidateOrderData(
      id: id ?? this.id,
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
      // requestTime: requestTime ?? this.requestTime,
      // expires: expires ?? this.expires,
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
      // autoApprove: autoApprove ?? this.autoApprove,
      // allOrNone: allOrNone ?? this.allOrNone,
      contractNoteReversed: contractNoteReversed ?? this.contractNoteReversed,
      channel: channel ?? this.channel,
      tradingAccountNo: tradingAccountNo ?? this.tradingAccountNo,
      tradingSubAccountNo: tradingSubAccountNo ?? this.tradingSubAccountNo,
      avgCost: avgCost ?? this.avgCost,
      accountId: accountId ?? this.accountId,
      accountLabel: accountLabel ?? this.accountLabel,
      accountNo: accountNo ?? this.accountNo,
      //  tradeDate: tradeDate ?? this.tradeDate,
      openQuantity: openQuantity ?? this.openQuantity,
    );
  }

  factory ValidateOrderData.fromMap(Map<String, dynamic> map) {
    return ValidateOrderData(
      id: map['id'] ?? '',
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
      // requestTime:
      //     DateTime.fromMillisecondsSinceEpoch(map['requestTime'] as int),
      // expires: DateTime.fromMillisecondsSinceEpoch(map['expires'] as int),
      limitPrice: map['limitPrice'] ?? 0,
      currency: map['currency'] ?? '',
      numberOfLegs: map['numberOfLegs'] ?? 0,
      assetType: map['assetType'] ?? '',
      orderStrategy: map['orderStrategy'] ?? '',
      consideration: map['consideration'] ?? 0,
      commission: map['commission'] ?? 0,
      fees: map['fees'] ?? 0,
      totalValue: map['totalValue'] ?? 0,
      faceValue: map['faceValue'] ?? '',
      notes: map['notes'] ?? '',
      // allOrNone: map['allOrNone'] ?? false,
      contractNoteReversed: map['contractNoteReversed'] ?? false,
      channel: map['channel'] ?? '',
      tradingAccountNo: map['tradingAccountNo'] ?? '',
      tradingSubAccountNo: map['tradingSubAccountNo'] ?? '',
      avgCost: map['avgCost'] ?? 0,
      accountId: map['accountId'] ?? '',
      accountLabel: map['accountLabel'] ?? '',
      accountNo: map['accountNo'] ?? '',
      //  tradeDate: DateTime.fromMillisecondsSinceEpoch(map['tradeDate'] as int),
      openQuantity: map['openQuantity'] ?? 0,
    );
  }

  factory ValidateOrderData.fromJson(String source) =>
      ValidateOrderData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ValidateOrderData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
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
        // other.requestTime == requestTime &&
        // other.expires == expires &&
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
        // other.autoApprove == autoApprove &&
        // other.allOrNone == allOrNone &&
        other.contractNoteReversed == contractNoteReversed &&
        other.channel == channel &&
        other.tradingAccountNo == tradingAccountNo &&
        other.tradingSubAccountNo == tradingSubAccountNo &&
        other.avgCost == avgCost &&
        other.accountId == accountId &&
        other.accountLabel == accountLabel &&
        other.accountNo == accountNo &&
        // other.tradeDate == tradeDate &&
        other.openQuantity == openQuantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
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
        // requestTime.hashCode ^
        // expires.hashCode ^
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
        // autoApprove.hashCode ^
        // allOrNone.hashCode ^
        contractNoteReversed.hashCode ^
        channel.hashCode ^
        tradingAccountNo.hashCode ^
        tradingSubAccountNo.hashCode ^
        avgCost.hashCode ^
        accountId.hashCode ^
        accountLabel.hashCode ^
        accountNo.hashCode ^
        //tradeDate.hashCode ^
        openQuantity.hashCode;
  }

  factory ValidateOrderData.initial() {
    return ValidateOrderData(
      id: '',
      idemPotencyId: '',
      marketCode: '',
      secId: '',
      clientId: '',
      instrumentId: '',
      clientCode: '',
      clientLabel: '',
      side: '',
      tif: '',
      orderStatus: '',
      routingStatus: '',
      routingMessage: '',
      executionMessage: '',
      orderNo: '',
      marketOrderId: '',
      orderDesc: '',
      requestedQty: 0,
      filledQty: 0,
      // requestTime:
      //     DateTime.fromMillisecondsSinceEpoch(map['requestTime'] as int),
      // expires: DateTime.fromMillisecondsSinceEpoch(map['expires'] as int),
      limitPrice: 0,
      currency: '',
      numberOfLegs: 0,
      assetType: '',
      orderStrategy: '',
      consideration: 0,
      commission: 0,
      fees: 0,
      totalValue: 0,
      faceValue: '',
      notes: '',
      // allOrNone: map['allOrNone'] ?? false,
      contractNoteReversed: false,
      channel: '',
      tradingAccountNo: '',
      tradingSubAccountNo: '',
      avgCost: 0,
      accountId: '',
      accountLabel: '',
      accountNo: '',
      //  tradeDate: DateTime.fromMillisecondsSinceEpoch(map['tradeDate'] as int),
      openQuantity: 0,
    );
  }
}
