// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountryModel {
  final int id;
  final String name;
  final String shortName;
  final String isoName;
  final DateTime createDate;
  final DateTime modifyDate;
  CountryModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.isoName,
    required this.createDate,
    required this.modifyDate,
  });

  CountryModel copyWith({
    int? id,
    String? name,
    String? shortName,
    String? isoName,
    DateTime? createDate,
    DateTime? modifyDate,
  }) {
    return CountryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      isoName: isoName ?? this.isoName,
      createDate: createDate ?? this.createDate,
      modifyDate: modifyDate ?? this.modifyDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'short_name': shortName,
      'iso_name': isoName,
      'createDate': createDate.millisecondsSinceEpoch,
      'modifyDate': modifyDate.millisecondsSinceEpoch,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['ID'] ?? 0,
      name: map['name'] ?? '',
      shortName: map['short_name'] ?? '',
      isoName: map['iso_name'] ?? '',
      createDate: map['createDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['createDate']),
      modifyDate: map['modifyDate'] == null
          ? DateTime.now()
          : DateTime.parse(map['modifyDate']),
    );
  }

  factory CountryModel.initial() {
    return CountryModel(
        id: 0,
        name: '',
        shortName: '',
        isoName: '',
        createDate: DateTime.now(),
        modifyDate: DateTime.now());
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, shortName: $shortName, isoName: $isoName, createDate: $createDate, modifyDate: $modifyDate)';
  }

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.shortName == shortName &&
        other.isoName == isoName &&
        other.createDate == createDate &&
        other.modifyDate == modifyDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        shortName.hashCode ^
        isoName.hashCode ^
        createDate.hashCode ^
        modifyDate.hashCode;
  }
}
