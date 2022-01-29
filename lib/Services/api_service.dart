import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/article_model.dart';

// class ApiService {
//   final endPointUrl = "newsapi.org";
//   final client = http.Client();

//   Future<List<Article>> getArticle() async {
//     final queryParameters = {
//       'country': 'us',
//       'category': 'sports',
//       'apiKey': '510b22eb412941d86d54442e9553cd1'
//     };

//     final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);

//     final response = await client.get(uri);

//     if (response.statusCode == 200) {

//     Map<String, dynamic> json = jsonDecode(response.body);
//     List<dynamic> body = json['articles'];
//     List<Article> articles = body
//         .map(
//           (dynamic item) => Article.fromJson(item),
//         )
//         .toList();

//     return articles;
//     } else {
//       throw ("Cant get articles");
//     }
//   }
// }

class ApiService {
  final endPointUrl = "newsapi.org";
  final p =
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=510b22eb412941d486d54442e9553cd1";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final uri = Uri.parse(p);

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles = body
          .map(
            (dynamic item) => Article.fromJson(item),
          )
          .toList();

      return articles;
    } else {
      throw ("Cant get articles");
    }
  }
}
