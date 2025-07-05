// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransferFundsModel {
  String sourceType;
  String destinationType;
  String destinationAccountId;
  num amount;
  String sourceAccountId;
  //Mutual Funds subscription Related models
  String? accountId;
  String? businessDate;
  String? fundId;
  num? price;
  num? quantity;

  ///this is used in the case of mutual fund subscription using wallet
  TransferFundsModel(
      {required this.sourceType,
      required this.destinationType,
      required this.destinationAccountId,
      required this.amount,
      required this.sourceAccountId,
      this.accountId,
      this.businessDate,
      this.fundId,
      this.price,
      this.quantity});

  TransferFundsModel copyWith(
      {String? sourceType,
      String? destinationType,
      String? destinationAccountId,
      num? amount,
      String? sourceAccountId,
      String? accountId,
      String? businessDate,
      String? fundId,
      num? price,
      num? quantity}) {
    return TransferFundsModel(
        sourceType: sourceType ?? this.sourceType,
        destinationType: destinationType ?? this.destinationType,
        destinationAccountId: destinationAccountId ?? this.destinationAccountId,
        amount: amount ?? this.amount,
        sourceAccountId: sourceAccountId ?? this.sourceAccountId,
        accountId: accountId ?? this.accountId,
        businessDate: businessDate ?? this.businessDate,
        fundId: fundId ?? this.fundId,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'sourceType': sourceType,
      'destinationType': destinationType,
      'amount': amount,
      'sourceAccountId': sourceAccountId,
    };

    if (destinationAccountId.isNotEmpty) {
      map.addAll({'destinationAccountId': destinationAccountId});
    }

    if (accountId != null && accountId!.isNotEmpty) {
      map.addAll({'accountId': accountId});
    }

    if (businessDate != null && businessDate!.isNotEmpty) {
      map.addAll({'date': businessDate});
    }

    if (fundId != null && fundId!.isNotEmpty) {
      map.addAll({'fund': fundId});
    }

    if (price != null && price! > 0) {
      map.addAll({'price': price});
    }

    if (quantity != null) {
      map.addAll({'quantity': quantity});
    }

    return map;
  }

  factory TransferFundsModel.fromMap(Map<String, dynamic> map) {
    return TransferFundsModel(
      sourceType: map['sourceType'] ?? '',
      destinationType: map['destinationType'] ?? '',
      destinationAccountId: map['destinationAccountId'] ?? '',
      amount: map['amount'] ?? 0,
      sourceAccountId: map['sourceAccountId'] ?? '',
    );
  }

  factory TransferFundsModel.initial() {
    return TransferFundsModel(
        amount: 0,
        destinationType: '',
        destinationAccountId: '',
        sourceAccountId: '',
        sourceType: '');
  }

  factory TransferFundsModel.fromJson(String source) =>
      TransferFundsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransferFundsModel(sourceType: $sourceType, destinationType: $destinationType, destinationAccountId: $destinationAccountId, amount: $amount, sourceAccountId: $sourceAccountId)';
  }

  @override
  bool operator ==(covariant TransferFundsModel other) {
    if (identical(this, other)) return true;

    return other.sourceType == sourceType &&
        other.destinationType == destinationType &&
        other.destinationAccountId == destinationAccountId &&
        other.amount == amount &&
        other.sourceAccountId == sourceAccountId;
  }

  @override
  int get hashCode {
    return sourceType.hashCode ^
        destinationType.hashCode ^
        destinationAccountId.hashCode ^
        amount.hashCode ^
        sourceAccountId.hashCode;
  }
}
