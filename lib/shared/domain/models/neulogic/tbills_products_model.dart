// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TreasuryBillsResponse {
  int? statusCode;
  String? message;
  List<TreasuryBillsProductsModel>? data;
  TreasuryBillsResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  TreasuryBillsResponse copyWith({
    int? statusCode,
    String? message,
    List<TreasuryBillsProductsModel>? data,
  }) {
    return TreasuryBillsResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'data':
          data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
  }

  factory TreasuryBillsResponse.fromMap(Map<String, dynamic> map) {
    return TreasuryBillsResponse(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<TreasuryBillsProductsModel>.from(
              map['data'].map((x) => TreasuryBillsProductsModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreasuryBillsResponse.fromJson(String source) =>
      TreasuryBillsResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TreasuryBillsResponse(statusCode: $statusCode, message: $message, data: $data)';

  @override
  bool operator ==(covariant TreasuryBillsResponse other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ data.hashCode;
}

class TreasuryBillsProductsModel {
  String? allowPurchaseYn;
  String? allowSaleYn;
  String? applyCommissionYn;
  String? applyCustodyFeeYn;
  String? applyManagementFeeYn;
  String? boaId;
  String? currencyDescription;
  String? currencyId;
  String? instrumentDescription;
  String? instrumentId;
  String? isMaturedYn;
  String? maturityDate;
  num? maximumPurchaseValue;
  num? maximumSaleValue;
  num? minimumPurchaseValue;
  num? minimumSaleValue;
  String? productDescription;
  String? productId;

  TreasuryBillsProductsModel({
    this.allowPurchaseYn,
    this.allowSaleYn,
    this.applyCommissionYn,
    this.applyCustodyFeeYn,
    this.applyManagementFeeYn,
    this.boaId,
    this.currencyDescription,
    this.currencyId,
    this.instrumentDescription,
    this.instrumentId,
    this.isMaturedYn,
    this.maturityDate,
    this.maximumPurchaseValue,
    this.maximumSaleValue,
    this.minimumPurchaseValue,
    this.minimumSaleValue,
    this.productDescription,
    this.productId,
  });

  TreasuryBillsProductsModel copyWith({
    String? allowPurchaseYn,
    String? allowSaleYn,
    String? applyCommissionYn,
    String? applyCustodyFeeYn,
    String? applyManagementFeeYn,
    String? boaId,
    String? currencyDescription,
    String? currencyId,
    String? instrumentDescription,
    String? instrumentId,
    String? isMaturedYn,
    String? maturityDate,
    num? maximumPurchaseValue,
    num? maximumSaleValue,
    num? minimumPurchaseValue,
    num? minimumSaleValue,
    String? productDescription,
    String? productId,
  }) {
    return TreasuryBillsProductsModel(
      allowPurchaseYn: allowPurchaseYn ?? this.allowPurchaseYn,
      allowSaleYn: allowSaleYn ?? this.allowSaleYn,
      applyCommissionYn: applyCommissionYn ?? this.applyCommissionYn,
      applyCustodyFeeYn: applyCustodyFeeYn ?? this.applyCustodyFeeYn,
      applyManagementFeeYn: applyManagementFeeYn ?? this.applyManagementFeeYn,
      boaId: boaId ?? this.boaId,
      currencyDescription: currencyDescription ?? this.currencyDescription,
      currencyId: currencyId ?? this.currencyId,
      instrumentDescription:
          instrumentDescription ?? this.instrumentDescription,
      instrumentId: instrumentId ?? this.instrumentId,
      isMaturedYn: isMaturedYn ?? this.isMaturedYn,
      maturityDate: maturityDate ?? this.maturityDate,
      maximumPurchaseValue: maximumPurchaseValue ?? this.maximumPurchaseValue,
      maximumSaleValue: maximumSaleValue ?? this.maximumSaleValue,
      minimumPurchaseValue: minimumPurchaseValue ?? this.minimumPurchaseValue,
      minimumSaleValue: minimumSaleValue ?? this.minimumSaleValue,
      productDescription: productDescription ?? this.productDescription,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allowPurchaseYn': allowPurchaseYn,
      'allowSaleYn': allowSaleYn,
      'applyCommissionYn': applyCommissionYn,
      'applyCustodyFeeYn': applyCustodyFeeYn,
      'applyManagementFeeYn': applyManagementFeeYn,
      'boaId': boaId,
      'currencyDescription': currencyDescription,
      'currencyId': currencyId,
      'instrumentDescription': instrumentDescription,
      'instrumentId': instrumentId,
      'isMaturedYn': isMaturedYn,
      'maturityDate': maturityDate,
      'maximumPurchaseValue': maximumPurchaseValue,
      'maximumSaleValue': maximumSaleValue,
      'minimumPurchaseValue': minimumPurchaseValue,
      'minimumSaleValue': minimumSaleValue,
      'productDescription': productDescription,
      'productId': productId,
    };
  }

  factory TreasuryBillsProductsModel.fromMap(Map<String, dynamic> map) {
    return TreasuryBillsProductsModel(
      allowPurchaseYn: map['ALLOW_PURCHASE_YN'] != null
          ? map['ALLOW_PURCHASE_YN'] as String
          : null,
      allowSaleYn:
          map['ALLOW_SALE_YN'] != null ? map['ALLOW_SALE_YN'] as String : null,
      applyCommissionYn: map['APPLY_COMMISSION_YN'] != null
          ? map['APPLY_COMMISSION_YN'] as String
          : null,
      applyCustodyFeeYn: map['APPLY_CUSTODY_FEE_YN'] != null
          ? map['APPLY_CUSTODY_FEE_YN'] as String
          : null,
      applyManagementFeeYn: map['APPLY_MANAGEMENT_FEE_YN'] != null
          ? map['APPLY_MANAGEMENT_FEE_YN'] as String
          : null,
      boaId: map['BOA_ID'] != null ? map['BOA_ID'] as String : null,
      currencyDescription: map['CURRENCY_DESCRIPTION'] != null
          ? map['CURRENCY_DESCRIPTION'] as String
          : null,
      currencyId:
          map['CURRENCY_ID'] != null ? map['CURRENCY_ID'] as String : null,
      instrumentDescription: map['INSTRUMENT_DESCRIPTION'] != null
          ? map['INSTRUMENT_DESCRIPTION'] as String
          : null,
      instrumentId:
          map['INSTRUMENT_ID'] != null ? map['INSTRUMENT_ID'] as String : null,
      isMaturedYn:
          map['IS_MATURED_YN'] != null ? map['IS_MATURED_YN'] as String : null,
      maturityDate:
          map['MATURITY_DATE'] != null ? map['MATURITY_DATE'] as String : null,
      maximumPurchaseValue: map['MAXIMUM_PURCHASE_VALUE'] != null
          ? map['MAXIMUM_PURCHASE_VALUE'] as num
          : null,
      maximumSaleValue: map['MAXIMUM_SALE_VALUE'] != null
          ? map['MAXIMUM_SALE_VALUE'] as num
          : null,
      minimumPurchaseValue: map['MINIMUM_PURCHASE_VALUE'] != null
          ? map['MINIMUM_PURCHASE_VALUE'] as num
          : null,
      minimumSaleValue: map['MINIMUM_SALE_VALUE'] != null
          ? map['MINIMUM_SALE_VALUE'] as num
          : null,
      productDescription: map['PRODUCT_DESCRIPTION'] != null
          ? map['PRODUCT_DESCRIPTION'] as String
          : null,
      productId: map['PRODUCT_ID'] != null ? map['PRODUCT_ID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreasuryBillsProductsModel.fromJson(String source) =>
      TreasuryBillsProductsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TreasuryBondsProductsModel(ALLOW_PURCHASE_YN: $allowPurchaseYn, ALLOW_SALE_YN: $allowSaleYn, APPLY_COMMISSION_YN: $applyCommissionYn, APPLY_CUSTODY_FEE_YN: $applyCustodyFeeYn, APPLY_MANAGEMENT_FEE_YN: $applyManagementFeeYn, BOA_ID: $boaId, CURRENCY_DESCRIPTION: $currencyDescription, CURRENCY_ID: $currencyId, INSTRUMENT_DESCRIPTION": $instrumentDescription, INSTRUMENT_ID: $instrumentId, IS_MATURED_YN: $isMaturedYn, MATURITY_DATE: $maturityDate, MAXIMUM_PURCHASE_VALUE: $maximumPurchaseValue, MAXIMUM_SALE_VALUE: $maximumSaleValue, MINIMUM_PURCHASE_VALUE: $minimumPurchaseValue, MINIMUM_SALE_VALUE: $minimumSaleValue, PRODUCT_DESCRIPTION: $productDescription, PRODUCT_ID: $productId)';
  }

  @override
  bool operator ==(covariant TreasuryBillsProductsModel other) {
    if (identical(this, other)) return true;

    return other.allowPurchaseYn == allowPurchaseYn &&
        other.allowSaleYn == allowSaleYn &&
        other.applyCommissionYn == applyCommissionYn &&
        other.applyCustodyFeeYn == applyCustodyFeeYn &&
        other.applyManagementFeeYn == applyManagementFeeYn &&
        other.boaId == boaId &&
        other.currencyDescription == currencyDescription &&
        other.currencyId == currencyId &&
        other.instrumentDescription == instrumentDescription &&
        other.instrumentId == instrumentId &&
        other.isMaturedYn == isMaturedYn &&
        other.maturityDate == maturityDate &&
        other.maximumPurchaseValue == maximumPurchaseValue &&
        other.maximumSaleValue == maximumSaleValue &&
        other.minimumPurchaseValue == minimumPurchaseValue &&
        other.minimumSaleValue == minimumSaleValue &&
        other.productDescription == productDescription &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return allowPurchaseYn.hashCode ^
        allowSaleYn.hashCode ^
        applyCommissionYn.hashCode ^
        applyCustodyFeeYn.hashCode ^
        applyManagementFeeYn.hashCode ^
        boaId.hashCode ^
        currencyDescription.hashCode ^
        currencyId.hashCode ^
        instrumentDescription.hashCode ^
        instrumentId.hashCode ^
        isMaturedYn.hashCode ^
        maturityDate.hashCode ^
        maximumPurchaseValue.hashCode ^
        maximumSaleValue.hashCode ^
        minimumPurchaseValue.hashCode ^
        minimumSaleValue.hashCode ^
        productDescription.hashCode ^
        productId.hashCode;
  }
}
