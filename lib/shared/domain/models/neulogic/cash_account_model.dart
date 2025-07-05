// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FixedIncomeCashAccountModel {
  final String customerNo;
  final String accountNo;
  final String accountName;
  final String nubanAccountNo;
  final String alternateAccountNo;
  //final String externalReference;
  final num availableBalance;
  final num currentBalance;
  final num accruedCreditInterest;
  final num accruedDebitInterest;
  final String currencyId;
  final String currencyName;
  final String productId;
  final String productName;
  final String dateOpened;
  final String boaId;
  final String sourceApp;
//  final String sourceRef;
  FixedIncomeCashAccountModel({
    required this.customerNo,
    required this.accountNo,
    required this.accountName,
    required this.nubanAccountNo,
    required this.alternateAccountNo,
    //required this.externalReference,
    required this.availableBalance,
    required this.currentBalance,
    required this.accruedCreditInterest,
    required this.accruedDebitInterest,
    required this.currencyId,
    required this.currencyName,
    required this.productId,
    required this.productName,
    required this.dateOpened,
    required this.boaId,
    required this.sourceApp,
    // required this.sourceRef,
  });

  FixedIncomeCashAccountModel copyWith({
    String? customerNo,
    String? accountNo,
    String? accountName,
    String? nubanAccountNo,
    String? alternateAccountNo,
    String? externalReference,
    num? availableBalance,
    num? currentBalance,
    num? accruedCreditInterest,
    num? accruedDebitInterest,
    String? currencyId,
    String? currencyName,
    String? productId,
    String? productName,
    String? dateOpened,
    String? boaId,
    String? sourceApp,
    String? sourceRef,
  }) {
    return FixedIncomeCashAccountModel(
      customerNo: customerNo ?? this.customerNo,
      accountNo: accountNo ?? this.accountNo,
      accountName: accountName ?? this.accountName,
      nubanAccountNo: nubanAccountNo ?? this.nubanAccountNo,
      alternateAccountNo: alternateAccountNo ?? this.alternateAccountNo,
      //externalReference: externalReference ?? this.externalReference,
      availableBalance: availableBalance ?? this.availableBalance,
      currentBalance: currentBalance ?? this.currentBalance,
      accruedCreditInterest:
          accruedCreditInterest ?? this.accruedCreditInterest,
      accruedDebitInterest: accruedDebitInterest ?? this.accruedDebitInterest,
      currencyId: currencyId ?? this.currencyId,
      currencyName: currencyName ?? this.currencyName,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      dateOpened: dateOpened ?? this.dateOpened,
      boaId: boaId ?? this.boaId,
      sourceApp: sourceApp ?? this.sourceApp,
      //sourceRef: sourceRef ?? this.sourceRef,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerNo': customerNo,
      'accountNo': accountNo,
      'accountName': accountName,
      'nubanAccountNo': nubanAccountNo,
      'alternateAccountNo': alternateAccountNo,
      //'externalReference': externalReference,
      'availableBalance': availableBalance,
      'currentBalance': currentBalance,
      'accruedCreditInterest': accruedCreditInterest,
      'accruedDebitInterest': accruedDebitInterest,
      'currencyId': currencyId,
      'currencyName': currencyName,
      'productId': productId,
      'productName': productName,
      'dateOpened': dateOpened,
      'boaId': boaId,
      'sourceApp': sourceApp,
      //'sourceRef': sourceRef,
    };
  }

  factory FixedIncomeCashAccountModel.fromMap(Map<String, dynamic> map) {
    return FixedIncomeCashAccountModel(
      customerNo: map['CUSTOMER_NO'] ?? '',
      accountNo: map['ACCOUNT_NO'] ?? '',
      accountName: map['ACCOUNT_NAME'] ?? '',
      nubanAccountNo: map['NUBAN_ACCOUNT_NO'] ?? '',
      alternateAccountNo: map['ALTERNATE_ACCOUNT_NO'] ?? '',
      //  externalReference: map['EXTERNAL_REFERENCE'] ?? '',
      availableBalance: map['AVAILABLE_BALANCE'] ?? 0,
      currentBalance: map['CURRENT_BALANCE'] ?? 0,
      accruedCreditInterest: map['ACCRUED_CREDIT_INTEREST'] ?? 0,
      accruedDebitInterest: map['ACCRUED_DEBIT_INTEREST'] ?? 0,
      currencyId: map['CURRENCY_ID'] ?? '',
      currencyName: map['CURRENCY_NAME'] ?? '',
      productId: map['PRODUCT_ID'] ?? '',
      productName: map['PRODUCT_NAME'] ?? '',
      dateOpened: map['DATE_OPENED'] ?? '',
      boaId: map['BOA_ID'] ?? '',
      sourceApp: map['SOURCE_APP'] ?? '',
      //   sourceRef: map['SOURCE_REF'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FixedIncomeCashAccountModel.fromJson(String source) =>
      FixedIncomeCashAccountModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant FixedIncomeCashAccountModel other) {
    if (identical(this, other)) return true;

    return other.customerNo == customerNo &&
        other.accountNo == accountNo &&
        other.accountName == accountName &&
        other.nubanAccountNo == nubanAccountNo &&
        other.alternateAccountNo == alternateAccountNo &&
        // other.externalReference == externalReference &&
        other.availableBalance == availableBalance &&
        other.currentBalance == currentBalance &&
        other.accruedCreditInterest == accruedCreditInterest &&
        other.accruedDebitInterest == accruedDebitInterest &&
        other.currencyId == currencyId &&
        other.currencyName == currencyName &&
        other.productId == productId &&
        other.productName == productName &&
        other.dateOpened == dateOpened &&
        other.boaId == boaId &&
        other.sourceApp == sourceApp;
    // other.sourceRef == sourceRef;
  }

  @override
  int get hashCode {
    return customerNo.hashCode ^
        accountNo.hashCode ^
        accountName.hashCode ^
        nubanAccountNo.hashCode ^
        alternateAccountNo.hashCode ^
        //   externalReference.hashCode ^
        availableBalance.hashCode ^
        currentBalance.hashCode ^
        accruedCreditInterest.hashCode ^
        accruedDebitInterest.hashCode ^
        currencyId.hashCode ^
        currencyName.hashCode ^
        productId.hashCode ^
        productName.hashCode ^
        dateOpened.hashCode ^
        boaId.hashCode ^
        sourceApp.hashCode;
    // sourceRef.hashCode;
  }
}
