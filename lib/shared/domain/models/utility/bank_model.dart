// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BankModel {
  final int id;
  final String bankName;
  final String bankName1;
  final String bankName2;
  final String bankCode;
  final String sortCode;
  final String iCode;
  final DateTime createDate;
  final DateTime modifiedDate;
  BankModel({
    required this.id,
    required this.bankName,
    required this.bankName1,
    required this.bankName2,
    required this.bankCode,
    required this.sortCode,
    required this.iCode,
    required this.createDate,
    required this.modifiedDate,
  });

  BankModel copyWith({
    int? id,
    String? bankName,
    String? bankName1,
    String? bankName2,
    String? bankCode,
    String? sortCode,
    String? iCode,
    DateTime? createDate,
    DateTime? modifiedDate,
  }) {
    return BankModel(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      bankName1: bankName1 ?? this.bankName1,
      bankName2: bankName2 ?? this.bankName2,
      bankCode: bankCode ?? this.bankCode,
      sortCode: sortCode ?? this.sortCode,
      iCode: iCode ?? this.iCode,
      createDate: createDate ?? this.createDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bankName': bankName,
      'bankName1': bankName1,
      'bankName2': bankName2,
      'bankCode': bankCode,
      'sortCode': sortCode,
      'iCode': iCode,
      'createDate': createDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch,
    };
  }

  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      id: map['ID'] ?? 0,
      bankName: map['bankName'] ?? '',
      bankName1: map['bankName1'] ?? '',
      bankName2: map['bankName2'] ?? '',
      bankCode: map['bankCode'] ?? '',
      sortCode: map['sortCode'] ?? '',
      iCode: map['iCode'] ?? '',
      createDate:
          DateTime.parse(map['createDate'] ?? DateTime.now().toIso8601String()),
      modifiedDate: DateTime.parse(
          map['modifiedDate'] ?? DateTime.now().toIso8601String()),
    );
  }

  String toJson() => json.encode(toMap());

  factory BankModel.fromJson(String source) =>
      BankModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BankModel(id: $id, bankName: $bankName, bankName1: $bankName1, bankName2: $bankName2, bankCode: $bankCode, sortCode: $sortCode, iCode: $iCode, createDate: $createDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(covariant BankModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bankName == bankName &&
        other.bankName1 == bankName1 &&
        other.bankName2 == bankName2 &&
        other.bankCode == bankCode &&
        other.sortCode == sortCode &&
        other.iCode == iCode &&
        other.createDate == createDate &&
        other.modifiedDate == modifiedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bankName.hashCode ^
        bankName1.hashCode ^
        bankName2.hashCode ^
        bankCode.hashCode ^
        sortCode.hashCode ^
        iCode.hashCode ^
        createDate.hashCode ^
        modifiedDate.hashCode;
  }
}
