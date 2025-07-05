// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RollingAverageModel {
  final DateTime month;
  final num totalValue;
  RollingAverageModel({
    required this.month,
    required this.totalValue,
  });

  RollingAverageModel copyWith({
    DateTime? month,
    num? totalValue,
  }) {
    return RollingAverageModel(
      month: month ?? this.month,
      totalValue: totalValue ?? this.totalValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MONTH': month.millisecondsSinceEpoch,
      'TOTAL VALUE': totalValue,
    };
  }

  factory RollingAverageModel.fromMap(Map<String, dynamic> map) {
    return RollingAverageModel(
      month:
          map['MONTH'] == null ? DateTime.now() : DateTime.parse(map['MONTH']),
      totalValue: map['TOTAL VALUE'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RollingAverageModel.fromJson(String source) =>
      RollingAverageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RollingAverageModel(month: $month, totalValue: $totalValue)';

  @override
  bool operator ==(covariant RollingAverageModel other) {
    if (identical(this, other)) return true;

    return other.month == month && other.totalValue == totalValue;
  }

  @override
  int get hashCode => month.hashCode ^ totalValue.hashCode;
}
