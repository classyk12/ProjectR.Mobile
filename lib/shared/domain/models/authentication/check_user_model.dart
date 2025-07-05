// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAccountsModel {
  String? custId;
  String? fullName;
  UserAccountsModel({
    this.custId,
    this.fullName,
  });

  UserAccountsModel copyWith({
    String? custId,
    String? fullName,
  }) {
    return UserAccountsModel(
      custId: custId ?? this.custId,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CustID': custId,
      'fullName': fullName,
    };
  }

  factory UserAccountsModel.fromMap(Map<String, dynamic> map) {
    return UserAccountsModel(
      custId: map['CustID'] != null ? map['CustID'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccountsModel.fromJson(String source) =>
      UserAccountsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserAccountsModel(CustID: $custId, fullName: $fullName)';

  @override
  bool operator ==(covariant UserAccountsModel other) {
    if (identical(this, other)) return true;

    return other.custId == custId && other.fullName == fullName;
  }

  @override
  int get hashCode => custId.hashCode ^ fullName.hashCode;
}
