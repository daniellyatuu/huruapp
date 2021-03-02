import 'package:huruapp/src/model/model_files.dart';
import 'package:huruapp/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class ServiceApiClient {
  Future<List<Service>> getServiceData() async {
    var _url = SERVICE_LIST_API;

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(
      _url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return compute(_parseService, response.body);
    } else {
      throw Exception('Error on server');
    }
  }
}

List<Service> _parseService(String responseBody) {
  final parsed = jsonDecode(responseBody);

  final parsed1 = parsed.cast<Map<String, dynamic>>();

  return parsed1.map<Service>((json) => Service.fromJson(json)).toList();
}
