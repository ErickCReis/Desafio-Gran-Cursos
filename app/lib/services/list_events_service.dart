import 'dart:convert';

import 'package:app/data/secure_storage.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

Future<dynamic> listEventsService() async {
  final jwt = await secureStorage.readSecureData('jwt');

  print(jwt);

  final response = await http
      .get('$SERVER_IP/events', headers: {"Authorization": 'Bearer $jwt'});

  if (response.statusCode == 200) {
    final events = json.decode(response.body);
    return events;
  }

  if (response.statusCode == 401) {
    return 'Authetication Error';
  }

  if (response.statusCode == 500) {
    return 'Server Error';
  }

  return 'Internal Error';
}
