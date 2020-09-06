import 'package:coding_challenge/models/article.dart';

/// An interface specifying the Webservice's functionality
abstract class IWebService {
  /// Queries a list of movies based on the provided keyword
  Future<List<Article>> fetchArticles(String keyword);
}
