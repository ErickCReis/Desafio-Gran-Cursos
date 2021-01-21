import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/authentication_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();
    final userName = user.displayName != null ? user.displayName : "!"; 

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem vindo " + userName),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
