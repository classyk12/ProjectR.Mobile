import 'dart:io';

class SignUpModel {
  File? identityDocument;
  File? proofOfAddress;
  File? cac;
  File? passport;
  File? signature;
  File? facta;
  File? birthCert;
  File? coi;
  File? memorandum;
  String? identityDocumentFileName;
  String? proofOfAddressFileName;
  String? cacFileName;
  String? passportFileName;
  String? signatureFileName;
  String? factaFileName;
  String? birthCertFileName;
  String? coiFileName;
  String? memorandumFileName;

  bool? usMarket;
  String? maritalStatus;
  String? accountOpeningProduct;
  dynamic businessInvolvements;
  String? involvementType;
  dynamic involvementTypeBusiness;
  String? accountType;
  String? firstName;
  String? lastName;
  String? employmentType;
  String? employerName;
  String? employerAddress;
  String? bankAcctName2;
  String? bankName2;
  String? bankAcctNumber2;
  String? swiftCode;
  String? othernames;
  String? gender;
  String? dateOfBirth;
  String? emailAddress;
  String? phoneNumber;
  String? bVNNumber;
  String? previousCHN;
  String? maidenName;
  String? address;
  String? country;
  String? state;
  String? bankAcctName;
  String? bankAcctNumber;
  String? bankName;
  String? residency;
  String? sortCode;
  String? bankCode;
  String? aggrementCheck;

  String? identityType;
  String? identityNumber;
  String? identityExpiryDate;
  String? title;
  String? occupation;
  String? bankCode2;
  String? correspondentAcctNo;
  String? correspondentName;
  String? beneficiaryName;
  String? beneficiaryAcctNo;
  String? beneficiaryBankName;
  String? beneficiaryBankAddress;
  String? product;
  String? bvnFirstName;
  String? bvnMiddleName;
  String? bvnLastName;
  String? referral;
  String? referralSource;
  //Other Personal Information
  String? countryOfTaxResidence;
  String? stateOfTaxResidence;
  String? cityOfTaxResidence;
  String? lgaOfTaxResidence;
//Next of Kins
  String? nextOfKinFirstName;
  String? nextOfKinLastName;
  String? nextOfKinPhone;
  String? nextOfKinEmail;
  String? nextOfKinAddress;
  String? nextOfKinGender;
  String? nextOfKinDOB;
  String? nextOfKinRelationship;

  //corporate signup
  String? companyName;
  String? dateOfIncorporation;
  String? businessRegistrationNumber;
  String? authorisedSignatureName;

  //primaryContactInformation
  String? primaryContactDesignation;
  String? primaryContactFirstName;
  String? primaryContactLastName;
  String? primaryContactPhoneNumber;
  String? primaryContactEmail;
  String? primaryContactAddress;
  String? primaryContactDOB;

  SignUpModel(
      {this.bVNNumber,
      this.bankName2,
      this.involvementTypeBusiness,
      this.lgaOfTaxResidence,
      this.title,
      this.usMarket,
      this.accountOpeningProduct,
      this.accountType,
      this.address,
      this.aggrementCheck,
      this.authorisedSignatureName,
      this.bankAcctName,
      this.bankAcctName2,
      this.bankAcctNumber,
      this.bankAcctNumber2,
      this.bankCode,
      this.bankCode2,
      this.bankName,
      this.beneficiaryAcctNo,
      this.beneficiaryBankAddress,
      this.beneficiaryBankName,
      this.beneficiaryName,
      this.birthCert,
      this.businessInvolvements,
      this.cityOfTaxResidence,
      this.companyName,
      this.correspondentAcctNo,
      this.correspondentName,
      this.country,
      this.dateOfBirth,
      this.emailAddress,
      this.employerAddress,
      this.employerName,
      this.employmentType,
      this.facta,
      this.firstName,
      this.gender,
      this.identityDocument,
      this.identityExpiryDate,
      this.identityNumber,
      this.identityType,
      this.involvementType,
      this.lastName,
      this.maidenName,
      this.nextOfKinFirstName,
      this.nextOfKinLastName,
      this.nextOfKinAddress,
      this.nextOfKinDOB,
      this.nextOfKinEmail,
      this.nextOfKinGender,
      this.nextOfKinPhone,
      this.nextOfKinRelationship,
      this.occupation,
      this.othernames,
      this.passport,
      this.phoneNumber,
      this.previousCHN,
      this.proofOfAddress,
      this.residency,
      this.signature,
      this.sortCode,
      this.state,
      this.swiftCode,
      this.product,
      this.bvnFirstName,
      this.bvnLastName,
      this.bvnMiddleName,
      this.referral,
      this.referralSource,
      this.maritalStatus,
      this.countryOfTaxResidence,
      this.stateOfTaxResidence,
      this.identityDocumentFileName,
      this.proofOfAddressFileName,
      this.passportFileName,
      this.signatureFileName,
      this.factaFileName,
      this.birthCertFileName,
      this.dateOfIncorporation});
}
