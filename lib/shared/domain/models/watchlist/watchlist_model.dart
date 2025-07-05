// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WatchlistModel {
  int? id;
  // DateTime? updatedAt;
  // DateTime? createdAt;
  bool? deleted;
  bool? suspended;
  String? name;
  String? notifyPrice;
  String? condition;
  String? conditionName;
  bool? status;
  String? watchlistName;
  WatchlistModel({
    this.id,
    // this.updatedAt,
    // this.createdAt,
    this.deleted,
    this.suspended,
    this.name,
    this.notifyPrice,
    this.condition,
    this.conditionName,
    this.status,
    this.watchlistName,
  });

  WatchlistModel copyWith({
    int? id,
    // DateTime? updatedAt,
    // DateTime? createdAt,
    bool? deleted,
    bool? suspended,
    String? name,
    String? notifyPrice,
    String? condition,
    String? conditionName,
    bool? status,
    String? watchlistName,
  }) {
    return WatchlistModel(
      id: id ?? this.id,
      // updatedAt: updatedAt ?? this.updatedAt,
      // createdAt: createdAt ?? this.createdAt,
      deleted: deleted ?? this.deleted,
      suspended: suspended ?? this.suspended,
      name: name ?? this.name,
      notifyPrice: notifyPrice ?? this.notifyPrice,
      condition: condition ?? this.condition,
      conditionName: conditionName ?? this.conditionName,
      status: status ?? this.status,
      watchlistName: watchlistName ?? this.watchlistName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      // 'updatedAt': updatedAt?.millisecondsSinceEpoch,
      // 'createdAt': createdAt?.millisecondsSinceEpoch,
      'deleted': deleted,
      'suspended': suspended,
      'name': name,
      'notifyPrice': notifyPrice,
      'condition': condition,
      'conditionName': conditionName,
      'status': status,
      'watchlistName': watchlistName,
    };
  }

  factory WatchlistModel.fromMap(Map<String, dynamic> map) {
    return WatchlistModel(
      id: map['id'] != null ? map['id'] as int : null,
      // updatedAt: map['updatedAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
      //     : null,
      // createdAt: map['createdAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
      //     : null,
      deleted: map['deleted'] != null ? map['deleted'] as bool : null,
      suspended: map['suspended'] != null ? map['suspended'] as bool : null,
      name: map['name'] != null ? map['name'] as String : null,
      notifyPrice:
          map['notify_price'] != null ? map['notify_price'] as String : null,
      condition: map['condition'] != null ? map['condition'] as String : null,
      conditionName: map['condition_name'] != null
          ? map['condition_name'] as String
          : null,
      status: map['status'] != null ? map['status'] as bool : null,
      watchlistName: map['watchlist_name'] != null
          ? map['watchlist_name'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WatchlistModel.fromJson(String source) =>
      WatchlistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WatchlistModel(id: $id,  deleted: $deleted, suspended: $suspended, name: $name, notifyPrice: $notifyPrice, condition: $condition, conditionName: $conditionName, status: $status, watchlistName: $watchlistName)';
  }

  @override
  bool operator ==(covariant WatchlistModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        // other.updatedAt == updatedAt &&
        // other.createdAt == createdAt &&
        other.deleted == deleted &&
        other.suspended == suspended &&
        other.name == name &&
        other.notifyPrice == notifyPrice &&
        other.condition == condition &&
        other.conditionName == conditionName &&
        other.status == status &&
        other.watchlistName == watchlistName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        // updatedAt.hashCode ^
        // createdAt.hashCode ^
        deleted.hashCode ^
        suspended.hashCode ^
        name.hashCode ^
        notifyPrice.hashCode ^
        condition.hashCode ^
        conditionName.hashCode ^
        status.hashCode ^
        watchlistName.hashCode;
  }
}
