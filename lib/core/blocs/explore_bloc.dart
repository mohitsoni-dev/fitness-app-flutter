import 'dart:async';

import 'package:fitness_app_flutter/core/api_response.dart';
import 'package:fitness_app_flutter/core/models/article.dart';
import 'package:fitness_app_flutter/core/services/explore_service.dart';

class ExploreBloc {
  ExploreService? _exploreService;

  StreamController<ApiResponse<List<Article>>>? _articleListController;

  StreamSink<ApiResponse<List<Article>>>? get articleListSink =>
      _articleListController?.sink;

  Stream<ApiResponse<List<Article>>>? get movieListStream =>
      _articleListController?.stream;

  ExploreBloc() {
    _articleListController = StreamController<ApiResponse<List<Article>>>();
    _exploreService = ExploreService();
    fetchMovieList();
  }

  fetchMovieList() async {
    articleListSink?.add(ApiResponse.loading('Fetching Popular Movies'));
    try {
      List<Article> articles = await _exploreService!.fetchArticles();
      articleListSink?.add(ApiResponse.completed(articles));
    } catch (e) {
      articleListSink?.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _articleListController?.close();
  }
}
