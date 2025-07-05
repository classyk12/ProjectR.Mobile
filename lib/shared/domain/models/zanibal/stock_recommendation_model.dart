// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StockRecommendationModel {
  final int id;
  final String company;
  final String recommendation;
  final String targetPrice;
  final String dividendYield;
  final String pCapital;
  final String aReturnOnEquity;
  final num currentPrice;
  final dynamic admin;
  final DateTime createdDate;
  final DateTime modifiedDate;
  StockRecommendationModel({
    required this.id,
    required this.company,
    required this.recommendation,
    required this.targetPrice,
    required this.dividendYield,
    required this.pCapital,
    required this.aReturnOnEquity,
    required this.admin,
    required this.currentPrice,
    required this.createdDate,
    required this.modifiedDate,
  });

  StockRecommendationModel copyWith({
    int? id,
    String? company,
    String? recommendation,
    String? targetPrice,
    String? dividendYield,
    String? pCapital,
    String? aReturnOnEquity,
    num? currentPrice,
    dynamic admin,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return StockRecommendationModel(
      id: id ?? this.id,
      company: company ?? this.company,
      recommendation: recommendation ?? this.recommendation,
      targetPrice: targetPrice ?? this.targetPrice,
      dividendYield: dividendYield ?? this.dividendYield,
      pCapital: pCapital ?? this.pCapital,
      aReturnOnEquity: aReturnOnEquity ?? this.aReturnOnEquity,
      currentPrice: currentPrice ?? this.currentPrice,
      admin: admin ?? this.admin,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'company': company,
      'recommendation': recommendation,
      'targetPrice': targetPrice,
      'dividendYield': dividendYield,
      'pCapital': pCapital,
      'aReturnOnEquity': aReturnOnEquity,
      'admin': admin,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'currentPrice': currentPrice,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch,
    };
  }

  factory StockRecommendationModel.fromMap(Map<String, dynamic> map) {
    return StockRecommendationModel(
        id: map['id'] ?? 0,
        company: map['company'] ?? '',
        recommendation: map['recommendation'] ?? '',
        targetPrice: map['targetPrice'] ?? '',
        dividendYield: map['dividendYield'] ?? '',
        pCapital: map['pCapital'] ?? '',
        aReturnOnEquity: map['aReturnOnEquity'] ?? '',
        currentPrice: map['currentPrice'] ?? 0,
        admin: map['admin'] as dynamic,
        createdDate: map['createdDate'] == null
            ? DateTime.now()
            : DateTime.parse(map['createdDate']),
        modifiedDate: map['modifiedDate'] == null
            ? DateTime.now()
            : DateTime.parse(
                map['modifiedDate'],
              ));
  }

  String toJson() => json.encode(toMap());

  factory StockRecommendationModel.fromJson(String source) =>
      StockRecommendationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StockRecommendationModel(id: $id, company: $company, recommendation: $recommendation, targetPrice: $targetPrice, dividendYield: $dividendYield, pCapital: $pCapital, aReturnOnEquity: $aReturnOnEquity, admin: $admin, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(covariant StockRecommendationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.company == company &&
        other.recommendation == recommendation &&
        other.targetPrice == targetPrice &&
        other.dividendYield == dividendYield &&
        other.pCapital == pCapital &&
        other.aReturnOnEquity == aReturnOnEquity &&
        other.admin == admin &&
        other.createdDate == createdDate &&
        other.modifiedDate == modifiedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        company.hashCode ^
        recommendation.hashCode ^
        targetPrice.hashCode ^
        dividendYield.hashCode ^
        pCapital.hashCode ^
        aReturnOnEquity.hashCode ^
        admin.hashCode ^
        createdDate.hashCode ^
        modifiedDate.hashCode;
  }
}
