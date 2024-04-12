import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<int> items = [];
  List<bool> flipped = [];
  bool processing = false;
  int prevIndex = -1;
  int timeLeft = 60;
  int moves = 0;
  DateTime startTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    items = List.generate(16, (index) => index ~/ 2 + 1);
    items.shuffle();
    flipped = List.filled(16, false);
    prevIndex = -1;
    timeLeft = 60;
    moves = 0;
    startTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          _showResultDialog();
        }
      });
    });
  }

  void _showResultDialog() {
    DateTime endTime = DateTime.now();
    int elapsedTimeInSeconds = endTime.difference(startTime).inSeconds;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Time's up!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your score: ${(flipped.where((element) => element).length / 2)}/${items.length ~/ 2}"),
              Text("Time taken: $elapsedTimeInSeconds seconds"),
              Text("Moves: $moves"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _initializeGame();
              },
              child: Text("Play Again"),
            ),
          ],
        );
      },
    );
  }

  void _onTileTap(int index) {
    if (!flipped[index] && !processing) {
      setState(() {
        flipped[index] = true;
      });

      if (prevIndex == -1) {
        prevIndex = index;
      } else {
        processing = true;
        moves++;
        if (items[prevIndex] != items[index]) {
          Timer(Duration(milliseconds: 500), () {
            setState(() {
              flipped[prevIndex] = false;
              flipped[index] = false;
              prevIndex = -1;
              processing = false;
            });
          });
        } else {
          prevIndex = -1;
          processing = false;
          if (flipped.every((element) => element)) {
            _showResultDialog();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Game'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Time left: $timeLeft seconds',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onTileTap(index);
                  },
                  child: Card(
                    child: Center(
                      child: flipped[index] ? Text(
                        items[index].toString(),
                        style: TextStyle(fontSize: 24),
                      ) : Container(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
