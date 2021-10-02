import 'package:fitness_app_flutter/constants/constants.dart';
import 'package:fitness_app_flutter/core/api_base_helper.dart';
import 'package:fitness_app_flutter/core/models/article.dart';

class ExploreService {
  ApiBaseHelper _helper = new ApiBaseHelper();

  Future<List<Article>> fetchArticles() async {
    final response = await _helper.get(POSTS_EP);
    List<Article> articles = [];
    for (Map<String, dynamic> json in response)
      articles.add(Article.fromJson(json));
    return articles;
  }
}
