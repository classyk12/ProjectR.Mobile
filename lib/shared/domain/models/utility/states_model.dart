import 'dart:convert';

class StatesModel {
  final int id;
  final String name;
  final int countryId;
  final DateTime createDate;
  final DateTime modifyDate;
  StatesModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createDate,
    required this.modifyDate,
  });

  StatesModel copyWith({
    int? id,
    String? name,
    int? countryId,
    DateTime? createDate,
    DateTime? modifyDate,
  }) {
    return StatesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      countryId: countryId ?? this.countryId,
      createDate: createDate ?? this.createDate,
      modifyDate: modifyDate ?? this.modifyDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'countryId': countryId,
      'createDate': createDate.millisecondsSinceEpoch,
      'modifyDate': modifyDate.millisecondsSinceEpoch,
    };
  }

  factory StatesModel.fromMap(Map<String, dynamic> map) {
    return StatesModel(
      id: map['ID'] ?? 0,
      name: map['name'] ?? 0,
      countryId: map['countryID'] ?? 0,
      createDate: map['createDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['createDate']),
      modifyDate: map['modifyDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['modifyDate']),
    );
  }

  factory StatesModel.initial() {
    return StatesModel(
        id: 0,
        name: '',
        countryId: 0,
        createDate: DateTime.now(),
        modifyDate: DateTime.now());
  }

  String toJson() => json.encode(toMap());

  factory StatesModel.fromJson(String source) =>
      StatesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StatesModel(id: $id, name: $name, countryId: $countryId, createDate: $createDate, modifyDate: $modifyDate)';
  }

  @override
  bool operator ==(covariant StatesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.countryId == countryId &&
        other.createDate == createDate &&
        other.modifyDate == modifyDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        countryId.hashCode ^
        createDate.hashCode ^
        modifyDate.hashCode;
  }
}
