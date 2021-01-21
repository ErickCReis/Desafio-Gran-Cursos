import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/services/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signInWithGoogle();
              },
              child: Text("Login com o Google"),
            ),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signInWithFacebook();
              },
              child: Text("Login com o Facebook"),
            ),
          ],
        ),
      ),
    );
  }
}
