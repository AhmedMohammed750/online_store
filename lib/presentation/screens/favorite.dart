


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  backgroundColor: Colors.purple[900],
  title: Text(
    'My App',
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  centerTitle: true,
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search),
      color: Colors.white,
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      color: Colors.white,
      onPressed: () {},
    ),
  ],
)
);
  }
}