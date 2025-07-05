// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AssetIndexDataModel {
  final int id;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String stockCode;
  final String price;
  final DateTime date;
  final DateTime lastProcessedDate;
  AssetIndexDataModel({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.stockCode,
    required this.price,
    required this.date,
    required this.lastProcessedDate,
  });

  AssetIndexDataModel copyWith({
    int? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? stockCode,
    String? price,
    DateTime? date,
    DateTime? lastProcessedDate,
  }) {
    return AssetIndexDataModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      stockCode: stockCode ?? this.stockCode,
      price: price ?? this.price,
      date: date ?? this.date,
      lastProcessedDate: lastProcessedDate ?? this.lastProcessedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'stockCode': stockCode,
      'price': price,
      'date': date.millisecondsSinceEpoch,
      'lastProcessedDate': lastProcessedDate.millisecondsSinceEpoch,
    };
  }

  factory AssetIndexDataModel.fromMap(Map<String, dynamic> map) {
    return AssetIndexDataModel(
      id: map['id'] ?? 0,
      updatedAt:
          DateTime.parse(map['updatedAt'] ?? DateTime.now().toIso8601String()),
      createdAt:
          DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      stockCode: map['stockCode'] ?? '',
      price: map['price'] ?? '',
      date: DateTime.parse(map['date'] ?? DateTime.now().toIso8601String()),
      lastProcessedDate: DateTime.parse(
          map['lastProcessedDate'] ?? DateTime.now().toIso8601String()),
    );
  }

  String toJson() => json.encode(toMap());

  factory AssetIndexDataModel.fromJson(String source) =>
      AssetIndexDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AsiIndexModel(id: $id, updatedAt: $updatedAt, createdAt: $createdAt, stockCode: $stockCode, price: $price, date: $date, lastProcessedDate: $lastProcessedDate)';
  }

  @override
  bool operator ==(covariant AssetIndexDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.stockCode == stockCode &&
        other.price == price &&
        other.date == date &&
        other.lastProcessedDate == lastProcessedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        stockCode.hashCode ^
        price.hashCode ^
        date.hashCode ^
        lastProcessedDate.hashCode;
  }
}
