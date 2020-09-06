import 'package:flutter/material.dart';
import '../common/constants/style_constants.dart';
import '../view_models/article_view_model.dart';

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
          height: 350,
          decoration: detailedWidgetDecoration,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'heroTag ${article.title}${article.id}',
                transitionOnUserGestures: true,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    article.title,
                    style: articleTitleStyle,
                  ),
                ),
              ),
              Hero(
                tag: 'heroTag ${article.subtitle}${article.id}',
                transitionOnUserGestures: true,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    article.subtitle,
                    style: articleSubstitlteStyle,
                  ),
                ),
              ),
              Row(
                children: [
                  Hero(
                    tag: 'heroTag ${article.image}${article.id}',
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(article.image),
                        ),
                        borderRadius: fotoBorderRadius,
                      ),
                      width: 150,
                      height: 200,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            article.author,
                          ),
                          SizedBox(height: 10),
                          Text(article.price.toString() + ' €'),
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
