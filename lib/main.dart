import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int score = 0;
  int current = 1;
  int maxTurns = 5;
  int currTurn = 0;
  List<Widget> turnIndicator = [];

  void updateTurn() {
    turnIndicator.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.check,
        color: Colors.green[400],
        size: 40,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Text("Dicee"),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Score: $score",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Click on the dice to roll",
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextButton(
                        onPressed: () {
                          print(currTurn);
                          if (currTurn < maxTurns) {
                            currTurn++;
                            setState(() {
                              current = new Random().nextInt(6) + 1;
                              score += current;
                              updateTurn();
                            });
                          }
                        },
                        child: Image.asset("assets/images/dice$current.png")),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: turnIndicator),
                  Text(
                    "Turns Left: ${maxTurns - currTurn}",
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.orange[100],
      ),
    );
  }
}
