import 'dart:convert';

import 'package:http/http.dart' as http;

class Source {
  dynamic id;
  dynamic name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(id: json["id"], name: json["name"]);
}

class Album {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  DateTime publishedAt;

  Album({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt
  });

  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "get no author",
        title: json["title"] ?? "get no title",
        description: json["description"] ?? "get no description",
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'data:image/jpeg;base64,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',
        content: json["content"] ?? "content",
        publishedAt: DateTime.parse(json["publishedAt"] ?? DateTime.now().toIso8601String())
    );
  }
}

Future<List<Album>> fetchAlbum() async{
  final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e4b8f954378f46a6b0901814aa54616c'));

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    final result = responseBody['articles'] as List;
    final listNews = result.map((e) => Album.fromJson(e)).toList();
    return listNews;
  } else {
    throw Exception('Failed to load album');
  }
}