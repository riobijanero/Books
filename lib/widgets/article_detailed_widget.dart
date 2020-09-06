import 'package:flutter/material.dart';
import '../common/constants/style_constants.dart';
import '../view_models/article_view_model.dart';
import '../common/utils/ui_utils.dart';

class ArticleDetailledWidget extends StatelessWidget {
  final ArticleViewModel article;

  const ArticleDetailledWidget({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          height: UiUtils.getCardHeight(article),
          decoration: detailedWidgetDecoration,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (article.title != null)
                Hero(
                  tag: 'heroTag ${article.title}${article.id}',
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        article.title,
                        style: articleTitleStyle,
                      ),
                    ),
                  ),
                ),
              if (article.subtitle != null)
                Hero(
                  tag: 'heroTag ${article.subtitle}${article.id}',
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        article.subtitle,
                        style: articleSubstitlteStyle,
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'heroTag ${article.image}${article.id}',
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(article.image),
                          ),
                          borderRadius: fotoBorderRadius,
                        ),
                        width: 100,
                        height: 220,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            article.author != null
                                ? article.author
                                : 'Unknown Author',
                            style: articleAuthorStyle,
                          ),
                          SizedBox(height: 10),
                          if (article.price != null)
                            Text(
                              article.price.toStringAsFixed(2) + ' €',
                              style: articlePriceStyle,
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
