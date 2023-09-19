import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: TicTacToeGame(),
    );
  }
}

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<String> board = List.filled(9, '');
  bool isPlayerX = true; // true for Player X and false for Player O
  bool gameOver = false;
  String gameResult = ''; // Store the game result

  @override
  void initState() {
    super.initState();
    // Start the game with either X or O (random)
    isPlayerX = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return buildTile(index);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              gameOver
                  ? gameResult.isNotEmpty
                      ? 'Game Over - Winner: $gameResult'
                      : 'Game Over - It\'s a Draw'
                  : 'Current Player: ${isPlayerX ? 'X' : 'O'}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              resetGame();
            },
            child: Text('Restart Game'),
          ),
        ],
      ),
    );
  }

  Widget buildTile(int index) {
    return GestureDetector(
      onTap: () {
        if (!gameOver && board[index] == '') {
          setState(() {
            board[index] = isPlayerX ? 'X' : 'O';
            isPlayerX = !isPlayerX;
            checkWinner();
            if (!gameOver) {
              botMove();
            }
          });
        }
      },
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            board[index],
            style: TextStyle(fontSize: 40.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void botMove() {
    // Simple random move by the bot
    if (!gameOver) {
      int emptyTiles = board.where((element) => element.isEmpty).length;
      if (emptyTiles > 0) {
        int randomIndex = Random().nextInt(9);
        while (board[randomIndex].isNotEmpty) {
          randomIndex = Random().nextInt(9);
        }
        board[randomIndex] = isPlayerX ? 'X' : 'O';
        isPlayerX = !isPlayerX;
        checkWinner();
      }
    }
  }

  void checkWinner() {
    for (var i = 0; i < 3; i++) {
      if (board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2] &&
          board[i * 3].isNotEmpty) {
        gameOver = true;
        gameResult = board[i * 3];
        return;
      }
      if (board[i] == board[i + 3] &&
          board[i] == board[i + 6] &&
          board[i].isNotEmpty) {
        gameOver = true;
        gameResult = board[i];
        return;
      }
    }
    if (board[0] == board[4] && board[0] == board[8] && board[0].isNotEmpty) {
      gameOver = true;
      gameResult = board[0];
      return;
    }
    if (board[2] == board[4] && board[2] == board[6] && board[2].isNotEmpty) {
      gameOver = true;
      gameResult = board[2];
      return;
    }
    if (board.every((element) => element.isNotEmpty)) {
      gameOver = true;
      gameResult = 'Draw';
      return;
    }
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      isPlayerX = Random().nextBool();
      gameOver = false;
      gameResult = '';
    });
  }
}
