import 'dart:convert';

class EquitiesResponse {
  final int? page;
  final int? size;
  final int? totalPages;
  final int? totalCount;
  final String? sort;
  final String? order;
  final List<Equities>? content;

  EquitiesResponse({
    this.page,
    this.size,
    this.totalPages,
    this.totalCount,
    this.sort,
    this.order,
    this.content,
  });

  EquitiesResponse copyWith({
    int? page,
    int? size,
    int? totalPages,
    int? totalCount,
    String? sort,
    String? order,
    List<Equities>? content,
  }) {
    return EquitiesResponse(
      page: page ?? this.page,
      size: size ?? this.size,
      totalPages: totalPages ?? this.totalPages,
      totalCount: totalCount ?? this.totalCount,
      sort: sort ?? this.sort,
      order: order ?? this.order,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'size': size,
      'totalPages': totalPages,
      'totalCount': totalCount,
      'sort': sort,
      'order': order,
      'content': content?.map((x) => x.toMap()).toList(),
    };
  }

  factory EquitiesResponse.fromMap(Map<String, dynamic> map) {
    return EquitiesResponse(
      page: map['page'],
      size: map['size'],
      totalPages: map['totalPages'],
      totalCount: map['totalCount'],
      sort: map['sort'],
      order: map['order'],
      content: map['content'] != null
          ? List<Equities>.from(map['content'].map((x) => Equities.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory EquitiesResponse.fromJson(String source) =>
      EquitiesResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(page: $page, size: $size, totalPages: $totalPages, totalCount: $totalCount, sort: $sort, order: $order, content: $content)';
  }

  @override
  bool operator ==(covariant EquitiesResponse other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        other.size == size &&
        other.totalPages == totalPages &&
        other.totalCount == totalCount &&
        other.sort == sort &&
        other.order == order &&
        other.content == content;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        size.hashCode ^
        totalPages.hashCode ^
        totalCount.hashCode ^
        sort.hashCode ^
        order.hashCode ^
        content.hashCode;
  }
}

class Equities {
  final String? id;

  final bool? deleted;
  final DateTime? issueDate;
  final String? secId;
  final String? isin;
  final String? secDesc;
  final String? secNotes;
  final dynamic imageUrl;
  final num? settlementDays;
  final String? status;
  final String? type;
  final bool? allowShorts;
  final dynamic logo;
  final dynamic logoFileName;
  final dynamic logoMimeType;
  final num? price;
  final String? currency;
  final num? parValue;
  final num? priceConvRatio;
  final num? longMarginReq;
  final num? shortMarginReq;
  final num? minOrderQuantity;
  final num? maxOrderQuantity;
  final num? orderSizeStep;
  final bool? allowFractions;
  final bool? allowMargin;
  final dynamic industry;
  final dynamic superSector;
  final dynamic sector;
  final dynamic subSector;
  final dynamic classificationId;
  final String? marketCode;
  final String? marketId;

  Equities({
    this.id,
    // this.createdBy,
    // this.createdAt,
    // this.updatedBy,
    // this.updatedAt,
    this.deleted,
    this.issueDate,
    this.secId,
    this.isin,
    this.secDesc,
    this.secNotes,
    this.imageUrl,
    this.settlementDays,
    this.status,
    this.type,
    this.allowShorts,
    this.logo,
    this.logoFileName,
    this.logoMimeType,
    this.price,
    this.currency,
    this.parValue,
    this.priceConvRatio,
    this.longMarginReq,
    this.shortMarginReq,
    this.minOrderQuantity,
    this.maxOrderQuantity,
    this.orderSizeStep,
    this.allowFractions,
    this.allowMargin,
    this.industry,
    this.superSector,
    this.sector,
    this.subSector,
    this.classificationId,
    this.marketCode,
    this.marketId,
  });

  Equities copyWith({
    String? id,
    String? createdBy,
    DateTime? createdAt,
    String? updatedBy,
    DateTime? updatedAt,
    bool? deleted,
    DateTime? issueDate,
    String? secId,
    String? isin,
    String? secDesc,
    String? secNotes,
    dynamic imageUrl,
    num? settlementDays,
    String? status,
    String? type,
    bool? allowShorts,
    dynamic logo,
    dynamic logoFileName,
    dynamic logoMimeType,
    num? price,
    String? currency,
    num? parValue,
    num? priceConvRatio,
    num? longMarginReq,
    num? shortMarginReq,
    num? minOrderQuantity,
    num? maxOrderQuantity,
    num? orderSizeStep,
    bool? allowFractions,
    bool? allowMargin,
    dynamic industry,
    dynamic superSector,
    dynamic sector,
    dynamic subSector,
    dynamic classificationId,
    String? marketCode,
    String? marketId,
  }) {
    return Equities(
      id: id ?? this.id,
      // createdBy: createdBy ?? this.createdBy,
      // createdAt: createdAt ?? this.createdAt,
      // updatedBy: updatedBy ?? this.updatedBy,
      // updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      issueDate: issueDate ?? this.issueDate,
      secId: secId ?? this.secId,
      isin: isin ?? this.isin,
      secDesc: secDesc ?? this.secDesc,
      secNotes: secNotes ?? this.secNotes,
      imageUrl: imageUrl ?? this.imageUrl,
      settlementDays: settlementDays ?? this.settlementDays,
      status: status ?? this.status,
      type: type ?? this.type,
      allowShorts: allowShorts ?? this.allowShorts,
      logo: logo ?? this.logo,
      logoFileName: logoFileName ?? this.logoFileName,
      logoMimeType: logoMimeType ?? this.logoMimeType,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      parValue: parValue ?? this.parValue,
      priceConvRatio: priceConvRatio ?? this.priceConvRatio,
      longMarginReq: longMarginReq ?? this.longMarginReq,
      shortMarginReq: shortMarginReq ?? this.shortMarginReq,
      minOrderQuantity: minOrderQuantity ?? this.minOrderQuantity,
      maxOrderQuantity: maxOrderQuantity ?? this.maxOrderQuantity,
      orderSizeStep: orderSizeStep ?? this.orderSizeStep,
      allowFractions: allowFractions ?? this.allowFractions,
      allowMargin: allowMargin ?? this.allowMargin,
      industry: industry ?? this.industry,
      superSector: superSector ?? this.superSector,
      sector: sector ?? this.sector,
      subSector: subSector ?? this.subSector,
      classificationId: classificationId ?? this.classificationId,
      marketCode: marketCode ?? this.marketCode,
      marketId: marketId ?? this.marketId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'deleted': deleted,
      'issueDate': issueDate?.toIso8601String(),
      'secId': secId,
      'isin': isin,
      'secDesc': secDesc,
      'secNotes': secNotes,
      'imageUrl': imageUrl,
      'settlementDays': settlementDays,
      'status': status,
      'type': type,
      'allowShorts': allowShorts,
      'logo': logo,
      'logoFileName': logoFileName,
      'logoMimeType': logoMimeType,
      'price': price,
      'currency': currency,
      'parValue': parValue,
      'priceConvRatio': priceConvRatio,
      'longMarginReq': longMarginReq,
      'shortMarginReq': shortMarginReq,
      'minOrderQuantity': minOrderQuantity,
      'maxOrderQuantity': maxOrderQuantity,
      'orderSizeStep': orderSizeStep,
      'allowFractions': allowFractions,
      'allowMargin': allowMargin,
      'industry': industry,
      'superSector': superSector,
      'sector': sector,
      'subSector': subSector,
      'classificationId': classificationId,
      'marketCode': marketCode,
      'marketId': marketId,
    };
  }

  factory Equities.fromMap(Map<String, dynamic> map) {
    return Equities(
      id: map['id'],
      deleted: map['deleted'],
      issueDate: map['issueDate'] != null
          ? DateTime.parse(map['issueDate'])
          : DateTime.now(),
      secId: map['secId'] ?? '',
      isin: map['isin'] ?? '',
      secDesc: map['secDesc'] ?? '',
      secNotes: map['secNotes'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      settlementDays: map['settlementDays'] ?? 0,
      status: map['status'] ?? '',
      type: map['type'] ?? '',
      allowShorts: map['allowShorts'] ?? false,
      logo: map['logo'] ?? '',
      logoFileName: map['logoFileName'] ?? '',
      logoMimeType: map['logoMimeType'] ?? '',
      price: map['price'] ?? 0,
      currency: map['currency'] ?? '',
      parValue: map['parValue'] ?? 0,
      priceConvRatio: map['priceConvRatio'] ?? 0,
      longMarginReq: map['longMarginReq'] ?? 0,
      shortMarginReq: map['shortMarginReq'] ?? 0,
      minOrderQuantity: map['minOrderQuantity'] ?? 0,
      maxOrderQuantity: map['maxOrderQuantity'] ?? 0,
      orderSizeStep: map['orderSizeStep'] ?? 0,
      allowFractions: map['allowFractions'] ?? false,
      allowMargin: map['allowMargin'] ?? false,
      industry: map['industry'] ?? '',
      superSector: map['superSector'] ?? '',
      sector: map['sector'] ?? '',
      subSector: map['subSector'] ?? '',
      classificationId: map['classificationId'] ?? '',
      marketCode: map['marketCode'] ?? '',
      marketId: map['marketId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Equities.fromJson(String source) =>
      Equities.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Content(id: $id,  deleted: $deleted, issueDate: $issueDate, secId: $secId, isin: $isin, secDesc: $secDesc, secNotes: $secNotes, imageUrl: $imageUrl, settlementDays: $settlementDays, status: $status, type: $type, allowShorts: $allowShorts, logo: $logo, logoFileName: $logoFileName, logoMimeType: $logoMimeType, price: $price, currency: $currency, parValue: $parValue, priceConvRatio: $priceConvRatio, longMarginReq: $longMarginReq, shortMarginReq: $shortMarginReq, minOrderQuantity: $minOrderQuantity, maxOrderQuantity: $maxOrderQuantity, orderSizeStep: $orderSizeStep, allowFractions: $allowFractions, allowMargin: $allowMargin, industry: $industry, superSector: $superSector, sector: $sector, subSector: $subSector, classificationId: $classificationId, marketCode: $marketCode, marketId: $marketId)';
  }

  @override
  bool operator ==(covariant Equities other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        // other.createdBy == createdBy &&
        // other.createdAt == createdAt &&
        // other.updatedBy == updatedBy &&
        // other.updatedAt == updatedAt &&
        other.deleted == deleted &&
        other.issueDate == issueDate &&
        other.secId == secId &&
        other.isin == isin &&
        other.secDesc == secDesc &&
        other.secNotes == secNotes &&
        other.imageUrl == imageUrl &&
        other.settlementDays == settlementDays &&
        other.status == status &&
        other.type == type &&
        other.allowShorts == allowShorts &&
        other.logo == logo &&
        other.logoFileName == logoFileName &&
        other.logoMimeType == logoMimeType &&
        other.price == price &&
        other.currency == currency &&
        other.parValue == parValue &&
        other.priceConvRatio == priceConvRatio &&
        other.longMarginReq == longMarginReq &&
        other.shortMarginReq == shortMarginReq &&
        other.minOrderQuantity == minOrderQuantity &&
        other.maxOrderQuantity == maxOrderQuantity &&
        other.orderSizeStep == orderSizeStep &&
        other.allowFractions == allowFractions &&
        other.allowMargin == allowMargin &&
        other.industry == industry &&
        other.superSector == superSector &&
        other.sector == sector &&
        other.subSector == subSector &&
        other.classificationId == classificationId &&
        other.marketCode == marketCode &&
        other.marketId == marketId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        // createdBy.hashCode ^
        // createdAt.hashCode ^
        // updatedBy.hashCode ^
        // updatedAt.hashCode ^
        deleted.hashCode ^
        issueDate.hashCode ^
        secId.hashCode ^
        isin.hashCode ^
        secDesc.hashCode ^
        secNotes.hashCode ^
        imageUrl.hashCode ^
        settlementDays.hashCode ^
        status.hashCode ^
        type.hashCode ^
        allowShorts.hashCode ^
        logo.hashCode ^
        logoFileName.hashCode ^
        logoMimeType.hashCode ^
        price.hashCode ^
        currency.hashCode ^
        parValue.hashCode ^
        priceConvRatio.hashCode ^
        longMarginReq.hashCode ^
        shortMarginReq.hashCode ^
        minOrderQuantity.hashCode ^
        maxOrderQuantity.hashCode ^
        orderSizeStep.hashCode ^
        allowFractions.hashCode ^
        allowMargin.hashCode ^
        industry.hashCode ^
        superSector.hashCode ^
        sector.hashCode ^
        subSector.hashCode ^
        classificationId.hashCode ^
        marketCode.hashCode ^
        marketId.hashCode;
  }
}
