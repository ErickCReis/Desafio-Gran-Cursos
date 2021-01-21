import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            },
            child: Text("Sign in"),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signInWithGoogle();
            },
            child: Text("Sign in Google"),
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signInWithFacebook();
            },
            child: Text("Sign in Facebook"),
          ),
        ],
      ),
    );
  }
}