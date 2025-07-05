// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FavouriteModel {
  final int id;
  final DateTime updatedAt;
  final DateTime createdAt;
  final bool deleted;
  final bool suspended;
  final String clientId;
  final String symbol;
  FavouriteModel({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.deleted,
    required this.suspended,
    required this.clientId,
    required this.symbol,
  });

  FavouriteModel copyWith({
    int? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    bool? deleted,
    bool? suspended,
    String? clientId,
    String? symbol,
  }) {
    return FavouriteModel(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      deleted: deleted ?? this.deleted,
      suspended: suspended ?? this.suspended,
      clientId: clientId ?? this.clientId,
      symbol: symbol ?? this.symbol,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'deleted': deleted,
      'suspended': suspended,
      'clientId': clientId,
      'symbol': symbol,
    };
  }

  factory FavouriteModel.fromMap(Map<String, dynamic> map) {
    return FavouriteModel(
      id: map['id'] ?? 0,
      updatedAt: map['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['updatedAt']),
      createdAt: map['createdAt'] == null
          ? DateTime.now()
          : DateTime.parse(map['createdAt']),
      deleted: map['deleted'] ?? false,
      suspended: map['suspended'] ?? false,
      clientId: map['clientId'] ?? '',
      symbol: map['symbol'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteModel.fromJson(String source) =>
      FavouriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant FavouriteModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        other.deleted == deleted &&
        other.suspended == suspended &&
        other.clientId == clientId &&
        other.symbol == symbol;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        deleted.hashCode ^
        suspended.hashCode ^
        clientId.hashCode ^
        symbol.hashCode;
  }
}
