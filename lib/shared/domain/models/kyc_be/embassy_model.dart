// ignore_for_file: public_member_api_docs, sort_constructors_first

class EmbassyModel {
  int id;
  String name;
  String addressOne;
  String addressTwo;
  String city;
  String state;
  String country;
  EmbassyModel({
    required this.id,
    required this.name,
    required this.addressOne,
    required this.addressTwo,
    required this.city,
    required this.state,
    required this.country,
  });

  EmbassyModel copyWith({
    int? id,
    String? name,
    String? addressOne,
    String? addressTwo,
    String? city,
    String? state,
    String? country,
  }) {
    return EmbassyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      addressOne: addressOne ?? this.addressOne,
      addressTwo: addressTwo ?? this.addressTwo,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'addressOne': addressOne,
      'addressTwo': addressTwo,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory EmbassyModel.fromMap(Map<String, dynamic> map) {
    return EmbassyModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      addressOne: map['addressOne'] ?? '',
      addressTwo: map['addressTwo'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
    );
  }

  factory EmbassyModel.initial() {
    return EmbassyModel(
      id: 0,
      name: '',
      addressOne: '',
      addressTwo: '',
      city: '',
      state: '',
      country: '',
    );
  }

  @override
  bool operator ==(covariant EmbassyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.addressOne == addressOne &&
        other.addressTwo == addressTwo &&
        other.city == city &&
        other.state == state &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        addressOne.hashCode ^
        addressTwo.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode;
  }
}
