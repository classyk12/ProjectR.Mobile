class FeaturedProductModel {
  int id;
  String name;
  String description;
  String pictureUrl;
  int adPosition;
  dynamic webUrl;
  int active;
  DateTime createdAt;

  FeaturedProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureUrl,
    required this.adPosition,
    required this.webUrl,
    required this.active,
    required this.createdAt,
  });

  factory FeaturedProductModel.fromJson(Map<String, dynamic> json) =>
      FeaturedProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        pictureUrl: json["picture_url"] ?? '',
        adPosition: json["ad_position"] ?? '',
        webUrl: json["web_url"] ?? '',
        active: json["active"] ?? '',
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "picture_url": pictureUrl,
        "ad_position": adPosition,
        "web_url": webUrl,
        "active": active,
        "created_at": createdAt.toIso8601String(),
      };
}
