import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _GameMainState();
}

class _GameMainState extends State<Game> {
  bool creatingGame = true;

  @override
  Widget build(BuildContext context) {
    if (creatingGame) {
      Timer timer = Timer(Duration(seconds: 3), () {
        setState(() {
          creatingGame = false;
        });
      });
      return Scaffold(
        body: Center(
          child: Text('¿Preparado, ' + player.name + '?'),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Text('[Pantalla de juego]'),
      ),
    );
  }
}
