// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class FundSubscriptionModel {
  String accountId;
  num amount;
  String callbackUrl;
  String channel;
  String date;
  String fund;
  num price;
  String productType;
  num quantity;
  String paymentMode;
  String fundName;
  FundSubscriptionModel(
      {required this.accountId,
      required this.amount,
      required this.callbackUrl,
      required this.channel,
      required this.date,
      required this.fund,
      required this.price,
      required this.productType,
      required this.quantity,
      required this.paymentMode,
      required this.fundName});

  FundSubscriptionModel copyWith(
      {String? accountId,
      num? amount,
      String? callbackUrl,
      String? channel,
      String? date,
      String? fund,
      num? price,
      String? productType,
      num? quantity,
      String? paymentMode,
      String? fundName}) {
    return FundSubscriptionModel(
        accountId: accountId ?? this.accountId,
        amount: amount ?? this.amount,
        callbackUrl: callbackUrl ?? this.callbackUrl,
        channel: channel ?? this.channel,
        date: date ?? this.date,
        fund: fund ?? this.fund,
        price: price ?? this.price,
        productType: productType ?? this.productType,
        quantity: quantity ?? this.quantity,
        paymentMode: paymentMode ?? this.paymentMode,
        fundName: fundName ?? this.fundName);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'amount': amount,
      'callback_url': callbackUrl,
      'channel': channel,
      'date': date,
      'fund': fund,
      'price': price,
      'productType': productType,
      'quantity': quantity,
    };

    if (accountId.isNotEmpty) {
      map.addAll({'accountId': accountId});
    }

    return map;
  }

  factory FundSubscriptionModel.fromMap(Map<String, dynamic> map) {
    return FundSubscriptionModel(
        accountId: map['accountId'] as String,
        amount: map['amount'] as int,
        callbackUrl: map['callback_url'] as String,
        channel: map['channel'] as String,
        date: '',
        paymentMode: '',
        fund: map['fund'] as String,
        price: map['price'] as int,
        productType: map['productType'] as String,
        quantity: map['quantity'] as int,
        fundName: '');
  }

  factory FundSubscriptionModel.fromJson(String source) =>
      FundSubscriptionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant FundSubscriptionModel other) {
    if (identical(this, other)) return true;

    return other.accountId == accountId &&
        other.amount == amount &&
        other.callbackUrl == callbackUrl &&
        other.channel == channel &&
        other.date == date &&
        other.fund == fund &&
        other.price == price &&
        other.productType == productType &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        amount.hashCode ^
        callbackUrl.hashCode ^
        channel.hashCode ^
        date.hashCode ^
        fund.hashCode ^
        price.hashCode ^
        productType.hashCode ^
        quantity.hashCode;
  }
}

class DollarFundSubscriptionModel {
  File paymentReceipt;
  String fileName;
  String fund;
  num quantity;
  num amount;
  num price;
  String? accountId;

  DollarFundSubscriptionModel(
      {required this.paymentReceipt,
      required this.fund,
      required this.accountId,
      required this.quantity,
      required this.amount,
      required this.price,
      required this.fileName});

  DollarFundSubscriptionModel copyWith(
      {File? paymentReceipt,
      String? fund,
      String? accountId,
      num? quantity,
      num? amount,
      num? price,
      String? fileName}) {
    return DollarFundSubscriptionModel(
        paymentReceipt: paymentReceipt ?? this.paymentReceipt,
        fund: fund ?? this.fund,
        accountId: accountId ?? this.accountId,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        price: price ?? this.price,
        fileName: fileName ?? this.fileName);
  }
}
