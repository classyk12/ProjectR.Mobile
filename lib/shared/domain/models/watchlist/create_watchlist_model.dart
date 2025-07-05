// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateWatchlistModel {
  String? name;
  String? notifyPrice;
  String? condition;
  String? conditionName;
  String? watchlistName;
  CreateWatchlistModel({
    this.name,
    this.notifyPrice,
    this.condition,
    this.conditionName,
    this.watchlistName,
  });

  CreateWatchlistModel copyWith({
    String? name,
    String? notify_price,
    String? condition,
    String? condition_name,
    String? watchlist_name,
  }) {
    return CreateWatchlistModel(
      name: name ?? this.name,
      notifyPrice: notifyPrice ?? notifyPrice,
      condition: condition ?? this.condition,
      conditionName: condition_name ?? conditionName,
      watchlistName: watchlist_name ?? watchlistName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'notify_price': notifyPrice,
      'condition': condition,
      'condition_name': conditionName,
      'watchlist_name': watchlistName,
    };
  }

  factory CreateWatchlistModel.fromMap(Map<String, dynamic> map) {
    return CreateWatchlistModel(
      name: map['name'] != null ? map['name'] as String : null,
      notifyPrice:
          map['notify_price'] != null ? map['notify_price'] as String : null,
      condition: map['condition'] != null ? map['condition'] as String : null,
      conditionName: map['condition_name'] != null
          ? map['condition_name'] as String
          : null,
      watchlistName: map['watchlist_name'] != null
          ? map['watchlist_name'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateWatchlistModel.fromJson(String source) =>
      CreateWatchlistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateWatchlistModel(name: $name, notify_price: $notifyPrice, condition: $condition, condition_name: $conditionName, watchlist_name: $watchlistName)';
  }

  @override
  bool operator ==(covariant CreateWatchlistModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.notifyPrice == notifyPrice &&
        other.condition == condition &&
        other.conditionName == conditionName &&
        other.watchlistName == watchlistName;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        notifyPrice.hashCode ^
        condition.hashCode ^
        conditionName.hashCode ^
        watchlistName.hashCode;
  }
}
