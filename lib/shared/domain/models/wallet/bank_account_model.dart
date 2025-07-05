class BankAccountModel {
  int id;
  DateTime updatedAt;
  DateTime createdAt;
  bool deleted;
  bool suspended;
  dynamic bankCd;
  String bankAccountName;
  String bankAccountNo;
  String bankBranchName;
  dynamic bankAddressDetails;
  String bankCode;
  dynamic swiftCode;
  String sortCode;
  String sortCode2;
  String bankBvnNo;
  String bvnFirstName;
  String bvnLastName;
  dynamic bvnMiddleName;
  dynamic transferRecipient;
  bool hasRecipientCode;

  BankAccountModel({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.deleted,
    required this.suspended,
    required this.bankCd,
    required this.bankAccountName,
    required this.bankAccountNo,
    required this.bankBranchName,
    required this.bankAddressDetails,
    required this.bankCode,
    required this.swiftCode,
    required this.sortCode,
    required this.sortCode2,
    required this.bankBvnNo,
    required this.bvnFirstName,
    required this.bvnLastName,
    required this.bvnMiddleName,
    required this.transferRecipient,
    required this.hasRecipientCode,
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      BankAccountModel(
        id: json["id"] ?? 0,
        updatedAt: json['updatedAt'] == null
            ? DateTime.now()
            : DateTime.parse(json['updatedAt']),
        createdAt: json['createdAt'] == null
            ? DateTime.now()
            : DateTime.parse(json['createdAt']),
        deleted: json["deleted"] ?? false,
        suspended: json["suspended"] ?? false,
        bankCd: json["bank_cd"] ?? '',
        bankAccountName: json["bank_account_name"] ?? '',
        bankAccountNo: json["bank_account_no"] ?? '',
        bankBranchName: json["bank_branch_name"] ?? '',
        bankAddressDetails: json["bank_address_details"] ?? '',
        bankCode: json["bank_code"] ?? '',
        swiftCode: json["swift_code"] ?? '',
        sortCode: json["sort_code"] ?? '',
        sortCode2: json["sort_code2"] ?? '',
        bankBvnNo: json["bank_bvn_no"] ?? '',
        bvnFirstName: json["bvn_first_name"] ?? '',
        bvnLastName: json["bvn_last_name"] ?? '',
        bvnMiddleName: json["bvn_middle_name"] ?? '',
        transferRecipient: json["transferRecipient"] ?? '',
        hasRecipientCode: json["has_recipient_code"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "deleted": deleted,
        "suspended": suspended,
        "bank_cd": bankCd,
        "bank_account_name": bankAccountName,
        "bank_account_no": bankAccountNo,
        "bank_branch_name": bankBranchName,
        "bank_address_details": bankAddressDetails,
        "bank_code": bankCode,
        "swift_code": swiftCode,
        "sort_code": sortCode,
        "sort_code2": sortCode2,
        "bank_bvn_no": bankBvnNo,
        "bvn_first_name": bvnFirstName,
        "bvn_last_name": bvnLastName,
        "bvn_middle_name": bvnMiddleName,
        "transferRecipient": transferRecipient,
        "has_recipient_code": hasRecipientCode,
      };
}
