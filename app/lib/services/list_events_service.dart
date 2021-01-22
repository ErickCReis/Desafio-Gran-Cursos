import 'dart:convert';
import 'package:app/data/secure_storage.dart';
import 'package:app/entities/Event.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<dynamic> listEventsService() async {
  final jwt = await secureStorage.readSecureData('jwt');

  final response = await http
      .get('$SERVER_IP/events', headers: {"Authorization": 'Bearer $jwt'});

  if (response.statusCode == 200) {
    return _parseEvents(response.body);
  }

  if (response.statusCode == 401) {
    return 'Authetication Error';
  }

  if (response.statusCode == 500) {
    return 'Server Error';
  }

  return 'Internal Error';
}

List<Event> _parseEvents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Event>((json) => Event.fromJson(json)).toList();
}
