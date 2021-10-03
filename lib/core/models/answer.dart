import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  String expertAns;
  List<String> answers;

  Answer({
    required this.expertAns,
    required this.answers,
  });

  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
