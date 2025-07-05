// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InitiatePaymentModel {
  num amount;
  String email;
  String accountId;
  String channel;
  String callbackUrl;
  String productType;
  InitiatePaymentModel({
    required this.amount,
    required this.email,
    required this.accountId,
    required this.channel,
    required this.callbackUrl,
    required this.productType,
  });

  InitiatePaymentModel copyWith({
    num? amount,
    String? email,
    String? accountId,
    String? channel,
    String? callbackUrl,
    String? productType,
  }) {
    return InitiatePaymentModel(
      amount: amount ?? this.amount,
      email: email ?? this.email,
      accountId: accountId ?? this.accountId,
      channel: channel ?? this.channel,
      callbackUrl: callbackUrl ?? this.callbackUrl,
      productType: productType ?? this.productType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'email': email,
      'accountId': accountId,
      'channel': channel.toLowerCase(),
      'callback_url': callbackUrl,
      'productType': productType,
    };
  }

  factory InitiatePaymentModel.fromMap(Map<String, dynamic> map) {
    return InitiatePaymentModel(
      amount: map['amount'] as num,
      email: map['email'] as String,
      accountId: map['accountId'] as String,
      channel: map['channel'] as String,
      callbackUrl: map['callbackUrl'] as String,
      productType: map['productType'] as String,
    );
  }

  factory InitiatePaymentModel.initial() {
    return InitiatePaymentModel(
        amount: 0,
        email: '',
        accountId: '',
        channel: '',
        callbackUrl: '',
        productType: '');
  }

  String toJson() => json.encode(toMap());

  factory InitiatePaymentModel.fromJson(String source) =>
      InitiatePaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InitiatePaymentModel(amount: $amount, email: $email, accountId: $accountId, channel: $channel, callbackUrl: $callbackUrl, productType: $productType)';
  }

  @override
  bool operator ==(covariant InitiatePaymentModel other) {
    if (identical(this, other)) return true;

    return other.amount == amount &&
        other.email == email &&
        other.accountId == accountId &&
        other.channel == channel &&
        other.callbackUrl == callbackUrl &&
        other.productType == productType;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
        email.hashCode ^
        accountId.hashCode ^
        channel.hashCode ^
        callbackUrl.hashCode ^
        productType.hashCode;
  }
}
