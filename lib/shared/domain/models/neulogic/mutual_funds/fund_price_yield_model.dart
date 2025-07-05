// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MutualFundPriceYieldModel {
  num id;
  DateTime updatedAt;
  DateTime createdAt;
  bool deleted;
  bool suspended;
  String fundCode;
  String fundDescription;
  String openPrice;
  String currentPrice;
  String distribution;
  DateTime openingDate;
  DateTime currentDate;
  num accrualDays;
  num dayBasis;
  String annualisedReturn;
  MutualFundPriceYieldModel({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.deleted,
    required this.suspended,
    required this.fundCode,
    required this.fundDescription,
    required this.openPrice,
    required this.currentPrice,
    required this.distribution,
    required this.openingDate,
    required this.currentDate,
    required this.accrualDays,
    required this.dayBasis,
    required this.annualisedReturn,
  });

  MutualFundPriceYieldModel copyWith({
    num? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    bool? deleted,
    bool? suspended,
    String? fundCode,
    String? fundDescription,
    String? openPrice,
    String? currentPrice,
    String? distribution,
    DateTime? openingDate,
    DateTime? currentDate,
    num? accrualDays,
    num? dayBasis,
    String? annualisedReturn,
  }) {
    return MutualFundPriceYieldModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      deleted: deleted ?? this.deleted,
      suspended: suspended ?? this.suspended,
      fundCode: fundCode ?? this.fundCode,
      fundDescription: fundDescription ?? this.fundDescription,
      openPrice: openPrice ?? this.openPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      distribution: distribution ?? this.distribution,
      openingDate: openingDate ?? this.openingDate,
      currentDate: currentDate ?? this.currentDate,
      accrualDays: accrualDays ?? this.accrualDays,
      dayBasis: dayBasis ?? this.dayBasis,
      annualisedReturn: annualisedReturn ?? this.annualisedReturn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'deleted': deleted,
      'suspended': suspended,
      'fundCode': fundCode,
      'fundDescription': fundDescription,
      'openPrice': openPrice,
      'currentPrice': currentPrice,
      'distribution': distribution,
      'openingDate': openingDate.millisecondsSinceEpoch,
      'currentDate': currentDate.millisecondsSinceEpoch,
      'accrualDays': accrualDays,
      'dayBasis': dayBasis,
      'annualisedReturn': annualisedReturn,
    };
  }

  factory MutualFundPriceYieldModel.fromMap(Map<String, dynamic> map) {
    return MutualFundPriceYieldModel(
      id: map['id'] ?? 0,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : DateTime.now(),
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      deleted: map['deleted'] ?? false,
      suspended: map['suspended'] ?? false,
      fundCode: map['fundCode'] ?? '',
      fundDescription: map['fundDescription'] ?? '',
      openPrice: map['openPrice'] ?? '0.00',
      currentPrice: map['currentPrice'] ?? '',
      distribution: map['distribution'] ?? '',
      openingDate: map['openingDate'] != null
          ? DateTime.parse(map['openingDate'])
          : DateTime.now(),
      currentDate: map['currentDate'] != null
          ? DateTime.parse(map['currentDate'])
          : DateTime.now(),
      accrualDays: map['accrualDays'] ?? 0,
      dayBasis: map['dayBasis'] ?? 0,
      annualisedReturn: map['annualisedReturn'] ?? '',
    );
  }

  factory MutualFundPriceYieldModel.initial() {
    return MutualFundPriceYieldModel(
      id: 0,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      deleted: false,
      suspended: false,
      fundCode: '',
      fundDescription: '',
      openPrice: '',
      currentPrice: '',
      distribution: '',
      openingDate: DateTime.now(),
      currentDate: DateTime.now(),
      accrualDays: 0,
      dayBasis: 0,
      annualisedReturn: '0.00',
    );
  }

  factory MutualFundPriceYieldModel.fromJson(String source) =>
      MutualFundPriceYieldModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant MutualFundPriceYieldModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.deleted == deleted &&
        other.suspended == suspended &&
        other.fundCode == fundCode &&
        other.fundDescription == fundDescription &&
        other.openPrice == openPrice &&
        other.currentPrice == currentPrice &&
        other.distribution == distribution &&
        other.openingDate == openingDate &&
        other.currentDate == currentDate &&
        other.accrualDays == accrualDays &&
        other.dayBasis == dayBasis &&
        other.annualisedReturn == annualisedReturn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        deleted.hashCode ^
        suspended.hashCode ^
        fundCode.hashCode ^
        fundDescription.hashCode ^
        openPrice.hashCode ^
        currentPrice.hashCode ^
        distribution.hashCode ^
        openingDate.hashCode ^
        currentDate.hashCode ^
        accrualDays.hashCode ^
        dayBasis.hashCode ^
        annualisedReturn.hashCode;
  }
}
