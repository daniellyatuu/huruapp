// import 'package:windowshoppi/src/model/model_files.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:windowshoppi/api.dart';
// import 'dart:convert';
//
// class AccountPostAPIClient {
//   Future<List<Post>> accountPost(int offset, int limit, int accountId) async {
//     var _url = ACCOUNT_POST + '$accountId/?limit=$limit&offset=$offset';
//
//     Map<String, String> headers = {
//       'Content-Type': 'application/json; charset=UTF-8',
//     };
//
//     final response = await http.get(
//       _url,
//       headers: headers,
//     );
//
//     if (response.statusCode == 200) {
//       return compute(_parsePost, response.body);
//     } else {
//       throw Exception('Error on server');
//     }
//   }
// }
//
// List<Post> _parsePost(String responseBody) {
//   final parsed = jsonDecode(responseBody);
//
//   final parsed1 = parsed['results'].cast<Map<String, dynamic>>();
//
//   return parsed1.map<Post>((json) => Post.fromJson(json)).toList();
// }

import 'package:huruapp/src/model/model_files.dart';
import 'package:huruapp/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class InformationApiClient {
  Future<List<Article>> getInfoData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var _url = Uri.http('$getRequestServerName', '$infoListApi');

    final response = await http.get(
      _url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return compute(_parseArticle, response.body);
    } else {
      throw Exception('Error on server');
    }
  }
}

List<Article> _parseArticle(String responseBody) {
  final parsed = jsonDecode(responseBody);

  final parsed1 = parsed.cast<Map<String, dynamic>>();

  return parsed1.map<Article>((json) => Article.fromJson(json)).toList();
}
