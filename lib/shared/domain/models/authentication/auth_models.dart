// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompleteLoginWithPhoneNumberModel {
  final String? phoneCode;
  final String? phoneNumber;
  final String? otp;
  final String? token;
  final int? type;

  CompleteLoginWithPhoneNumberModel({
    this.phoneCode,
    this.phoneNumber,
    this.otp,
    this.token,
    this.type,
  });

  CompleteLoginWithPhoneNumberModel copyWith({
    String? phoneCode,
    String? phoneNumber,
    String? otp,
    String? token,
    int? type,
  }) =>
      CompleteLoginWithPhoneNumberModel(
        phoneCode: phoneCode ?? this.phoneCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp,
        token: token ?? this.token,
        type: type ?? this.type,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneCode': phoneCode,
      'phoneNumber': phoneNumber,
      'otp': otp,
      'token': token,
      'type': type,
    };
  }
}

class PhoneNumberLoginResponseModel {
  final String? otpToken;
  final DateTime? expiresAt;
  final String? phoneNumber;
  final String? phoneCode;
  final int? type;

  PhoneNumberLoginResponseModel({
    this.otpToken,
    this.expiresAt,
    this.phoneNumber,
    this.phoneCode,
    this.type,
  });

  PhoneNumberLoginResponseModel copyWith({
    String? otpToken,
    DateTime? expiresAt,
    String? phoneNumber,
    String? phoneCode,
    int? type,
  }) =>
      PhoneNumberLoginResponseModel(
        otpToken: otpToken ?? this.otpToken,
        expiresAt: expiresAt ?? this.expiresAt,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        phoneCode: phoneCode ?? this.phoneCode,
        type: type ?? this.type,
      );

  factory PhoneNumberLoginResponseModel.fromMap(Map<String, dynamic> map) {
    return PhoneNumberLoginResponseModel(
      otpToken: map['otpToken'] ?? '',
      expiresAt: map['expiresAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expiresAt'])
          : null,
      phoneNumber: map['phoneNumber'] ?? '',
      phoneCode: map['phoneCode'] ?? ' ',
      type: map['type']?.toInt(),
    );
  }
}

class LoginResponseModel {
  final LoggedInUser? user;
  final String? token;
  final String? refreshToken;
  LoginResponseModel({
    this.user,
    this.token,
    this.refreshToken,
  });

  LoginResponseModel copyWith({
    LoggedInUser? user,
    String? token,
    String? refreshToken,
  }) {
    return LoginResponseModel(
      user: user ?? this.user,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user!.toMap(),
      'refreshToken': refreshToken,
      'authToken': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      user: LoggedInUser.fromMap(map['user']),
      token: map['token'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponseModel(user: $user, token: $token)';

  @override
  bool operator ==(covariant LoginResponseModel other) {
    if (identical(this, other)) return true;

    return other.user == user && other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}

class LoggedInUser {
  String id;
  String phoneNumber;
  String phoneCode;
  String email;
  int accountType;
  int registrationType;
  bool isFirstLogin;

  LoggedInUser({
    required this.id,
    required this.phoneNumber,
    required this.phoneCode,
    required this.email,
    required this.accountType,
    required this.registrationType,
    required this.isFirstLogin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'email': email,
      'accountType': accountType,
      'registrationType': registrationType,
      'isFirstLogin': isFirstLogin,
    };
  }

  factory LoggedInUser.fromMap(Map<String, dynamic> map) {
    return LoggedInUser(
      id: map['id'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      phoneCode: map['phoneCode'] ?? '',
      email: map['email'] ?? '',
      accountType: map['accountType']?.toInt() ?? 0,
      registrationType: map['registrationType']?.toInt() ?? 0,
      isFirstLogin: map['isFirstLogin'] ?? false,
    );
  }
}
