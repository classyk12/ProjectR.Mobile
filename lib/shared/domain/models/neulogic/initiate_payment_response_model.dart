// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InitiatePaymentResponseData {
  String authorizationUrl;
  String accessCode;
  String reference;
  InitiatePaymentResponseData({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });

  InitiatePaymentResponseData copyWith({
    String? authorizationUrl,
    String? accessCode,
    String? reference,
  }) {
    return InitiatePaymentResponseData(
      authorizationUrl: authorizationUrl ?? this.authorizationUrl,
      accessCode: accessCode ?? this.accessCode,
      reference: reference ?? this.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authorization_url': authorizationUrl,
      'accessCode': accessCode,
      'reference': reference,
    };
  }

  factory InitiatePaymentResponseData.fromMap(Map<String, dynamic> map) {
    return InitiatePaymentResponseData(
      authorizationUrl: map['authorization_url'] ?? '',
      accessCode: map['access_code'] ?? '',
      reference: map['reference'] ?? '',
    );
  }

  factory InitiatePaymentResponseData.initial() {
    return InitiatePaymentResponseData(
      authorizationUrl: '',
      accessCode: '',
      reference: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InitiatePaymentResponseData.fromJson(String source) =>
      InitiatePaymentResponseData.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'InitiatePaymentResponseData(authorizationUrl: $authorizationUrl, accessCode: $accessCode, reference: $reference)';

  @override
  bool operator ==(covariant InitiatePaymentResponseData other) {
    if (identical(this, other)) return true;

    return other.authorizationUrl == authorizationUrl &&
        other.accessCode == accessCode &&
        other.reference == reference;
  }

  @override
  int get hashCode =>
      authorizationUrl.hashCode ^ accessCode.hashCode ^ reference.hashCode;
}
