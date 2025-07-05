// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class UserProfileModel {
  int? id;
  // DateTime? updatedAt;
  // DateTime? createdAt;
  bool? deleted;
  bool? suspended;
  String? titleCd;
  String? lastName;
  String? firstName;
  String? middleName;
  String? otherNames;
  int? genderCd;
  String? maritalStatusCd;
  String? birthDate;
  String? motherMaidenName;
  String? weddingAnniversaryDate;
  String? nationalityCd;
  String? originState;
  String? alternatePhoneNo;
  String? primaryEmailAddress;
  String? primaryPhoneNo;
  String? alternateEmailAddress;
  String? occupation;
  String? politicallyExposed;
  String? corporateTypeDm;
  String? organizationName;
  String? registrationNumber;
  String? registrationDate;
  String? registrationCountryCd;
  String? taxIdentificationNumber;
  String? businessSectorCd;
  bool? usMarket;
  String? dormAccountCurrency;
  String? customerRemarks;
  int? userType;
  bool? isVerified;
  String? referrer;
  String? referrerSource;
  String? previousChn;
  String? product;
  String? businessInvolvement;
  String? involvementType;
  String? authorisedSignatureName;
  String? accountOpeningProduct;
  String? rejectionReasons;
  String? customerReference;
  String? custId;
  String? camId;
  String? secId;
  bool? isEmailVerified;
  bool? sentToNeulogic;
  bool? sentToZanibal;
  bool? isCsrl;
  String? lastLogonDate;
  String? userName;
  String? fullName;
  String? adminName;
  String? profilePicture;
  UserProfileModel({
    this.id,
    this.deleted,
    this.suspended,
    this.titleCd,
    this.lastName,
    this.firstName,
    this.middleName,
    this.otherNames,
    this.genderCd,
    this.maritalStatusCd,
    this.birthDate,
    this.motherMaidenName,
    this.weddingAnniversaryDate,
    this.nationalityCd,
    this.originState,
    this.alternatePhoneNo,
    this.primaryEmailAddress,
    this.primaryPhoneNo,
    this.alternateEmailAddress,
    this.occupation,
    this.politicallyExposed,
    this.corporateTypeDm,
    this.organizationName,
    this.registrationNumber,
    this.registrationDate,
    this.registrationCountryCd,
    this.taxIdentificationNumber,
    this.businessSectorCd,
    this.usMarket,
    this.dormAccountCurrency,
    this.customerRemarks,
    this.userType,
    this.isVerified,
    this.referrer,
    this.referrerSource,
    this.previousChn,
    this.product,
    this.businessInvolvement,
    this.involvementType,
    this.authorisedSignatureName,
    this.accountOpeningProduct,
    this.rejectionReasons,
    this.customerReference,
    this.custId,
    this.camId,
    this.secId,
    this.isEmailVerified,
    this.sentToNeulogic,
    this.sentToZanibal,
    this.isCsrl,
    this.lastLogonDate,
    this.userName,
    this.fullName,
    this.adminName,
    this.profilePicture,
  });

  UserProfileModel copyWith({
    int? id,
    bool? deleted,
    bool? suspended,
    String? titleCd,
    String? lastName,
    String? firstName,
    String? middleName,
    String? otherNames,
    int? genderCd,
    String? maritalStatusCd,
    String? birthDate,
    String? motherMaidenName,
    String? weddingAnniversaryDate,
    String? nationalityCd,
    String? originState,
    String? alternatePhoneNo,
    String? primaryEmailAddress,
    String? primaryPhoneNo,
    String? alternateEmailAddress,
    String? occupation,
    String? politicallyExposed,
    String? corporateTypeDm,
    String? organizationName,
    String? registrationNumber,
    String? registrationDate,
    String? registrationCountryCd,
    String? taxIdentificationNumber,
    String? businessSectorCd,
    bool? usMarket,
    String? dormAccountCurrency,
    String? customerRemarks,
    int? userType,
    bool? isVerified,
    String? referrer,
    String? referrerSource,
    String? previousChn,
    String? product,
    String? businessInvolvement,
    String? involvementType,
    String? authorisedSignatureName,
    String? accountOpeningProduct,
    String? rejectionReasons,
    String? customerReference,
    String? custId,
    String? camId,
    String? secId,
    bool? isEmailVerified,
    bool? sentToNeulogic,
    bool? sentToZanibal,
    bool? isCsrl,
    String? lastLogonDate,
    String? userName,
    String? fullName,
    String? adminName,
    String? profilePicture,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      deleted: deleted ?? this.deleted,
      suspended: suspended ?? this.suspended,
      titleCd: titleCd ?? this.titleCd,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      otherNames: otherNames ?? this.otherNames,
      genderCd: genderCd ?? this.genderCd,
      maritalStatusCd: maritalStatusCd ?? this.maritalStatusCd,
      birthDate: birthDate ?? this.birthDate,
      motherMaidenName: motherMaidenName ?? this.motherMaidenName,
      weddingAnniversaryDate:
          weddingAnniversaryDate ?? this.weddingAnniversaryDate,
      nationalityCd: nationalityCd ?? this.nationalityCd,
      originState: originState ?? this.originState,
      alternatePhoneNo: alternatePhoneNo ?? this.alternatePhoneNo,
      primaryEmailAddress: primaryEmailAddress ?? this.primaryEmailAddress,
      primaryPhoneNo: primaryPhoneNo ?? this.primaryPhoneNo,
      alternateEmailAddress:
          alternateEmailAddress ?? this.alternateEmailAddress,
      occupation: occupation ?? this.occupation,
      politicallyExposed: politicallyExposed ?? this.politicallyExposed,
      corporateTypeDm: corporateTypeDm ?? this.corporateTypeDm,
      organizationName: organizationName ?? this.organizationName,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      registrationCountryCd:
          registrationCountryCd ?? this.registrationCountryCd,
      taxIdentificationNumber:
          taxIdentificationNumber ?? this.taxIdentificationNumber,
      businessSectorCd: businessSectorCd ?? this.businessSectorCd,
      usMarket: usMarket ?? this.usMarket,
      dormAccountCurrency: dormAccountCurrency ?? this.dormAccountCurrency,
      customerRemarks: customerRemarks ?? this.customerRemarks,
      userType: userType ?? this.userType,
      isVerified: isVerified ?? this.isVerified,
      referrer: referrer ?? this.referrer,
      referrerSource: referrerSource ?? this.referrerSource,
      previousChn: previousChn ?? this.previousChn,
      product: product ?? this.product,
      businessInvolvement: businessInvolvement ?? this.businessInvolvement,
      involvementType: involvementType ?? this.involvementType,
      authorisedSignatureName:
          authorisedSignatureName ?? this.authorisedSignatureName,
      accountOpeningProduct:
          accountOpeningProduct ?? this.accountOpeningProduct,
      rejectionReasons: rejectionReasons ?? this.rejectionReasons,
      customerReference: customerReference ?? this.customerReference,
      custId: custId ?? this.custId,
      camId: camId ?? this.camId,
      secId: secId ?? this.secId,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      sentToNeulogic: sentToNeulogic ?? this.sentToNeulogic,
      sentToZanibal: sentToZanibal ?? this.sentToZanibal,
      isCsrl: isCsrl ?? this.isCsrl,
      lastLogonDate: lastLogonDate ?? this.lastLogonDate,
      userName: userName ?? this.userName,
      fullName: fullName ?? this.fullName,
      adminName: adminName ?? this.adminName,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'deleted': deleted,
      'suspended': suspended,
      'titleCd': titleCd,
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'otherNames': otherNames,
      'genderCd': genderCd,
      'maritalStatusCd': maritalStatusCd,
      'birthDate': birthDate,
      'motherMaidenName': motherMaidenName,
      'weddingAnniversaryDate': weddingAnniversaryDate,
      'nationalityCd': nationalityCd,
      'originState': originState,
      'alternatePhoneNo': alternatePhoneNo,
      'primaryEmailAddress': primaryEmailAddress,
      'primaryPhoneNo': primaryPhoneNo,
      'alternateEmailAddress': alternateEmailAddress,
      'occupation': occupation,
      'politicallyExposed': politicallyExposed,
      'corporateTypeDm': corporateTypeDm,
      'organizationName': organizationName,
      'registrationNumber': registrationNumber,
      'registrationDate': registrationDate,
      'registrationCountryCd': registrationCountryCd,
      'taxIdentificationNumber': taxIdentificationNumber,
      'businessSectorCd': businessSectorCd,
      'usMarket': usMarket,
      'dormAccountCurrency': dormAccountCurrency,
      'customerRemarks': customerRemarks,
      'userType': userType,
      'isVerified': isVerified,
      'referrer': referrer,
      'referrerSource': referrerSource,
      'previousChn': previousChn,
      'product': product,
      'businessInvolvement': businessInvolvement,
      'involvementType': involvementType,
      'authorisedSignatureName': authorisedSignatureName,
      'accountOpeningProduct': accountOpeningProduct,
      'rejectionReasons': rejectionReasons,
      'customerReference': customerReference,
      'custId': custId,
      'camId': camId,
      'secId': secId,
      'isEmailVerified': isEmailVerified,
      'sentToNeulogic': sentToNeulogic,
      'sentToZanibal': sentToZanibal,
      'isCsrl': isCsrl,
      'lastLogonDate': lastLogonDate,
      'userName': userName,
      'fullName': fullName,
      'adminName': adminName,
      'profilePicture': profilePicture,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] != null ? map['id'] as int : null,
      deleted: map['deleted'] != null ? map['deleted'] as bool : null,
      suspended: map['suspended'] != null ? map['suspended'] as bool : null,
      titleCd: map['title_cd'] != null ? map['title_cd'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      middleName:
          map['middle_name'] != null ? map['middle_name'] as String : null,
      otherNames:
          map['other_names'] != null ? map['other_names'] as String : null,
      genderCd: map['gender_cd'] != null ? map['gender_cd'] as int : null,
      maritalStatusCd: map['marital_status_cd'] != null
          ? map['marital_status_cd'] as String
          : null,
      birthDate: map['birth_date'] != null ? map['birth_date'] as String : null,
      motherMaidenName: map['mother_maiden_name'] != null
          ? map['mother_maiden_name'] as String
          : null,
      weddingAnniversaryDate: map['wedding_anniversary_date'] != null
          ? map['wedding_anniversary_date'] as String
          : null,
      nationalityCd: map['nationality_cd'] != null
          ? map['nationality_cd'] as String
          : null,
      originState:
          map['origin_state'] != null ? map['origin_state'] as String : null,
      alternatePhoneNo: map['alternate_phone_no'] != null
          ? map['alternate_phone_no'] as String
          : null,
      primaryEmailAddress: map['primary_email_address'] != null
          ? map['primary_email_address'] as String
          : null,
      primaryPhoneNo: map['primary_phone_no'] != null
          ? map['primary_phone_no'] as String
          : null,
      alternateEmailAddress: map['alternate_email_address'] != null
          ? map['alternate_email_address'] as String
          : null,
      occupation:
          map['occupation'] != null ? map['occupation'] as String : null,
      politicallyExposed: map['politically_exposed'] != null
          ? map['politically_exposed'] as String
          : null,
      corporateTypeDm: map['corporate_type_dm'] != null
          ? map['corporate_type_dm'] as String
          : null,
      organizationName: map['organization_name'] != null
          ? map['organization_name'] as String
          : null,
      registrationNumber: map['registration_number'] != null
          ? map['registration_number'] as String
          : null,
      registrationDate: map['registration_date'] != null
          ? map['registration_date'] as String
          : null,
      registrationCountryCd: map['registration_country_cd'] != null
          ? map['registration_country_cd'] as String
          : null,
      taxIdentificationNumber: map['tax_identification_number'] != null
          ? map['tax_identification_number'] as String
          : null,
      businessSectorCd: map['business_sector_cd'] != null
          ? map['business_sector_cd'] as String
          : null,
      usMarket: map['us_market'] != null ? map['us_market'] as bool : null,
      dormAccountCurrency: map['dorm_account_currency'] != null
          ? map['dorm_account_currency'] as String
          : null,
      customerRemarks: map['customer_remarks'] != null
          ? map['customer_remarks'] as String
          : null,
      userType: map['user_type'] != null ? map['user_type'] as int : null,
      isVerified:
          map['is_verified'] != null ? map['is_verified'] as bool : null,
      referrer: map['referrer'] != null ? map['referrer'] as String : null,
      referrerSource: map['referrer_source'] != null
          ? map['referrer_source'] as String
          : null,
      previousChn:
          map['previous_chn'] != null ? map['previous_chn'] as String : null,
      product: map['product'] != null ? map['product'] as String : null,
      businessInvolvement: map['business_involvement'] != null
          ? map['business_involvement'] as String
          : null,
      involvementType: map['involvement_type'] != null
          ? map['involvement_type'] as String
          : null,
      authorisedSignatureName: map['authorised_signature_name'] != null
          ? map['authorised_signature_name'] as String
          : null,
      accountOpeningProduct: map['account_opening_product'] != null
          ? map['account_opening_product'] as String
          : null,
      rejectionReasons: map['rejectionReasons'] != null
          ? map['rejectionReasons'] as String
          : null,
      customerReference: map['customerReference'] != null
          ? map['customerReference'] as String
          : null,
      custId: map['CustID'] != null ? map['CustID'] as String : null,
      camId: map['CAM_ID'] != null ? map['CAM_ID'] as String : null,
      secId: map['SEC_ID'] != null ? map['SEC_ID'] as String : null,
      isEmailVerified: map['is_email_verified'] != null
          ? map['is_email_verified'] as bool
          : null,
      sentToNeulogic: map['sent_to_neulogic'] != null
          ? map['sent_to_neulogic'] as bool
          : null,
      sentToZanibal: map['sent_to_zanibal'] != null
          ? map['sent_to_zanibal'] as bool
          : null,
      isCsrl: map['isCSRL'] != null ? map['isCSRL'] as bool : null,
      lastLogonDate:
          map['lastLogonDate'] != null ? map['lastLogonDate'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      adminName: map['adminName'] != null ? map['adminName'] as String : null,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfileModel(id: $id, deleted: $deleted, suspended: $suspended, titleCd: $titleCd, lastName: $lastName, firstName: $firstName, middleName: $middleName, otherNames: $otherNames, genderCd: $genderCd, maritalStatusCd: $maritalStatusCd, birthDate: $birthDate, motherMaidenName: $motherMaidenName, weddingAnniversaryDate: $weddingAnniversaryDate, nationalityCd: $nationalityCd, originState: $originState, alternatePhoneNo: $alternatePhoneNo, primaryEmailAddress: $primaryEmailAddress, primaryPhoneNo: $primaryPhoneNo, alternateEmailAddress: $alternateEmailAddress, occupation: $occupation, politicallyExposed: $politicallyExposed, corporateTypeDm: $corporateTypeDm, organizationName: $organizationName, registrationNumber: $registrationNumber, registrationDate: $registrationDate, registrationCountryCd: $registrationCountryCd, taxIdentificationNumber: $taxIdentificationNumber, businessSectorCd: $businessSectorCd, usMarket: $usMarket, dormAccountCurrency: $dormAccountCurrency, customerRemarks: $customerRemarks, userType: $userType, isVerified: $isVerified, referrer: $referrer, referrerSource: $referrerSource, previousChn: $previousChn, product: $product, businessInvolvement: $businessInvolvement, involvementType: $involvementType, authorisedSignatureName: $authorisedSignatureName, accountOpeningProduct: $accountOpeningProduct, rejectionReasons: $rejectionReasons, customerReference: $customerReference, custId: $custId, camId: $camId, secId: $secId, isEmailVerified: $isEmailVerified, sentToNeulogic: $sentToNeulogic, sentToZanibal: $sentToZanibal, isCsrl: $isCsrl, lastLogonDate: $lastLogonDate, userName: $userName, fullName: $fullName, adminName: $adminName, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(covariant UserProfileModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.deleted == deleted &&
        other.suspended == suspended &&
        other.titleCd == titleCd &&
        other.lastName == lastName &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.otherNames == otherNames &&
        other.genderCd == genderCd &&
        other.maritalStatusCd == maritalStatusCd &&
        other.birthDate == birthDate &&
        other.motherMaidenName == motherMaidenName &&
        other.weddingAnniversaryDate == weddingAnniversaryDate &&
        other.nationalityCd == nationalityCd &&
        other.originState == originState &&
        other.alternatePhoneNo == alternatePhoneNo &&
        other.primaryEmailAddress == primaryEmailAddress &&
        other.primaryPhoneNo == primaryPhoneNo &&
        other.alternateEmailAddress == alternateEmailAddress &&
        other.occupation == occupation &&
        other.politicallyExposed == politicallyExposed &&
        other.corporateTypeDm == corporateTypeDm &&
        other.organizationName == organizationName &&
        other.registrationNumber == registrationNumber &&
        other.registrationDate == registrationDate &&
        other.registrationCountryCd == registrationCountryCd &&
        other.taxIdentificationNumber == taxIdentificationNumber &&
        other.businessSectorCd == businessSectorCd &&
        other.usMarket == usMarket &&
        other.dormAccountCurrency == dormAccountCurrency &&
        other.customerRemarks == customerRemarks &&
        other.userType == userType &&
        other.isVerified == isVerified &&
        other.referrer == referrer &&
        other.referrerSource == referrerSource &&
        other.previousChn == previousChn &&
        other.product == product &&
        other.businessInvolvement == businessInvolvement &&
        other.involvementType == involvementType &&
        other.authorisedSignatureName == authorisedSignatureName &&
        other.accountOpeningProduct == accountOpeningProduct &&
        other.rejectionReasons == rejectionReasons &&
        other.customerReference == customerReference &&
        other.custId == custId &&
        other.camId == camId &&
        other.secId == secId &&
        other.isEmailVerified == isEmailVerified &&
        other.sentToNeulogic == sentToNeulogic &&
        other.sentToZanibal == sentToZanibal &&
        other.isCsrl == isCsrl &&
        other.lastLogonDate == lastLogonDate &&
        other.userName == userName &&
        other.fullName == fullName &&
        other.adminName == adminName &&
        other.profilePicture == profilePicture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        deleted.hashCode ^
        suspended.hashCode ^
        titleCd.hashCode ^
        lastName.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        otherNames.hashCode ^
        genderCd.hashCode ^
        maritalStatusCd.hashCode ^
        birthDate.hashCode ^
        motherMaidenName.hashCode ^
        weddingAnniversaryDate.hashCode ^
        nationalityCd.hashCode ^
        originState.hashCode ^
        alternatePhoneNo.hashCode ^
        primaryEmailAddress.hashCode ^
        primaryPhoneNo.hashCode ^
        alternateEmailAddress.hashCode ^
        occupation.hashCode ^
        politicallyExposed.hashCode ^
        corporateTypeDm.hashCode ^
        organizationName.hashCode ^
        registrationNumber.hashCode ^
        registrationDate.hashCode ^
        registrationCountryCd.hashCode ^
        taxIdentificationNumber.hashCode ^
        businessSectorCd.hashCode ^
        usMarket.hashCode ^
        dormAccountCurrency.hashCode ^
        customerRemarks.hashCode ^
        userType.hashCode ^
        isVerified.hashCode ^
        referrer.hashCode ^
        referrerSource.hashCode ^
        previousChn.hashCode ^
        product.hashCode ^
        businessInvolvement.hashCode ^
        involvementType.hashCode ^
        authorisedSignatureName.hashCode ^
        accountOpeningProduct.hashCode ^
        rejectionReasons.hashCode ^
        customerReference.hashCode ^
        custId.hashCode ^
        camId.hashCode ^
        secId.hashCode ^
        isEmailVerified.hashCode ^
        sentToNeulogic.hashCode ^
        sentToZanibal.hashCode ^
        isCsrl.hashCode ^
        lastLogonDate.hashCode ^
        userName.hashCode ^
        fullName.hashCode ^
        adminName.hashCode ^
        profilePicture.hashCode;
  }
}

class UpdateUserProfileModel {
  File? profilePicture;
  String fileName;
  String username;
  String otherName;
  String maritalStatus;
  String gender;

  UpdateUserProfileModel({
    required this.profilePicture,
    required this.fileName,
    required this.username,
    required this.otherName,
    required this.maritalStatus,
    required this.gender,
  });

  UpdateUserProfileModel copyWith({
    File? profilePicture,
    String? fileName,
    String? username,
    String? otherName,
    String? maritalStatus,
    String? gender,
  }) {
    return UpdateUserProfileModel(
      profilePicture: profilePicture ?? this.profilePicture,
      fileName: fileName ?? this.fileName,
      username: username ?? this.username,
      otherName: otherName ?? this.otherName,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      gender: gender ?? this.gender,
    );
  }
}
