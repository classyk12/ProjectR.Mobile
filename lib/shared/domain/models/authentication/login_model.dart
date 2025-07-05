// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginResponseModel {
  final LoginUser user;
  final String token;
  LoginResponseModel({
    required this.user,
    required this.token,
  });

  LoginResponseModel copyWith({
    LoginUser? user,
    String? token,
  }) {
    return LoginResponseModel(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'token': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      user: LoginUser.fromMap(map['user']),
      token: map['token'] ?? '',
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

class LoginUser {
  String firstName;
  String lastName;
  dynamic otherNames;
  String fullName;
  String email;
  String companyName;
  String phone;
  String address;
  String addressLga;
  String addressCity;
  String addressState;
  String addressCountry;
  String accountOfficer;
  int id;
  bool hasBusiness;
  String secId;
  String camId;
  dynamic custId;
  String completedTier;
  int currentTier;
  String username;
  String avatar;
  bool is2FaEnabled;
  CurrentTierRequest? currentTierRequest;
  LoginUser({
    required this.firstName,
    required this.lastName,
    required this.otherNames,
    required this.fullName,
    required this.email,
    required this.companyName,
    required this.phone,
    required this.address,
    required this.addressLga,
    required this.addressCity,
    required this.addressState,
    required this.addressCountry,
    required this.accountOfficer,
    required this.id,
    required this.hasBusiness,
    required this.secId,
    required this.camId,
    required this.custId,
    required this.completedTier,
    required this.currentTier,
    required this.username,
    required this.avatar,
    required this.is2FaEnabled,
    required this.currentTierRequest,
  });

  factory LoginUser.initial() {
    return LoginUser(
      firstName: '',
      fullName: '',
      address: '',
      addressCity: '',
      addressCountry: '',
      addressLga: '',
      accountOfficer: '',
      addressState: '',
      avatar: '',
      lastName: '',
      otherNames: '',
      companyName: '',
      phone: '',
      username: '',
      id: 0,
      hasBusiness: false,
      secId: '',
      camId: '',
      completedTier: '0',
      currentTier: 0,
      email: '',
      custId: '',
      is2FaEnabled: false,
      currentTierRequest: CurrentTierRequest.initial(),
    );
  }

  LoginUser copyWith({
    String? firstName,
    String? lastName,
    String? otherNames,
    String? fullName,
    String? email,
    String? companyName,
    String? phone,
    String? address,
    String? addressLga,
    String? addressCity,
    String? addressState,
    String? addressCountry,
    String? accountOfficer,
    int? id,
    bool? hasBusiness,
    String? secId,
    String? camId,
    String? custId,
    String? completedTier,
    int? currentTier,
    String? username,
    String? avatar,
    bool? is2FaEnabled,
    CurrentTierRequest? currentTierRequest,
  }) {
    return LoginUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      otherNames: otherNames ?? this.otherNames,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      companyName: companyName ?? this.companyName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      addressLga: addressLga ?? this.addressLga,
      addressCity: addressCity ?? this.addressCity,
      addressState: addressState ?? this.addressState,
      addressCountry: addressCountry ?? this.addressCountry,
      accountOfficer: accountOfficer ?? this.accountOfficer,
      id: id ?? this.id,
      hasBusiness: hasBusiness ?? this.hasBusiness,
      secId: secId ?? this.secId,
      camId: camId ?? this.camId,
      custId: custId ?? this.custId,
      completedTier: completedTier ?? this.completedTier,
      currentTier: currentTier ?? this.currentTier,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      is2FaEnabled: is2FaEnabled ?? this.is2FaEnabled,
      currentTierRequest: currentTierRequest ?? this.currentTierRequest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'otherNames': otherNames,
      'fullName': fullName,
      'email': email,
      'companyName': companyName,
      'phone': phone,
      'address': address,
      'addressLga': addressLga,
      'addressCity': addressCity,
      'addressState': addressState,
      'addressCountry': addressCountry,
      'accountOfficer': accountOfficer,
      'id': id,
      'hasBusiness': hasBusiness,
      'SEC_ID': secId,
      'CAM_ID': camId,
      'custId': custId,
      'completedTier': completedTier,
      'currentTier': currentTier,
      'username': username,
      'avatar': avatar,
      'is2FaEnabled': is2FaEnabled,
      'currentTierRequest': currentTierRequest?.toMap(),
    };
  }

  factory LoginUser.fromMap(Map<String, dynamic> map) {
    return LoginUser(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      otherNames: map['otherNames'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      companyName: map['companyName'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      addressLga: map['addressLga'] ?? '',
      addressCity: map['addressCity'] ?? '',
      addressState: map['addressState'] ?? '',
      addressCountry: map['addressCountry'] ?? '',
      accountOfficer: map['accountOfficer'] ?? '',
      id: map['id'] ?? 0,
      hasBusiness: map['hasBusiness'] ?? false,
      secId: map['SEC_ID'] ?? '',
      camId: map['CAM_ID'] ?? '',
      custId: map['custId'] ?? '',
      completedTier: map['completedTier'] ?? '',
      currentTier: map['currentTier'] ?? 0,
      username: map['username'] ?? '',
      avatar: map['avatar'] ?? '',
      is2FaEnabled: map['is2FaEnabled'] ?? false,
      currentTierRequest: map['currentKycRequest'] != null
          ? CurrentTierRequest.fromMap(map['currentKycRequest'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUser.fromJson(String source) =>
      LoginUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginUser(firstName: $firstName, lastName: $lastName, otherNames: $otherNames, fullName: $fullName, email: $email, companyName: $companyName, phone: $phone, address: $address, addressLga: $addressLga, addressCity: $addressCity, addressState: $addressState, addressCountry: $addressCountry, accountOfficer: $accountOfficer, id: $id, hasBusiness: $hasBusiness, secId: $secId, camId: $camId, custId: $custId, completedTier: $completedTier, currentTier: $currentTier, username: $username, avatar: $avatar, is2FaEnabled: $is2FaEnabled, currentTierRequest: $currentTierRequest)';
  }

  @override
  bool operator ==(covariant LoginUser other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.otherNames == otherNames &&
        other.fullName == fullName &&
        other.email == email &&
        other.companyName == companyName &&
        other.phone == phone &&
        other.address == address &&
        other.addressLga == addressLga &&
        other.addressCity == addressCity &&
        other.addressState == addressState &&
        other.addressCountry == addressCountry &&
        other.accountOfficer == accountOfficer &&
        other.id == id &&
        other.hasBusiness == hasBusiness &&
        other.secId == secId &&
        other.camId == camId &&
        other.custId == custId &&
        other.completedTier == completedTier &&
        other.currentTier == currentTier &&
        other.username == username &&
        other.avatar == avatar &&
        other.is2FaEnabled == is2FaEnabled &&
        other.currentTierRequest == currentTierRequest;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        otherNames.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        companyName.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        addressLga.hashCode ^
        addressCity.hashCode ^
        addressState.hashCode ^
        addressCountry.hashCode ^
        accountOfficer.hashCode ^
        id.hashCode ^
        hasBusiness.hashCode ^
        secId.hashCode ^
        camId.hashCode ^
        custId.hashCode ^
        completedTier.hashCode ^
        currentTier.hashCode ^
        username.hashCode ^
        avatar.hashCode ^
        is2FaEnabled.hashCode ^
        currentTierRequest.hashCode;
  }
}

class UserData {
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  UserData({
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  UserData copyWith({
    String? userName,
    String? password,
    String? firstName,
    String? lastName,
  }) {
    return UserData(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userName: map['userName'] as String,
      password: map['password'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(userName: $userName, password: $password, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode;
  }
}

class CurrentTierRequest {
  String requestType;
  String status;
  CurrentTierRequest({
    required this.requestType,
    required this.status,
  });

  factory CurrentTierRequest.initial() {
    return CurrentTierRequest(
      requestType: '',
      status: '',
    );
  }
  CurrentTierRequest copyWith({
    String? requestType,
    String? status,
  }) {
    return CurrentTierRequest(
      requestType: requestType ?? this.requestType,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'requestType': requestType,
      'status': status,
    };
  }

  factory CurrentTierRequest.fromMap(Map<String, dynamic> map) {
    return CurrentTierRequest(
      requestType: map['requestType'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentTierRequest.fromJson(String source) =>
      CurrentTierRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CurrentTierRequest(requestType: $requestType, status: $status)';

  @override
  bool operator ==(covariant CurrentTierRequest other) {
    if (identical(this, other)) return true;

    return other.requestType == requestType && other.status == status;
  }

  @override
  int get hashCode => requestType.hashCode ^ status.hashCode;
}
