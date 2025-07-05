class PostionReportModel {
  final PostionReportData data;
  final DateTime date;

  PostionReportModel({
    required this.data,
    required this.date,
  });

  factory PostionReportModel.fromJson(Map<String, dynamic> json) =>
      PostionReportModel(
        data: PostionReportData.fromJson(json["data"]),
        date: DateTime.parse(json["date"]),
      );
}

class PostionReportData {
  final num totalValue;
  final num gainLoss;
  final num gainLossPercent;

  PostionReportData({
    required this.totalValue,
    required this.gainLoss,
    required this.gainLossPercent,
  });

  factory PostionReportData.fromJson(Map<String, dynamic> json) =>
      PostionReportData(
        totalValue: json["totalValue"],
        gainLoss: json["gainLoss"],
        gainLossPercent: json["gainLossPercent"],
      );

  Map<String, dynamic> toJson() => {
        "totalValue": totalValue,
        "gainLoss": gainLoss,
        "gainLossPercent": gainLossPercent,
      };
}
