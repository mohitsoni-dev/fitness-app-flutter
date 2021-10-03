// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    id: json['_id'] as String,
    question: json['question'] as String,
    desc: json['desc'] as String,
    date: json['date'] as String,
    isPrivate: json['isPrivate'] as bool,
    author: json['author'] as String,
    topic: json['topic'] as String,
    isAnswered: json['isAnswered'] as bool,
    answer: Answer.fromJson(json['answer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'desc': instance.desc,
      'date': instance.date,
      'isPrivate': instance.isPrivate,
      'author': instance.author,
      'topic': instance.topic,
      'isAnswered': instance.isAnswered,
      'answer': instance.answer,
    };
