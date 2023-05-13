import 'package:flutter/material.dart';
import 'package:vueling_destino/models.dart';
import 'main.dart';
import 'dart:async';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);
  @override
  State<Game> createState() => _GameMainState();
}

class _GameMainState extends State<Game> {
  bool creatingGame = true;
  bool enabledButtons = true;
  final List<Question> questions = dummyQuestions();
  int iq = 0; // Question iterator
  List<Color> buttonColors = [
    Colors.yellow,
    Colors.yellow,
    Colors.yellow,
    Colors.yellow
  ];

  void pressedButton(int i) {
    setState(() {
      if (i == iq) {
        buttonColors[i] = Colors.green;
      } else {
        buttonColors[i] = Colors.red;
        buttonColors[iq] = Colors.green;
      }
      enabledButtons = false;
      Timer timer = Timer(const Duration(seconds: 3), () {
        setState(() {
          enabledButtons = true;
          iq++;
          for (int j = 0; j < buttonColors.length; j++) {
            buttonColors[j] = Colors.yellow;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (creatingGame) {
      // ignore: unused_local_variable
      Timer timer = Timer(const Duration(seconds: 3), () {
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
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  questions[iq].question,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        if (enabledButtons) pressedButton(0);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              buttonColors[0])),
                      child: Text(
                        questions[iq].answers[0],
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        if (enabledButtons) pressedButton(1);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              buttonColors[1])),
                      child: Text(
                        questions[iq].answers[1],
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        if (enabledButtons) pressedButton(2);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              buttonColors[2])),
                      child: Text(
                        questions[iq].answers[2],
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        if (enabledButtons) pressedButton(3);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              buttonColors[3])),
                      child: Text(
                        questions[iq].answers[3],
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
