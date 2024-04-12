// In games.dart

import 'package:flutter/material.dart';
import 'fillgame.dart';
import 'sketchgame.dart';
import 'memorygame.dart';


class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Games Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  GameCard(
                    title: 'Fill What You Feel',
                    image: 'assets/fill.png',
                    onPressed: () {
                      // Navigate to the Fill What You Feel game
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SentenceCompletionScreen()),
                      );
                    },
                  ),
                  GameCard(
                    title: 'Sketch It Out',
                    image: 'assets/sketch.png',
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrawingBoard()),
                      );
                    }
                  ),
                  GameCard(
                    title: 'Memory Game',
                    image: 'assets/memory.jpg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MemoryGame()),
                        );
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPressed;

  const GameCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black),
      ),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 300, // Set a fixed height for the GameCard
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text('Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
