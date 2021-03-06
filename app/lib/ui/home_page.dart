import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:app/ui/news_list.dart';
import 'package:app/ui/event_list.dart';
import 'package:app/ui/sign_in_page.dart';
import 'package:app/ui/profile_page.dart';

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
    EventsList(),
    AuthenticationWrapper(),
  ];

  void _onItemTapped(int index, bool isLogged) {
    setState(() {
      if (!isLogged && index == 1) {
        _selectedIndex = 2;
      } else
        _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final isLogged = firebaseUser != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Gran Cursos'),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (index) => _onItemTapped(index, isLogged),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final isLogged = firebaseUser != null;

    return isLogged ? ProfilePage() : SignInPage();
  }
}
