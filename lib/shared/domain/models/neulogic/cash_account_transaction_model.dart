import 'dart:convert';

CashAccountTransactionResponseModel cashAccountTransactionResponseModelFromJson(
        String str) =>
    CashAccountTransactionResponseModel.fromJson(json.decode(str));

String cashAccountTransactionResponseModelToJson(
        CashAccountTransactionResponseModel data) =>
    json.encode(data.toJson());

class CashAccountTransactionResponseModel {
  final String status;
  final List<Result> result;

  CashAccountTransactionResponseModel({
    required this.status,
    required this.result,
  });

  factory CashAccountTransactionResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CashAccountTransactionResponseModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  final List<CashAccountTransactionModel> transactions;

  Result({
    required this.transactions,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        transactions: List<CashAccountTransactionModel>.from(
            json["GetCashAccountTransactionByCurrentDate"]
                .map((x) => CashAccountTransactionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "GetCashAccountTransactionByCurrentDate":
            List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class CashAccountTransactionModel {
  final String accountName;
  final String accountNo;
  final dynamic alternateAccountNo;
  final String businessDate;
  final dynamic chequeReference;
  final String currencyId;
  final String currencyName;
  final String customerNo;
  final String effectiveDate;
  final String isReversed;
  final dynamic nubanAccountNo;
  final String processingDate;
  final double transactionAmount;
  final String transactionDescription;
  final int transactionNumber;
  final String transactionReference;
  final String transactionType;

  CashAccountTransactionModel({
    required this.accountName,
    required this.accountNo,
    required this.alternateAccountNo,
    required this.businessDate,
    required this.chequeReference,
    required this.currencyId,
    required this.currencyName,
    required this.customerNo,
    required this.effectiveDate,
    required this.isReversed,
    required this.nubanAccountNo,
    required this.processingDate,
    required this.transactionAmount,
    required this.transactionDescription,
    required this.transactionNumber,
    required this.transactionReference,
    required this.transactionType,
  });

  factory CashAccountTransactionModel.fromJson(Map<String, dynamic> json) =>
      CashAccountTransactionModel(
        accountName: json["ACCOUNT_NAME"],
        accountNo: json["ACCOUNT_NO"],
        alternateAccountNo: json["ALTERNATE_ACCOUNT_NO"],
        businessDate: json["BUSINESS_DATE"],
        chequeReference: json["CHEQUE_REFERENCE"],
        currencyId: json["CURRENCY_ID"],
        currencyName: json["CURRENCY_NAME"],
        customerNo: json["CUSTOMER_NO"],
        effectiveDate: json["EFFECTIVE_DATE"],
        isReversed: json["IS_REVERSED"],
        nubanAccountNo: json["NUBAN_ACCOUNT_NO"],
        processingDate: json["PROCESSING_DATE"],
        transactionAmount: json["TRANSACTION_AMOUNT"]?.toDouble(),
        transactionDescription: json["TRANSACTION_DESCRIPTION"],
        transactionNumber: json["TRANSACTION_NUMBER"],
        transactionReference: json["TRANSACTION_REFERENCE"],
        transactionType: json["TRANSACTION_TYPE"],
      );

  Map<String, dynamic> toJson() => {
        "ACCOUNT_NAME": accountName,
        "ACCOUNT_NO": accountNo,
        "ALTERNATE_ACCOUNT_NO": alternateAccountNo,
        "BUSINESS_DATE": businessDate,
        "CHEQUE_REFERENCE": chequeReference,
        "CURRENCY_ID": currencyId,
        "CURRENCY_NAME": currencyName,
        "CUSTOMER_NO": customerNo,
        "EFFECTIVE_DATE": effectiveDate,
        "IS_REVERSED": isReversed,
        "NUBAN_ACCOUNT_NO": nubanAccountNo,
        "PROCESSING_DATE": processingDate,
        "TRANSACTION_AMOUNT": transactionAmount,
        "TRANSACTION_DESCRIPTION": transactionDescription,
        "TRANSACTION_NUMBER": transactionNumber,
        "TRANSACTION_REFERENCE": transactionReference,
        "TRANSACTION_TYPE": transactionType,
      };
}
