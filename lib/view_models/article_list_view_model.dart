import 'package:flutter/material.dart';
import '../interfaces/i_webservice.dart';

import './article_view_model.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<ArticleViewModel> articleList = List<ArticleViewModel>();
  final IWebService webService;
  String errorMessage = '';

  ArticleListViewModel(this.webService);

  Future<void> fetchArticles(String keyword) async {
    errorMessage = '';

    if (keyword != null && keyword.isNotEmpty) {
      final result = await webService.fetchArticles(keyword);
      articleList = result
          ?.map((article) => ArticleViewModel(article: article))
          ?.toList();
      if (articleList == null) {
        errorMessage = 'no results found for \"$keyword\"';
      }
      notifyListeners();
    }
  }
}
