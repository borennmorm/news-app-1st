import '../model/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteService {
  static Future<List<ArticleModel>?> getArticles() async {
    var apiKey = "55060895218b47329b63ab3c5c4b2e47";
    var uri = Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey");
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        if (json.isNotEmpty) {
          return articleFromJson(json);
        } else {
          throw Exception('Response body is null or empty');
        }
      } else {
        throw Exception(
            'Failed to fetch articles. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

List<ArticleModel> articleFromJson(String str) {
  final parsed = json.decode(str);
  if (parsed['articles'] != null) {
    return List<ArticleModel>.from(
        parsed['articles'].map((x) => ArticleModel.fromJson(x)));
  } else {
    throw Exception('Articles key not found or null in JSON response');
  }
}
