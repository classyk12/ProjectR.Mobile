// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

///Bvn verification Request Model
class VerifyBvnRequestModel extends Equatable {
  final String firstName;
  final String lastName;
  final int bvnNumber;
  final String dob;
  const VerifyBvnRequestModel({
    required this.firstName,
    required this.lastName,
    required this.bvnNumber,
    required this.dob,
  });

  @override
  List<Object> get props => [firstName, lastName, bvnNumber, dob];

  VerifyBvnRequestModel copyWith({
    String? firstName,
    String? lastName,
    int? bvnNumber,
    String? dob,
  }) {
    return VerifyBvnRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bvnNumber: bvnNumber ?? this.bvnNumber,
      dob: dob ?? this.dob,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'bvnNumber': bvnNumber,
      'dob': dob,
    };
  }

  factory VerifyBvnRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyBvnRequestModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      bvnNumber: map['bvnNumber'] as int,
      dob: map['dob'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyBvnRequestModel.fromJson(String source) =>
      VerifyBvnRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
