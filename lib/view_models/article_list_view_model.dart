import 'dart:async';

import 'package:coding_challenge/models/article.dart';
import 'package:flutter/material.dart';
import '../interfaces/i_webservice.dart';

import './article_view_model.dart';

class ArticleListViewModel extends ChangeNotifier {
  List<ArticleViewModel> articleList = List<ArticleViewModel>();
  final IWebService webService;
  String errorMessage = '';
  StreamSubscription<List<Article>> dataSub;

  ArticleListViewModel(this.webService);

  Future<void> fetchArticles(String keyword) async {
    errorMessage = '';

    if (keyword != null && keyword.isNotEmpty) {
      try {
        final result = await webService.fetchArticles(keyword);
        articleList = result
            ?.map((article) => ArticleViewModel(article: article))
            ?.toList();
        if (articleList == null) {
          errorMessage = 'no results found for \"$keyword\"';
        }
        notifyListeners();
      } catch (e) {
        articleList = null;
        errorMessage = 'Error performing your request for \"$keyword\"';
      }
    }
  }

  Future<void> fetchArticlesAsStream(String keyword) async {
    errorMessage = '';

    if (keyword != null && keyword.isNotEmpty) {
      dataSub?.cancel();
      dataSub = webService
          .fetchArticles(keyword)
          .asStream()
          .listen((List<Article> result) {
        articleList = result
            ?.map((article) => ArticleViewModel(article: article))
            ?.toList();
        if (articleList == null) {
          errorMessage = 'no results found for \"$keyword\"';
        }
        notifyListeners();
      });
    }
  }

  void cancelRequest() {
    dataSub?.cancel();
  }

  void cancelSearch() {}
}
