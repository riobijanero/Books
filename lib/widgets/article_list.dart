import 'package:flutter/material.dart';
import '../common/constants/style_constants.dart';

import '../view_models/article_view_model.dart';
import 'article_detailed_widget.dart';

class ArticleList extends StatelessWidget {
  final List<ArticleViewModel> articleList;

  const ArticleList({Key key, this.articleList});

  onListTileTab(BuildContext context, ArticleViewModel article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ArticleDetailledWidget(
        article: article,
        key: ValueKey('${article.id}'),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: ListView.builder(
          itemCount: articleList.length,
          itemBuilder: (context, index) {
            final article = articleList[index];

            return InkWell(
              onTap: () => onListTileTab(context, article),
              child: Card(
                elevation: 3,
                shape: listTileShape,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: (article.title != null)
                      ? Hero(
                          tag: 'heroTag ${article.image}${article.id}',
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(article.image),
                              ),
                              borderRadius: fotoBorderRadius,
                            ),
                            width: 60,
                            // height: 100,
                          ),
                        )
                      : null,
                  title: Hero(
                    key: ValueKey('key ${article.title}'),
                    tag: 'heroTag ${article.title}${article.id}',
                    transitionOnUserGestures: true,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        article.title,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  subtitle: (article.subtitle != null)
                      ? Hero(
                          key: ValueKey('key ${article.subtitle}'),
                          tag: 'heroTag ${article.subtitle}${article.id}',
                          transitionOnUserGestures: true,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                article.subtitle,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            );
          }),
    );
  }
}
