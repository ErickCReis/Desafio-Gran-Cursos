import 'package:app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF020014),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            primaryColor: Colors.black,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xFF02000F),
                selectedItemColor: Colors.redAccent,
                selectedLabelStyle: TextStyle(color: Colors.redAccent),
                selectedIconTheme: IconThemeData(color: Colors.redAccent),
                unselectedItemColor: Colors.white,
                unselectedLabelStyle: TextStyle(color: Colors.white),
                unselectedIconTheme: IconThemeData(color: Colors.white))),
        home: HomePage(),
      ),
    );
  }
}
