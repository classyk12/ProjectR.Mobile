import 'package:equatable/equatable.dart';

///Bvn verification Request Model
class VerifyIdDocumentModel extends Equatable {
  final String firstName;
  final String lastName;
  final String docId;
  final String dob;
  final String docType;
  const VerifyIdDocumentModel({
    required this.firstName,
    required this.lastName,
    required this.docId,
    required this.docType,
    required this.dob,
  });

  @override
  List<Object> get props => [firstName, lastName, docId, docType, dob];

  VerifyIdDocumentModel copyWith(
      {String? firstName,
      String? lastName,
      String? docId,
      String? dob,
      String? docType}) {
    return VerifyIdDocumentModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      docId: docId ?? this.docId,
      docType: docType ?? this.docType,
      dob: dob ?? this.dob,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'docId': docId,
      'docType': docType,
      'dob': dob,
    };
  }

  @override
  bool get stringify => true;
}
