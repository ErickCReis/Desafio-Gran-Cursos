import 'package:app/ui/news_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:app/ui/sign_in_page.dart';
import 'package:app/ui/profile_page.dart';

import 'package:app/services/list_events_service.dart';
import 'package:app/services/list_news_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _navigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Notícias',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      label: 'Eventos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Perfil',
    ),
  ];

  final List<Widget> _widgetOptions = <Widget>[
    NewsList(),
    Container(
      child: FutureBuilder(
          future: listEventsService(),
          builder: (context, snapshot) => snapshot.hasData
              ? Column(
                  children: <Widget>[
                    Text("Here's the data:"),
                    Text(snapshot.data.toString())
                  ],
                )
              : snapshot.hasError
                  ? Text("An error occurred")
                  : CircularProgressIndicator()),
    ),
    AuthenticationWrapper(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Gran Cursos'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: firebaseUser != null ? _navigationBarItems : _navigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return ProfilePage();
    }

    return SignInPage();
  }
}
