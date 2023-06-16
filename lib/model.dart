import 'dart:convert';

List<ApiDemoModel> apiDemoModelFromJson(String str) => List<ApiDemoModel>.from(json.decode(str).map((x) => ApiDemoModel.fromJson(x)));

String apiDemoModelToJson(List<ApiDemoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiDemoModel {
  int userId;
  int id;
  String title;
  String body;

  ApiDemoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ApiDemoModel.fromJson(Map<String, dynamic> json) => ApiDemoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
