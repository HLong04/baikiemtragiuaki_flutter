import 'package:labtonghop/model/source.dart';

class Article {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      // Chỗ này quan trọng: Parse object 'source' bên trong
      source: json['source'] != null
          ? Source.fromJson(json['source'])
          : Source(name: 'Unknown'),

      author: json['author'],

      // Dùng ?? '' để nếu API trả về null thì app không bị crash (vẫn hiện chuỗi rỗng)
      title: json['title'] ?? 'Không có tiêu đề',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '', // Nếu không có ảnh thì trả về rỗng
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
