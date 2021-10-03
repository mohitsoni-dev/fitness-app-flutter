import 'dart:async';

import 'package:fitness_app_flutter/core/api_response.dart';
import 'package:fitness_app_flutter/core/models/question.dart';
import 'package:fitness_app_flutter/core/services/community_service.dart';

class CommunityBloc {
  CommunityService? _communityService;

  StreamController<ApiResponse<List<Question>>>? _questionListController;

  StreamSink<ApiResponse<List<Question>>>? get questionListSink =>
      _questionListController?.sink;

  Stream<ApiResponse<List<Question>>>? get questionListStream =>
      _questionListController?.stream;

  CommunityBloc() {
    _questionListController = StreamController<ApiResponse<List<Question>>>();
    _communityService = CommunityService();
    fetchQuestionList();
  }

  fetchQuestionList() async {
    questionListSink?.add(ApiResponse.loading('Fetching Popular Article'));
    try {
      List<Question> questions = await _communityService!.fetchQuestions();
      questionListSink?.add(ApiResponse.completed(questions));
    } catch (e) {
      questionListSink?.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _questionListController?.close();
  }
}
