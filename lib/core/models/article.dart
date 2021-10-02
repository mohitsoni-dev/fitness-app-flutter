import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  String id;
  String title;
  String body;
  String date;
  String image;
  String source;
  String? author;

  Article({
    required this.title,
    required this.id,
    required this.body,
    required this.date,
    required this.image,
    required this.source,
    this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
