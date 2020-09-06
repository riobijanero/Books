import 'dart:convert';
import 'package:coding_challenge/common/utils/article_utils.dart';
import 'package:coding_challenge/models/cover_image.dart';

import '../common/utils/extensions/map_extensions.dart';

class Article {
  final String id;
  final String title;
  final String subtitle;
  final String author;
  final double price;
  final String image;

  Article({
    this.id,
    this.title,
    this.subtitle,
    this.author,
    this.price,
    this.image,
  });

  Article copyWith({
    String id,
    String title,
    String subtitle,
    String author,
    double price,
    String image,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      author: author ?? this.author,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'author': author,
      'price': price,
      'image': image,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Article(
      id: map.tryParse('artikelId').toString(),
      title: map.tryParse('titel') as String,
      subtitle: map.tryParse('untertitel') as String,
      author: map.tryParseNested(['autorInterpret', 'name']) as String,
      price: double.parse(
              map.tryParseNested(['verkaufspreis', 'betrag']).toString()) /
          100,
      image: ArticleUtils.getImageUrl(
          CoverImage.fromMap(map.tryParse('coverbild'))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Article(id: $id, title: $title, subtitle: $subtitle, author: $author, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Article &&
        o.id == id &&
        o.title == title &&
        o.subtitle == subtitle &&
        o.author == author &&
        o.price == price &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        author.hashCode ^
        price.hashCode ^
        image.hashCode;
  }
}
