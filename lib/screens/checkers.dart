import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class SimonSaysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimonSaysGame(),
    );
  }
}

class SimonSaysGame extends StatefulWidget {
  @override
  _SimonSaysGameState createState() => _SimonSaysGameState();
}

class _SimonSaysGameState extends State<SimonSaysGame> {
  List<Color> simonSequence = [];
  List<Color> playerSequence = [];
  int currentStep = 0;
  bool playerTurn = false;
  bool gameStarted = false;
  bool gameOver = false;

  // Define colors
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simon Says'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Simon Says Game',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            if (!gameStarted)
              ElevatedButton(
                onPressed: startGame,
                child: Text('Start Game'),
              ),
            if (gameStarted)
              Text(
                'Repeat the sequence:',
                style: TextStyle(fontSize: 18.0),
              ),
            if (gameStarted)
              SizedBox(
                height: 10.0,
              ),
            if (gameStarted)
              Wrap(
                spacing: 20.0,
                children: simonSequence.map((color) {
                  return GestureDetector(
                    onTap: () => playerTurn ? handlePlayerInput(color) : null,
                    child: ColoredBox(
                      color: color,
                      child: SizedBox(width: 100.0, height: 100.0),
                    ),
                  );
                }).toList(),
              ),
            if (gameOver)
              Text(
                'Game Over! Your score: ${simonSequence.length - 1}',
                style: TextStyle(fontSize: 18.0),
              ),
          ],
        ),
      ),
    );
  }

  // Start the game
  void startGame() {
    simonSequence.clear();
    playerSequence.clear();
    currentStep = 0;
    gameStarted = true;
    gameOver = false;
    nextStep();
  }

  // Add the next step to the sequence
  void nextStep() {
    final Random random = Random();
    simonSequence.add(colors[random.nextInt(4)]);
    playSequence();
  }

  // Play the sequence for the player to repeat
  void playSequence() {
    int i = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (i < simonSequence.length) {
        setState(() {
          playerTurn = false;
        });
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            playerTurn = true;
          });
        });
        i++;
      } else {
        timer.cancel();
      }
    });
  }

  // Handle player input
  void handlePlayerInput(Color color) {
    setState(() {
      playerSequence.add(color);
    });
    if (playerSequence[currentStep] == simonSequence[currentStep]) {
      if (currentStep == simonSequence.length - 1) {
        // Player successfully repeated the sequence
        currentStep = 0;
        playerSequence.clear();
        nextStep();
      } else {
        // Continue the sequence
        currentStep++;
      }
    } else {
      // Player made a mistake
      gameOver = true;
    }
  }
}
