import '../models/article.dart';

class ArticleViewModel {
  final Article article;

  ArticleViewModel({this.article});

  String get id => article.id;

  String get title => article.title;

  String get subtitle => article.subtitle;

  String get author => article.author;

  double get price => article.price;

  String get image => article.image;
}
