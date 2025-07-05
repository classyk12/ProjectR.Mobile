import 'dart:convert';

class BvnData {
  bool? isBvnVerified;

  BvnData({
    this.isBvnVerified,
  });

  BvnData copyWith({
    bool? isBvnVerified,
  }) =>
      BvnData(
        isBvnVerified: isBvnVerified ?? this.isBvnVerified,
      );

  factory BvnData.fromRawJson(String str) => BvnData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BvnData.fromJson(Map<String, dynamic> json) => BvnData(
        isBvnVerified: json["isBVNVerified"],
      );

  Map<String, dynamic> toJson() => {
        "isBVNVerified": isBvnVerified,
      };
}
