// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserWithdrawalBankDetails {
  int? id;
  String? updatedAt;
  String? createdAt;
  bool? deleted;
  bool? suspended;
  String? bankCd;
  String? bankAccountName;
  String? bankAccountNo;
  String? bankBranchName;
  String? bankAddressDetails;
  String? bankCode;
  String? swiftCode;
  String? sortCode;
  String? sortCode2;
  String? bankBvnNo;
  String? bvnFirstName;
  String? bvnLastName;
  String? bvnMiddleName;
  String? transferRecipient;
  bool? hasRecipientCode;
  UserWithdrawalBankDetails({
    this.id,
    this.updatedAt,
    this.createdAt,
    this.deleted,
    this.suspended,
    this.bankCd,
    this.bankAccountName,
    this.bankAccountNo,
    this.bankBranchName,
    this.bankAddressDetails,
    this.bankCode,
    this.swiftCode,
    this.sortCode,
    this.sortCode2,
    this.bankBvnNo,
    this.bvnFirstName,
    this.bvnLastName,
    this.bvnMiddleName,
    this.transferRecipient,
    this.hasRecipientCode,
  });

  UserWithdrawalBankDetails copyWith({
    int? id,
    String? updatedAt,
    String? createdAt,
    bool? deleted,
    bool? suspended,
    String? bankCd,
    String? bankAccountName,
    String? bankAccountNo,
    String? bankBranchName,
    String? bankAddressDetails,
    String? bankCode,
    String? swiftCode,
    String? sortCode,
    String? sortCode2,
    String? bankBvnNo,
    String? bvnFirstName,
    String? bvnLastName,
    String? bvnMiddleName,
    String? transferRecipient,
    bool? hasRecipientCode,
  }) {
    return UserWithdrawalBankDetails(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      deleted: deleted ?? this.deleted,
      suspended: suspended ?? this.suspended,
      bankCd: bankCd ?? this.bankCd,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankAccountNo: bankAccountNo ?? this.bankAccountNo,
      bankBranchName: bankBranchName ?? this.bankBranchName,
      bankAddressDetails: bankAddressDetails ?? this.bankAddressDetails,
      bankCode: bankCode ?? this.bankCode,
      swiftCode: swiftCode ?? this.swiftCode,
      sortCode: sortCode ?? this.sortCode,
      sortCode2: sortCode2 ?? this.sortCode2,
      bankBvnNo: bankBvnNo ?? this.bankBvnNo,
      bvnFirstName: bvnFirstName ?? this.bvnFirstName,
      bvnLastName: bvnLastName ?? this.bvnLastName,
      bvnMiddleName: bvnMiddleName ?? this.bvnMiddleName,
      transferRecipient: transferRecipient ?? this.transferRecipient,
      hasRecipientCode: hasRecipientCode ?? this.hasRecipientCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'deleted': deleted,
      'suspended': suspended,
      'bankCd': bankCd,
      'bankAccountName': bankAccountName,
      'bankAccountNo': bankAccountNo,
      'bankBranchName': bankBranchName,
      'bankAddressDetails': bankAddressDetails,
      'bankCode': bankCode,
      'swiftCode': swiftCode,
      'sortCode': sortCode,
      'sortCode2': sortCode2,
      'bankBvnNo': bankBvnNo,
      'bvnFirstName': bvnFirstName,
      'bvnLastName': bvnLastName,
      'bvnMiddleName': bvnMiddleName,
      'transferRecipient': transferRecipient,
      'hasRecipientCode': hasRecipientCode,
    };
  }

  factory UserWithdrawalBankDetails.fromMap(Map<String, dynamic> map) {
    return UserWithdrawalBankDetails(
      id: map['id'] != null ? map['id'] as int : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      deleted: map['deleted'] != null ? map['deleted'] as bool : null,
      suspended: map['suspended'] != null ? map['suspended'] as bool : null,
      bankCd: map['bank_cd'] != null ? map['bank_cd'] as String : null,
      bankAccountName: map['bank_account_name'] != null
          ? map['bank_account_name'] as String
          : null,
      bankAccountNo: map['bank_account_no'] != null
          ? map['bank_account_no'] as String
          : null,
      bankBranchName: map['bank_branch_name'] != null
          ? map['bank_branch_name'] as String
          : null,
      bankAddressDetails: map['bank_address_details'] != null
          ? map['bank_address_details'] as String
          : null,
      bankCode: map['bank_code'] != null ? map['bank_code'] as String : null,
      swiftCode: map['swift_code'] != null ? map['swift_code'] as String : null,
      sortCode: map['sort_code'] != null ? map['sort_code'] as String : null,
      sortCode2: map['sort_code2'] != null ? map['sort_code2'] as String : null,
      bankBvnNo:
          map['bank_bvn_no'] != null ? map['bank_bvn_no'] as String : null,
      bvnFirstName: map['bvn_first_name'] != null
          ? map['bvn_first_name'] as String
          : null,
      bvnLastName:
          map['bvn_last_name'] != null ? map['bvn_last_name'] as String : null,
      bvnMiddleName: map['bvn_middle_name'] != null
          ? map['bvn_middle_name'] as String
          : null,
      transferRecipient: map['transfer_recipient'] != null
          ? map['transfer_recipient'] as String
          : null,
      hasRecipientCode: map['has_recipient_code'] != null
          ? map['has_recipient_code'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserWithdrawalBankDetails.fromJson(String source) =>
      UserWithdrawalBankDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserWithdrawalBankDetails(id: $id, updatedAt: $updatedAt, createdAt: $createdAt, deleted: $deleted, suspended: $suspended, bankCd: $bankCd, bankAccountName: $bankAccountName, bankAccountNo: $bankAccountNo, bankBranchName: $bankBranchName, bankAddressDetails: $bankAddressDetails, bankCode: $bankCode, swiftCode: $swiftCode, sortCode: $sortCode, sortCode2: $sortCode2, bankBvnNo: $bankBvnNo, bvnFirstName: $bvnFirstName, bvnLastName: $bvnLastName, bvnMiddleName: $bvnMiddleName, transferRecipient: $transferRecipient, hasRecipientCode: $hasRecipientCode)';
  }

  @override
  bool operator ==(covariant UserWithdrawalBankDetails other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.deleted == deleted &&
        other.suspended == suspended &&
        other.bankCd == bankCd &&
        other.bankAccountName == bankAccountName &&
        other.bankAccountNo == bankAccountNo &&
        other.bankBranchName == bankBranchName &&
        other.bankAddressDetails == bankAddressDetails &&
        other.bankCode == bankCode &&
        other.swiftCode == swiftCode &&
        other.sortCode == sortCode &&
        other.sortCode2 == sortCode2 &&
        other.bankBvnNo == bankBvnNo &&
        other.bvnFirstName == bvnFirstName &&
        other.bvnLastName == bvnLastName &&
        other.bvnMiddleName == bvnMiddleName &&
        other.transferRecipient == transferRecipient &&
        other.hasRecipientCode == hasRecipientCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        deleted.hashCode ^
        suspended.hashCode ^
        bankCd.hashCode ^
        bankAccountName.hashCode ^
        bankAccountNo.hashCode ^
        bankBranchName.hashCode ^
        bankAddressDetails.hashCode ^
        bankCode.hashCode ^
        swiftCode.hashCode ^
        sortCode.hashCode ^
        sortCode2.hashCode ^
        bankBvnNo.hashCode ^
        bvnFirstName.hashCode ^
        bvnLastName.hashCode ^
        bvnMiddleName.hashCode ^
        transferRecipient.hashCode ^
        hasRecipientCode.hashCode;
  }
}
