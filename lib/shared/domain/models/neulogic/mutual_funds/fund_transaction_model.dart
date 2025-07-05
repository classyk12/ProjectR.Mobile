import 'dart:convert';

MutualFundTransactionResponseModel mutualFundTransactionResponseModelFromJson(
        String str) =>
    MutualFundTransactionResponseModel.fromJson(json.decode(str));

String mutualFundTransactionResponseModelToJson(
        MutualFundTransactionResponseModel data) =>
    json.encode(data.toJson());

class MutualFundTransactionResponseModel {
  String status;
  List<Result> result;

  MutualFundTransactionResponseModel({
    required this.status,
    required this.result,
  });

  factory MutualFundTransactionResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MutualFundTransactionResponseModel(
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
  List<MutualFundTransaction> getFundTransactions;

  Result({
    required this.getFundTransactions,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        getFundTransactions: List<MutualFundTransaction>.from(
            json["GetFundTransactions"]
                .map((x) => MutualFundTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "GetFundTransactions":
            List<dynamic>.from(getFundTransactions.map((x) => x.toJson())),
      };
}

class MutualFundTransaction {
  String fundId;
  String fundDescription;
  String fundCurrency;
  String customerId;
  String customerName;
  String accountId;
  String accountDescription;
  num registrarAccountId;
  String transactionType;
  String balanceDate;
  String effectiveDate;
  num transactionQuantity;
  num creditQuantity;
  dynamic debitQuantity;
  num transactionPrice;
  num transactionAmount;
  String transactionDescription;
  String transactionReference;
  num isTransfer;

  MutualFundTransaction({
    required this.fundId,
    required this.fundDescription,
    required this.fundCurrency,
    required this.customerId,
    required this.customerName,
    required this.accountId,
    required this.accountDescription,
    required this.registrarAccountId,
    required this.transactionType,
    required this.balanceDate,
    required this.effectiveDate,
    required this.transactionQuantity,
    required this.creditQuantity,
    required this.debitQuantity,
    required this.transactionPrice,
    required this.transactionAmount,
    required this.transactionDescription,
    required this.transactionReference,
    required this.isTransfer,
  });

  factory MutualFundTransaction.fromJson(Map<String, dynamic> json) =>
      MutualFundTransaction(
        fundId: json["FUND_ID"] ?? '',
        fundDescription: json["FUND_DESCRIPTION"] ?? '',
        fundCurrency: json["FUND_CURRENCY"] ?? '',
        customerId: json["CUSTOMER_ID"] ?? '',
        customerName: json["CUSTOMER_NAME"] ?? '',
        accountId: json["ACCOUNT_ID"] ?? '',
        accountDescription: json["ACCOUNT_DESCRIPTION"] ?? '',
        registrarAccountId: json["REGISTRAR_ACCOUNT_ID"] ?? 0,
        transactionType: json["TRANSACTION_TYPE"] ?? '',
        balanceDate: json["BALANCE_DATE"] ?? '',
        effectiveDate: json["EFFECTIVE_DATE"] ?? '',
        transactionQuantity: json["TRANSACTION_QUANTITY"] ?? 0,
        creditQuantity: json["CREDIT_QUANTITY"] ?? 0,
        debitQuantity: json["DEBIT_QUANTITY"] ?? 0,
        transactionPrice: json["TRANSACTION_PRICE"] ?? 0,
        transactionAmount: json["TRANSACTION_AMOUNT"] ?? 0,
        transactionDescription: json["TRANSACTION_DESCRIPTION"] ?? '',
        transactionReference: json["TRANSACTION_REFERENCE"] ?? '',
        isTransfer: json["IS_TRANSFER"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "FUND_ID": fundId,
        "FUND_DESCRIPTION": fundDescription,
        "FUND_CURRENCY": fundCurrency,
        "CUSTOMER_ID": customerId,
        "CUSTOMER_NAME": customerName,
        "ACCOUNT_ID": accountId,
        "ACCOUNT_DESCRIPTION": accountDescription,
        "REGISTRAR_ACCOUNT_ID": registrarAccountId,
        "TRANSACTION_TYPE": transactionType,
        "BALANCE_DATE": balanceDate,
        "EFFECTIVE_DATE": effectiveDate,
        "TRANSACTION_QUANTITY": transactionQuantity,
        "CREDIT_QUANTITY": creditQuantity,
        "DEBIT_QUANTITY": debitQuantity,
        "TRANSACTION_PRICE": transactionPrice,
        "TRANSACTION_AMOUNT": transactionAmount,
        "TRANSACTION_DESCRIPTION": transactionDescription,
        "TRANSACTION_REFERENCE": transactionReference,
        "IS_TRANSFER": isTransfer,
      };
}
