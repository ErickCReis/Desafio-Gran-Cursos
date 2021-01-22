import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:app/models/News.dart';

import '../constants.dart';

Future<dynamic> listNewsService() async {
  final response = await http.get('$SERVER_IP/news');

  if (response.statusCode == 200) {
    return _parseNews(response.body);
  }

  if (response.statusCode == 500) {
    return 'Server Error';
  }

  return 'Internal Error';
}

List<News> _parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<News>((json) => News.fromJson(json)).toList();
}
