class Article {
  final String articleId;
  final String title;
  final String link;
  final String? description;
  final String? imageUrl;
  final String pubDate;
  final List<String>? keywords;
  final List<String>? country;
  final List<String>? category;
  final String? sourceName;
  final String? ai_tag;
  final String? sentiment;

  Article({
    required this.articleId,
    required this.title,
    required this.link,
    this.description,
    this.imageUrl,
    required this.pubDate,
    this.keywords,
    this.country,
    this.category,
    this.sourceName,
    this.ai_tag,
    this.sentiment,
  });

  factory Article.fromdata(Map<String, dynamic> data) {
    return Article(
        articleId: data['article_id'] as String,
        title: data['title'] as String,
        link: data['link'] as String,
        description: data['description'] as String?,
        imageUrl: data['image_url'] as String?,
        pubDate: data['pubDate'] as String,
        keywords: data['keywords'] != null
            ? List<String>.from(data['keywords'])
            : null,
        country:
            data['country'] != null ? List<String>.from(data['country']) : null,
        category: data['category'] != null
            ? List<String>.from(data['category'])
            : null,
        sourceName: data['source_name'] as String?,
        ai_tag: data['ai_tag'] as String,
        sentiment: data['sentiment'] as String);
  }
}

// class NewsResponse {
//   final String status;
//   final int totalResults;
//   final List<Article> results;
//
//   NewsResponse({
//     required this.status,
//     required this.totalResults,
//     required this.results,
//   });
//
//   factory NewsResponse.fromdata(Map<String, dynamic> data) {
//     return NewsResponse(
//       status: data['status'] as String,
//       totalResults: data['totalResults'] as int,
//       results: (data['results'] as List)
//           .map((article) => Article.fromdata(article))
//           .toList(),
//     );
//   }
// }
//
// class Article {
//   final String articleId;
//   final String title;
//   final String link;
//   final String? description;
//   final String? imageUrl;
//   final String pubDate;
//   final List<String>? keywords;
//   final List<String>? country;
//   final List<String>? category;
//   final String? sourceName;
//
//   Article({
//     required this.articleId,
//     required this.title,
//     required this.link,
//     this.description,
//     this.imageUrl,
//     required this.pubDate,
//     this.keywords,
//     this.country,
//     this.category,
//     this.sourceName,
//   });
//
//   factory Article.fromdata(Map<String, dynamic> data) {
//     return Article(
//       articleId: data['article_id'] as String,
//       title: data['title'] as String,
//       link: data['link'] as String,
//       description: data['description'] as String?,
//       imageUrl: data['image_url'] as String?,
//       pubDate: data['pubDate'] as String,
//       keywords:
//           data['keywords'] != null ? List<String>.from(data['keywords']) : null,
//       country:
//           data['country'] != null ? List<String>.from(data['country']) : null,
//       category:
//           data['category'] != null ? List<String>.from(data['category']) : null,
//       sourceName: data['source_name'] as String?,
//     );
//   }
// }
