import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:app/services/authentication_service.dart';
import 'package:app/ui/home_page.dart';

final storage = new FlutterSecureStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      ),
    );
  }
}
