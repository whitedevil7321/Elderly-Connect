import 'dart:async';
import 'package:flutter/material.dart';

class MemoryMatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MemoryMatchGame(),
    );
  }
}

class MemoryMatchGame extends StatefulWidget {
  @override
  _MemoryMatchGameState createState() => _MemoryMatchGameState();
}

class _MemoryMatchGameState extends State<MemoryMatchGame> {
  List<String> symbols = [
    '🌟',
    '🍎',
    '🎈',
    '🎁',
    '🐶',
    '🚀',
    '🍕',
    '🚲',
    '🌺',
    '🍉'
  ];
  late List<String> cards;
  late List<int> selectedIndices;
  bool isComparing = false;
  int pairsFound = 0;
  late int totalPairs;

  @override
  void initState() {
    super.initState();
    totalPairs = symbols.length;
    cards = [...symbols, ...symbols]..shuffle();
    selectedIndices = [];
  }

  void checkMatch() {
    if (selectedIndices.length == 2) {
      if (cards[selectedIndices[0]] == cards[selectedIndices[1]]) {
        // Match found
        selectedIndices.clear();
        pairsFound++;
        if (pairsFound == totalPairs) {
          // All pairs found, game over
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Congratulations!'),
              content: Text('You won the game.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: Text('Play Again'),
                ),
              ],
            ),
          );
        }
      } else {
        // No match, flip cards back after a short delay
        Timer(Duration(seconds: 1), () {
          setState(() {
            selectedIndices.clear();
          });
        });
      }
    }
  }

  void resetGame() {
    setState(() {
      cards.shuffle();
      selectedIndices.clear();
      pairsFound = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Match Game'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (!isComparing &&
                  !selectedIndices.contains(index) &&
                  selectedIndices.length < 2) {
                setState(() {
                  selectedIndices.add(index);
                });
                if (selectedIndices.length == 2) {
                  isComparing = true;
                  checkMatch();
                  Timer(Duration(milliseconds: 800), () {
                    isComparing = false;
                  });
                }
              }
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: selectedIndices.contains(index)
                    ? Colors.green
                    : Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  selectedIndices.contains(index) || pairsFound == totalPairs
                      ? cards[index]
                      : '?',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetGame,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
