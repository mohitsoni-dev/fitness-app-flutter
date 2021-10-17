import 'package:fitness_app_flutter/constants/constants.dart';
import 'package:fitness_app_flutter/core/api_base_helper.dart';
import 'package:fitness_app_flutter/core/models/question.dart';

class CommunityService {
  ApiBaseHelper _helper = new ApiBaseHelper();

  Future<List<Question>> fetchQuestions() async {
    final response = await _helper.get(QUESTIONS_EP + '/true');
    List<Question> questions = [];
    for (Map<String, dynamic> json in response)
      questions.add(Question.fromJson(json));
    return questions;
  }

  Future<dynamic> postQuestion({required Map<String, String> body}) async {
    final response = await _helper.post(QUESTIONS_EP, body);
    return response;
  }
}
