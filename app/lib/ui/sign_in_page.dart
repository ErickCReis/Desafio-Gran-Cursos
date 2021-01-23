import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:app/services/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.white])),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Faça o login para ter acesso aos eventos',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                SignInButton(
                  Buttons.Google,
                  text: "Login com o Google",
                  onPressed: () {
                    context.read<AuthenticationService>().signInWithGoogle();
                  },
                ),
                SignInButton(
                  Buttons.FacebookNew,
                  text: "Login com o Facebook",
                  onPressed: () {
                    context.read<AuthenticationService>().signInWithFacebook();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
