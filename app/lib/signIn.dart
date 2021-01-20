import 'package:flutter/material.dart';

import 'auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String userName = 'Não logado';

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
            onPressed: () => {
              signInWithGoogle()
                .then((value) => { 
                  setState(() { 
                    userName = value.user.displayName;
                    print(userName);
                    }
                )})
            },
            color: Colors.white,
            textColor: Colors.black,
            child: Text('Login with Google'),
          ),
          MaterialButton(
            onPressed: () => {
              loggout().then((value) => { 
                  setState(() { 
                    userName = 'Não logado';
                    print(userName);
                    }
                )})
              },
            color: Colors.red,
            textColor: Colors.black,
            child: Text('Loggout'),
          ),
          Text(userName)
        ],
      )),
    );
  }
}
