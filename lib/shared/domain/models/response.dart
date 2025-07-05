// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:projectr/shared/domain/models/either.dart';
import 'package:projectr/shared/exceptions/app_exception.dart';

class BaseResponse {
  final int statusCode;
  final String? message;
  final dynamic data;

  BaseResponse({
    required this.statusCode,
    this.message,
    required this.data,
  });
  @override
  String toString() =>
      'BaseResponse(statusCode: $statusCode, message: $message, data: $data)';

  BaseResponse copyWith({
    int? statusCode,
    String? message,
    dynamic data,
  }) {
    return BaseResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      statusCode: map['statusCode'] as int,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(String source) =>
      BaseResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant BaseResponse other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ data.hashCode;
}

extension ResponseExtension on BaseResponse {
  Right<AppException, BaseResponse> get toRight => Right(this);
}
