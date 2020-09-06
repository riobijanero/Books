import '../../view_models/article_view_model.dart';

class UiUtils {
  static getCardHeight(ArticleViewModel article) {
    double baseHeight = 400;
    if (article.subtitle.length > 102) {
      baseHeight += 70;
    } else if (article.subtitle.length > 68) {
      baseHeight += 50;
    }
    if (article.title.length > 25) {
      baseHeight += 50;
    }

    return baseHeight;
  }
}
