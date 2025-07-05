// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class KycStatusModel {
  String? currentTier;
  KycStatusModel({
    this.currentTier,
  });

  KycStatusModel copyWith({
    String? currentTier,
  }) {
    return KycStatusModel(
      currentTier: currentTier ?? this.currentTier,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTier': currentTier,
    };
  }

  factory KycStatusModel.fromMap(Map<String, dynamic> map) {
    return KycStatusModel(
      currentTier:
          map['currentTier'] != null ? map['currentTier'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KycStatusModel.fromJson(String source) =>
      KycStatusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KycStatusModel(currentTier: $currentTier)';

  @override
  bool operator ==(covariant KycStatusModel other) {
    if (identical(this, other)) return true;

    return other.currentTier == currentTier;
  }

  @override
  int get hashCode => currentTier.hashCode;
}

class TierTwoUpdateModel {
  File? address;
  File? passportPhotograph;
  File? signature;
  String? addressFileName;
  String? passportPhotographFileName;
  String? signatureFileName;

  TierTwoUpdateModel({
    required this.address,
    required this.passportPhotograph,
    required this.signature,
    required this.addressFileName,
    required this.passportPhotographFileName,
    required this.signatureFileName,
  });

  TierTwoUpdateModel copyWith({
    File? address,
    File? passportPhotograph,
    File? signature,
    String? addressFileName,
    String? passportPhotographFileName,
    String? signatureFileName,
  }) {
    return TierTwoUpdateModel(
      address: address ?? this.address,
      passportPhotograph: passportPhotograph ?? this.passportPhotograph,
      signature: signature ?? this.signature,
      addressFileName: addressFileName ?? this.addressFileName,
      passportPhotographFileName:
          passportPhotographFileName ?? this.passportPhotographFileName,
      signatureFileName: signatureFileName ?? this.signatureFileName,
    );
  }
}
