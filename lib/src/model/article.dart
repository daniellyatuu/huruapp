import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final String username;
  final String enTitle;
  final String swTitle;
  final String coverPhoto;
  final bool displayCoverPhotoOnViewArticle;
  final String enContent;
  final String swContent;
  final String category;
  final String datePosted;

  const Article({
    this.id,
    this.username,
    this.enTitle,
    this.swTitle,
    this.coverPhoto,
    this.displayCoverPhotoOnViewArticle,
    this.enContent,
    this.swContent,
    this.category,
    this.datePosted,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      username: json['user'],
      enTitle: json['title'],
      swTitle: json['sw_title'],
      coverPhoto: json['cover_photo'],
      displayCoverPhotoOnViewArticle:
          json['display_cover_photo_on_view_article'],
      enContent: json['content'],
      swContent: json['sw_content'],
      category: json['category'],
      datePosted: json['date_posted'],
    );
  }

  @override
  List<Object> get props => [
        id,
        username,
        enTitle,
        swTitle,
        coverPhoto,
        displayCoverPhotoOnViewArticle,
        enContent,
        swContent,
        category,
        datePosted,
      ];

  @override
  String toString() => 'Article { id: $id }';
}
