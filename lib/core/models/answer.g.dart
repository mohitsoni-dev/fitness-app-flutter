// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    expertAns: json['expertAns'] as String,
    answers:
        (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'expertAns': instance.expertAns,
      'answers': instance.answers,
    };
