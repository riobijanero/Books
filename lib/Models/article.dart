import 'dart:convert';

class Article {
  final String id;
  final String title;
  final String subtitle;
  final String author;
  final String price;
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
    String price,
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
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      author: map['author'],
      price: map['price'],
      image: map['image'],
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
