// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

List<NewsEntry> newsEntryFromJson(String str) =>
    List<NewsEntry>.from(json.decode(str).map((x) => NewsEntry.fromJson(x)));

String newsEntryToJson(List<NewsEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsEntry {
  String id;
  String title;
  String content;
  String category;
  String? thumbnail;          // <-- jadi nullable String
  int newsViews;
  DateTime createdAt;
  bool isFeatured;
  dynamic userId;

  NewsEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.thumbnail,
    required this.newsViews,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory NewsEntry.fromJson(Map<String, dynamic> json) => NewsEntry(
        id: (json["id"] ?? '').toString(),
        title: (json["title"] ?? '').toString(),
        content: (json["content"] ?? '').toString(),
        category: (json["category"] ?? '').toString(),
        thumbnail: (json["thumbnail"] == null || json["thumbnail"] == '')
            ? null
            : json["thumbnail"].toString(),          
        newsViews: (json["news_views"] ?? 0) is int
            ? (json["news_views"] ?? 0)
            : int.tryParse((json["news_views"] ?? '0').toString()) ?? 0,
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"].toString()) ??
                DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.fromMillisecondsSinceEpoch(0), 
        isFeatured: (json["is_featured"] ?? false) == true,
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "category": category,
        "thumbnail": thumbnail,
        "news_views": newsViews,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
      };
}
