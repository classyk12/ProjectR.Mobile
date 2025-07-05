// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductTypeDetailModel {
  String accountNumber;
  num balance;
  String destinationAccountNumber;
  ProductTypeDetailModel(
      {required this.accountNumber,
      required this.balance,
      required this.destinationAccountNumber});

  ProductTypeDetailModel copyWith(
      {String? accountNumber, num? balance, String? destinationAccountNumber}) {
    return ProductTypeDetailModel(
        accountNumber: accountNumber ?? this.accountNumber,
        balance: balance ?? this.balance,
        destinationAccountNumber:
            destinationAccountNumber ?? this.destinationAccountNumber);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountNumber': accountNumber,
      'balance': balance,
    };
  }

  factory ProductTypeDetailModel.fromMap(Map<String, dynamic> map) {
    return ProductTypeDetailModel(
        accountNumber: map['accountNumber'] ?? '',
        balance: map['balance'] ?? '',
        destinationAccountNumber: map['accountNumber'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory ProductTypeDetailModel.fromJson(String source) =>
      ProductTypeDetailModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductTypeDetailModel(accountNumber: $accountNumber, balance: $balance)';

  @override
  bool operator ==(covariant ProductTypeDetailModel other) {
    if (identical(this, other)) return true;

    return other.accountNumber == accountNumber && other.balance == balance;
  }

  @override
  int get hashCode => accountNumber.hashCode ^ balance.hashCode;
}
