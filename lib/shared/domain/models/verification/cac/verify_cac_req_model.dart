// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VerifyCacRequestModel extends Equatable {
  final String companyName;
  final String regNumber;
  final String registrationDate;
  const VerifyCacRequestModel({
    required this.companyName,
    required this.regNumber,
    required this.registrationDate,
  });

  @override
  List<Object> get props => [companyName, regNumber, registrationDate];

  VerifyCacRequestModel copyWith({
    String? companyName,
    String? regNumber,
    String? registrationDate,
  }) {
    return VerifyCacRequestModel(
      companyName: companyName ?? this.companyName,
      regNumber: regNumber ?? this.regNumber,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'regNumber': regNumber,
      'registrationDate': registrationDate,
    };
  }

  factory VerifyCacRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyCacRequestModel(
      companyName: map['companyName'] as String,
      regNumber: map['regNumber'] as String,
      registrationDate: map['registrationDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyCacRequestModel.fromJson(String source) =>
      VerifyCacRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
