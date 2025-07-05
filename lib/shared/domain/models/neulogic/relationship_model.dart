import 'dart:convert';

RelationShipsResponseModel cashAccountTransactionResponseModelFromJson(
        String str) =>
    RelationShipsResponseModel.fromJson(json.decode(str));

class RelationShipsResponseModel {
  final String status;
  final List<Result> result;

  RelationShipsResponseModel({
    required this.status,
    required this.result,
  });

  factory RelationShipsResponseModel.fromJson(Map<String, dynamic> json) =>
      RelationShipsResponseModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  final List<RelationShipModel> items;

  Result({
    required this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        items: List<RelationShipModel>.from(
            json["relation"].map((x) => RelationShipModel.fromJson(x))),
      );
}

class RelationShipModel {
  final String id;
  final String code;

  RelationShipModel({required this.id, required this.code});

  factory RelationShipModel.fromJson(Map<String, dynamic> json) =>
      RelationShipModel(
          id: json["RELATIONSHIP_CD"], code: json["RELATIONSHIP_DSC"]);
}
