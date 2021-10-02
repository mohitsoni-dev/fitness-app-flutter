// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    title: json['title'] as String,
    id: json['_id'] as String,
    body: json['body'] as String,
    date: json['date'] as String,
    image: json['image'] as String,
    source: json['source'] as String,
    author: json['author'],
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
      'image': instance.image,
      'source': instance.source,
      'author': instance.author,
    };
