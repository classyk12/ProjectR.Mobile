// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BondsProductResponse {
  int? statusCode;
  String? message;
  List<BondsProductsModel>? data;
  BondsProductResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  BondsProductResponse copyWith({
    int? statusCode,
    String? message,
    List<BondsProductsModel>? data,
  }) {
    return BondsProductResponse(
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

  factory BondsProductResponse.fromMap(Map<String, dynamic> map) {
    return BondsProductResponse(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<BondsProductsModel>.from(
              map['data'].map((x) => BondsProductsModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BondsProductResponse.fromJson(String source) =>
      BondsProductResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BondsProductResponse(statusCode: $statusCode, message: $message, data: $data)';

  @override
  bool operator ==(covariant BondsProductResponse other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ data.hashCode;
}

class BondsProductsModel {
  String? applyManagementFeeYn;
  String? applyCommissionYn;
  String? applyCustodyFeeYn;
  String? boaId;
  String? currencyDescription;
  String? currencyId;
  String? securityDescription;
  String? securityIssuer;
  String? maturityDate;
  num? couponRate;
  num? couponPaymentsPerYear;
  String? nextCouponDate;
  num? minimumPurchaseUnits;
  num? maximumPurchaseUnits;
  num? minimumPurchasePrice;
  num? maximumPurchasePrice;
  String? productDescription;
  String? productId;
  BondsProductsModel({
    this.applyManagementFeeYn,
    this.applyCommissionYn,
    this.applyCustodyFeeYn,
    this.boaId,
    this.currencyDescription,
    this.currencyId,
    this.securityDescription,
    this.securityIssuer,
    this.maturityDate,
    this.couponRate,
    this.couponPaymentsPerYear,
    this.nextCouponDate,
    this.minimumPurchaseUnits,
    this.maximumPurchaseUnits,
    this.minimumPurchasePrice,
    this.maximumPurchasePrice,
    this.productDescription,
    this.productId,
  });

  BondsProductsModel copyWith({
    String? applyManagementFeeYn,
    String? applyCommissionYn,
    String? applyCustodyFeeYn,
    String? boaId,
    String? currencyDescription,
    String? currencyId,
    String? securityDescription,
    String? securityIssuer,
    String? maturityDate,
    num? couponRate,
    num? couponPaymentsPerYear,
    String? nextCouponDate,
    num? minimumPurchaseUnits,
    num? maximumPurchaseUnits,
    num? minimumPurchasePrice,
    num? maximumPurchasePrice,
    String? productDescription,
    String? productId,
  }) {
    return BondsProductsModel(
      applyManagementFeeYn: applyManagementFeeYn ?? this.applyManagementFeeYn,
      applyCommissionYn: applyCommissionYn ?? this.applyCommissionYn,
      applyCustodyFeeYn: applyCustodyFeeYn ?? this.applyCustodyFeeYn,
      boaId: boaId ?? this.boaId,
      currencyDescription: currencyDescription ?? this.currencyDescription,
      currencyId: currencyId ?? this.currencyId,
      securityDescription: securityDescription ?? this.securityDescription,
      securityIssuer: securityIssuer ?? this.securityIssuer,
      maturityDate: maturityDate ?? this.maturityDate,
      couponRate: couponRate ?? this.couponRate,
      couponPaymentsPerYear:
          couponPaymentsPerYear ?? this.couponPaymentsPerYear,
      nextCouponDate: nextCouponDate ?? this.nextCouponDate,
      minimumPurchaseUnits: minimumPurchaseUnits ?? this.minimumPurchaseUnits,
      maximumPurchaseUnits: maximumPurchaseUnits ?? this.maximumPurchaseUnits,
      minimumPurchasePrice: minimumPurchasePrice ?? this.minimumPurchasePrice,
      maximumPurchasePrice: maximumPurchasePrice ?? this.maximumPurchasePrice,
      productDescription: productDescription ?? this.productDescription,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'applyManagementFeeYn': applyManagementFeeYn,
      'applyCommissionYn': applyCommissionYn,
      'applyCustodyFeeYn': applyCustodyFeeYn,
      'boaId': boaId,
      'currencyDescription': currencyDescription,
      'currencyId': currencyId,
      'securityDescription': securityDescription,
      'securityIssuer': securityIssuer,
      'maturityDate': maturityDate,
      'couponRate': couponRate,
      'couponPaymentsPerYear': couponPaymentsPerYear,
      'nextCouponDate': nextCouponDate,
      'minimumPurchaseUnits': minimumPurchaseUnits,
      'maximumPurchaseUnits': maximumPurchaseUnits,
      'minimumPurchasePrice': minimumPurchasePrice,
      'maximumPurchasePrice': maximumPurchasePrice,
      'productDescription': productDescription,
      'productId': productId,
    };
  }

  factory BondsProductsModel.fromMap(Map<String, dynamic> map) {
    return BondsProductsModel(
      applyManagementFeeYn: map['APPLY_MANAGEMENT_FEE_YN'] != null
          ? map['APPLY_MANAGEMENT_FEE_YN'] as String
          : null,
      applyCommissionYn: map['APPLY_COMMISSION_YN'] != null
          ? map['APPLY_COMMISSION_YN'] as String
          : null,
      applyCustodyFeeYn: map['APPLY_CUSTODY_FEE_YN'] != null
          ? map['APPLY_CUSTODY_FEE_YN'] as String
          : null,
      boaId: map['BOA_ID'] != null ? map['BOA_ID'] as String : null,
      currencyDescription: map['CURRENCY_DESCRIPTION'] != null
          ? map['CURRENCY_DESCRIPTION'] as String
          : null,
      currencyId:
          map['CURRENCY_ID'] != null ? map['CURRENCY_ID'] as String : null,
      securityDescription: map['SECURITY_DESCRIPTION'] != null
          ? map['SECURITY_DESCRIPTION'] as String
          : null,
      securityIssuer: map['SECURITY_ISSUER'] != null
          ? map['SECURITY_ISSUER'] as String
          : null,
      maturityDate:
          map['MATURITY_DATE'] != null ? map['MATURITY_DATE'] as String : null,
      couponRate: map['COUPON_RATE'] != null ? map['COUPON_RATE'] as num : null,
      couponPaymentsPerYear: map['COUPON_PAYMENTS_PER_YEAR'] != null
          ? map['COUPON_PAYMENTS_PER_YEAR'] as num
          : null,
      nextCouponDate: map['NEXT_COUPON_DATE'] != null
          ? map['NEXT_COUPON_DATE'] as String
          : null,
      minimumPurchaseUnits: map['MINIMUM_PURCHASE_UNITS'] != null
          ? map['MINIMUM_PURCHASE_UNITS'] as num
          : null,
      maximumPurchaseUnits: map['MAXIMUM_PURCHASE_UNITS'] != null
          ? map['MAXIMUM_PURCHASE_UNITS'] as num
          : null,
      minimumPurchasePrice: map['MINIMUM_PURCHASE_PRICE'] != null
          ? map['MINIMUM_PURCHASE_PRICE'] as num
          : null,
      maximumPurchasePrice: map['MAXIMUM_PURCHASE_PRICE'] != null
          ? map['MAXIMUM_PURCHASE_PRICE'] as num
          : null,
      productDescription: map['PRODUCT_DESCRIPTION'] != null
          ? map['PRODUCT_DESCRIPTION'] as String
          : null,
      productId: map['PRODUCT_ID'] != null ? map['PRODUCT_ID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BondsProductsModel.fromJson(String source) =>
      BondsProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BondsProductsModel(applyManagementFeeYn: $applyManagementFeeYn, applyCommissionYn: $applyCommissionYn, applyCustodyFeeYn: $applyCustodyFeeYn, boaId: $boaId, currencyDescription: $currencyDescription, currencyId: $currencyId, securityDescription: $securityDescription, securityIssuer: $securityIssuer, maturityDate: $maturityDate, couponRate: $couponRate, couponPaymentsPerYear: $couponPaymentsPerYear, nextCouponDate: $nextCouponDate, minimumPurchaseUnits: $minimumPurchaseUnits, maximumPurchaseUnits: $maximumPurchaseUnits, minimumPurchasePrice: $minimumPurchasePrice, maximumPurchasePrice: $maximumPurchasePrice, productDescription: $productDescription, productId: $productId)';
  }

  @override
  bool operator ==(covariant BondsProductsModel other) {
    if (identical(this, other)) return true;

    return other.applyManagementFeeYn == applyManagementFeeYn &&
        other.applyCommissionYn == applyCommissionYn &&
        other.applyCustodyFeeYn == applyCustodyFeeYn &&
        other.boaId == boaId &&
        other.currencyDescription == currencyDescription &&
        other.currencyId == currencyId &&
        other.securityDescription == securityDescription &&
        other.securityIssuer == securityIssuer &&
        other.maturityDate == maturityDate &&
        other.couponRate == couponRate &&
        other.couponPaymentsPerYear == couponPaymentsPerYear &&
        other.nextCouponDate == nextCouponDate &&
        other.minimumPurchaseUnits == minimumPurchaseUnits &&
        other.maximumPurchaseUnits == maximumPurchaseUnits &&
        other.minimumPurchasePrice == minimumPurchasePrice &&
        other.maximumPurchasePrice == maximumPurchasePrice &&
        other.productDescription == productDescription &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return applyManagementFeeYn.hashCode ^
        applyCommissionYn.hashCode ^
        applyCustodyFeeYn.hashCode ^
        boaId.hashCode ^
        currencyDescription.hashCode ^
        currencyId.hashCode ^
        securityDescription.hashCode ^
        securityIssuer.hashCode ^
        maturityDate.hashCode ^
        couponRate.hashCode ^
        couponPaymentsPerYear.hashCode ^
        nextCouponDate.hashCode ^
        minimumPurchaseUnits.hashCode ^
        maximumPurchaseUnits.hashCode ^
        minimumPurchasePrice.hashCode ^
        maximumPurchasePrice.hashCode ^
        productDescription.hashCode ^
        productId.hashCode;
  }
}
