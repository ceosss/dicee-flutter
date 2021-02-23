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
  int MAX_TURN = 5;
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
                  Text(
                    "Score: $score",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: TextButton(
                        onPressed: () {
                          current = new Random().nextInt(6) + 1;
                          setState(() {
                            score += current;
                          });
                        },
                        child: Image.asset("assets/images/dice$current.png")),
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
