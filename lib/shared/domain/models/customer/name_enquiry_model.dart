import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ValidateBankAccountModel {
  String accountNumber;
  String bankCode;
  ValidateBankAccountModel({
    required this.accountNumber,
    required this.bankCode,
  });

  ValidateBankAccountModel copyWith({
    String? accountNumber,
    String? bankCode,
  }) {
    return ValidateBankAccountModel(
      accountNumber: accountNumber ?? this.accountNumber,
      bankCode: bankCode ?? this.bankCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountNumber': accountNumber,
      'bankCode': bankCode,
    };
  }

  @override
  String toString() =>
      'ValidateBankAccountModel(accountNumber: $accountNumber, bankCode: $bankCode)';

  @override
  bool operator ==(covariant ValidateBankAccountModel other) {
    if (identical(this, other)) return true;

    return other.accountNumber == accountNumber && other.bankCode == bankCode;
  }

  @override
  int get hashCode => accountNumber.hashCode ^ bankCode.hashCode;
}

class ValidateAccountModelResponse {
  String? accountNumber;
  int? bankId;
  String? accountName;

  ValidateAccountModelResponse(
      {this.accountName, this.accountNumber, this.bankId});

  factory ValidateAccountModelResponse.fromMap(Map<String, dynamic> map) {
    return ValidateAccountModelResponse(
      accountNumber: map['account_number'] ?? '',
      bankId: map['bank_id'] ?? 0,
      accountName: map['account_name'] ?? '',
    );
  }

  factory ValidateAccountModelResponse.fromJson(String source) =>
      ValidateAccountModelResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
