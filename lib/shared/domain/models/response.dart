// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BaseResponse {
  final bool status;
  final String? message;
  final dynamic data;

  BaseResponse({
    required this.status,
    this.message,
    required this.data,
  });

  BaseResponse copyWith({
    int? statusCode,
    String? message,
    dynamic data,
  }) {
    return BaseResponse(
      status: status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      status: map['status'] ?? false,
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

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
