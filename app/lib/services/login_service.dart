import 'package:http/http.dart' as http;

import '../constants.dart';

Future<String> loginService() async {
  var res = await http.post("$SERVER_IP/login");

  if (res.statusCode == 200) return res.body;
  return null;
}
