import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingIn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () => null,
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            ),
            MaterialButton(
              onPressed: () => null,
              color: Colors.red,
              textColor: Colors.black,
              child: Text('Loggout'),
            )
          ],
        )
      ),
    );
  }
}
