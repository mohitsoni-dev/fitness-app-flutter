import 'package:fitness_app_flutter/core/models/answer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  String id;
  String question;
  String desc;
  String date;
  bool isPrivate;
  String author;
  String topic;
  bool isAnswered;
  Answer answer;

  Question({
    required this.id,
    required this.question,
    required this.desc,
    required this.date,
    required this.isPrivate,
    required this.author,
    required this.topic,
    required this.isAnswered,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
