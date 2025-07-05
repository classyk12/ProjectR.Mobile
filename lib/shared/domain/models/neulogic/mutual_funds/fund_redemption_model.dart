import 'dart:convert';

class RedeemFundModel {
  String account;
  String date;
  String fund;
  String otp;
  String price;
  num quantity;
  String twoFactorToken;
  int userBankAccountId;
  String currency;
  RedeemFundModel({
    required this.account,
    required this.date,
    required this.fund,
    required this.otp,
    required this.price,
    required this.quantity,
    required this.twoFactorToken,
    required this.userBankAccountId,
    required this.currency,
  });

  RedeemFundModel copyWith({
    String? account,
    String? date,
    String? fund,
    String? otp,
    String? price,
    num? quantity,
    String? twoFactorToken,
    String? currency,
    int? userBankAccountId,
  }) {
    return RedeemFundModel(
      account: account ?? this.account,
      date: date ?? this.date,
      fund: fund ?? this.fund,
      otp: otp ?? this.otp,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      currency: currency ?? this.currency,
      twoFactorToken: twoFactorToken ?? this.twoFactorToken,
      userBankAccountId: userBankAccountId ?? this.userBankAccountId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'account': account,
      'date': date,
      'fund': fund,
      'otp': otp,
      'price': price,
      'quantity': quantity,
      'twoFactorToken': twoFactorToken,
      'userBankAccountId': userBankAccountId,
    };
  }

  factory RedeemFundModel.fromMap(Map<String, dynamic> map) {
    return RedeemFundModel(
      currency: '',
      account: map['account'] as String,
      date: map['date'],
      fund: map['fund'] as String,
      otp: map['otp'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as int,
      twoFactorToken: map['twoFactorToken'] as String,
      userBankAccountId: map['userBankAccountId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RedeemFundModel.fromJson(String source) =>
      RedeemFundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RedeemFundModel(account: $account, date: $date, fund: $fund, otp: $otp, price: $price, quantity: $quantity, twoFactorToken: $twoFactorToken, userBankAccountId: $userBankAccountId)';
  }

  @override
  bool operator ==(covariant RedeemFundModel other) {
    if (identical(this, other)) return true;

    return other.account == account &&
        other.date == date &&
        other.fund == fund &&
        other.otp == otp &&
        other.price == price &&
        other.quantity == quantity &&
        other.twoFactorToken == twoFactorToken &&
        other.userBankAccountId == userBankAccountId;
  }

  @override
  int get hashCode {
    return account.hashCode ^
        date.hashCode ^
        fund.hashCode ^
        otp.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        twoFactorToken.hashCode ^
        userBankAccountId.hashCode;
  }
}
