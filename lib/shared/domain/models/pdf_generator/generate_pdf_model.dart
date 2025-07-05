// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:projectr/shared/domain/models/kyc_be/embassy_model.dart';
import 'package:flutter/foundation.dart';

import 'package:projectr/shared/domain/models/authentication/login_model.dart';
import 'package:projectr/shared/domain/models/zanibal/investment_account_model.dart';

class GenerateReportModel {
  List<InvestmentAccountModel> accounts;
  String businessDate;
  String baseURL;
  String token;
  LoginUser user;
  EmbassyModel? letterDetails;
  GenerateReportModel(
      {required this.accounts,
      required this.businessDate,
      required this.baseURL,
      required this.token,
      required this.user,
      this.letterDetails});

  GenerateReportModel copyWith(
      {List<InvestmentAccountModel>? accounts,
      String? businessDate,
      String? baseURL,
      String? token,
      LoginUser? user,
      EmbassyModel? letterDetails}) {
    return GenerateReportModel(
        accounts: accounts ?? this.accounts,
        businessDate: businessDate ?? this.businessDate,
        baseURL: baseURL ?? this.baseURL,
        token: token ?? this.token,
        user: user ?? this.user,
        letterDetails: letterDetails ?? this.letterDetails);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'accounts': json.decode(investmentAccountModelToJson(accounts)),
      'businessDate': businessDate,
      'baseURL': baseURL,
      'token': token,
      'user': user.toMap(),
    };
    if (letterDetails != null && letterDetails!.id != 0) {
      map.addAll({'letterDetails': letterDetails!.toMap()});
    }

    return map;
  }

  @override
  bool operator ==(covariant GenerateReportModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.accounts, accounts) &&
        other.businessDate == businessDate &&
        other.baseURL == baseURL &&
        other.token == token &&
        other.user == user;
  }

  @override
  int get hashCode {
    return accounts.hashCode ^
        businessDate.hashCode ^
        baseURL.hashCode ^
        token.hashCode ^
        user.hashCode;
  }
}
