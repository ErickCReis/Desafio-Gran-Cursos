import 'package:flutter/material.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  final ValueChanged<int> onChange;
  final int index;

  BottomNavigatorBarWidget(
      {Key key, @required this.onChange, @required this.index})
      : super(key: key);

  @override
  _BottomNavigatorBarWidgetState createState() =>
      _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {
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

  void _changeIndex(int value) {
    widget.onChange(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: BottomNavigationBar(
          currentIndex: widget.index,
          onTap: _changeIndex,
          type: BottomNavigationBarType.fixed,
          items: _navigationBarItems),
    );
  }
}
