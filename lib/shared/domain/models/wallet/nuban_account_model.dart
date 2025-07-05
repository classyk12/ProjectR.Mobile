// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NubanAccountModel {
  final num id;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String accountName;
  final String accountNumber;
  final String customerCode;
  final String bankName;
  final String bankSlug;
  final String bankId;
  final String currency;
  final String description;
  final NubanProduct nubanProduct;
  NubanAccountModel({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.accountName,
    required this.accountNumber,
    required this.customerCode,
    required this.bankName,
    required this.bankSlug,
    required this.bankId,
    required this.currency,
    required this.description,
    required this.nubanProduct,
  });

  NubanAccountModel copyWith({
    num? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? accountName,
    String? accountNumber,
    String? customerCode,
    String? bankName,
    String? bankSlug,
    String? bankId,
    String? currency,
    String? description,
    NubanProduct? nubanProduct,
  }) {
    return NubanAccountModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      customerCode: customerCode ?? this.customerCode,
      bankName: bankName ?? this.bankName,
      bankSlug: bankSlug ?? this.bankSlug,
      bankId: bankId ?? this.bankId,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      nubanProduct: nubanProduct ?? this.nubanProduct,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'accountName': accountName,
      'accountNumber': accountNumber,
      'customerCode': customerCode,
      'bankName': bankName,
      'bankSlug': bankSlug,
      'bankId': bankId,
      'currency': currency,
      'description': description,
      'nubanProduct': nubanProduct.toMap(),
    };
  }

  factory NubanAccountModel.fromMap(Map<String, dynamic> map) {
    return NubanAccountModel(
      id: map['id'] ?? 0,
      updatedAt: map['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['updatedAt']),
      createdAt: map['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['createdAt']),
      accountName: map['accountName'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      customerCode: map['customerCode'] ?? '',
      bankName: map['bankName'] ?? '',
      bankSlug: map['bankSlug'] ?? '',
      bankId: map['bankId'] ?? '',
      currency: map['currency'] ?? '',
      description: map['description'] ?? '',
      nubanProduct: NubanProduct.fromMap(map['nubanProduct']),
    );
  }

  factory NubanAccountModel.initial() {
    return NubanAccountModel(
        id: 0,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        accountName: '',
        accountNumber: '',
        customerCode: '',
        bankName: '',
        bankSlug: '',
        bankId: '',
        currency: '',
        description: '',
        nubanProduct: NubanProduct.initial());
  }

  factory NubanAccountModel.fromJson(String source) =>
      NubanAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant NubanAccountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.accountName == accountName &&
        other.accountNumber == accountNumber &&
        other.customerCode == customerCode &&
        other.bankName == bankName &&
        other.bankSlug == bankSlug &&
        other.bankId == bankId &&
        other.currency == currency &&
        other.description == description &&
        other.nubanProduct == nubanProduct;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        accountName.hashCode ^
        accountNumber.hashCode ^
        customerCode.hashCode ^
        bankName.hashCode ^
        bankSlug.hashCode ^
        bankId.hashCode ^
        currency.hashCode ^
        description.hashCode ^
        nubanProduct.hashCode;
  }
}

class NubanProduct {
  final int id;
  final DateTime updatedAt;
  final DateTime createdAt;

  final String name;
  final String description;
  final String company;
  NubanProduct({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.company,
  });

  NubanProduct copyWith({
    int? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    bool? deleted,
    String? name,
    String? description,
    String? company,
  }) {
    return NubanProduct(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      description: description ?? this.description,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'name': name,
      'description': description,
      'company': company,
    };
  }

  factory NubanProduct.fromMap(Map<String, dynamic> map) {
    return NubanProduct(
      id: map['id'] ?? 0,
      updatedAt: map['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['updatedAt']),
      createdAt: map['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['createdAt']),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      company: map['company'] ?? '',
    );
  }

  factory NubanProduct.initial() {
    return NubanProduct(
      id: 0,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      name: '',
      description: '',
      company: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NubanProduct.fromJson(String source) =>
      NubanProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant NubanProduct other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.name == name &&
        other.description == description &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        name.hashCode ^
        description.hashCode ^
        company.hashCode;
  }
}
