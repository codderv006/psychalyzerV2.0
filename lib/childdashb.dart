import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:psychalyzergpt/loginpage.dart';
import 'package:psychalyzergpt/chatbot.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:psychalyzergpt/games.dart'; // Import the GamesPage class from games.dart

final Color blueViolet = Color(0xFF64DFE3);

class ChildDashboard extends StatefulWidget {
  @override
  _ChildDashboardState createState() => _ChildDashboardState();
}

class _ChildDashboardState extends State<ChildDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeSection(onButtonPressed: _onButtonPressed),
      PendingTestSection(),
      ChatBotPage(),
      GamesPage(), // Add GamesPage as an option
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Psychalyzer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
        tabs: [
          MoltenTab(
            icon: Icon(Icons.home),
            selectedColor: blueViolet,
          ),
          MoltenTab(
            icon: Icon(Icons.assignment),
            selectedColor: blueViolet,
          ),
          MoltenTab(
            icon: Icon(Icons.chat),
            selectedColor: blueViolet,
          ),
          MoltenTab(
            icon: Icon(Icons.games),
            selectedColor: blueViolet,
          ),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final Function(int) onButtonPressed;

  const HomeSection({Key? key, required this.onButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            scrollDirection: Axis.horizontal,
          ),
          items: [
            'assets/6.jpg',
            'assets/7.jpg',
            'assets/8.jpg',
          ].map((String assetName) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.asset(
                    assetName,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Text(
          'Available Activities',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity, // Match parent width
          child: Column(
            children: [
              ActivityButton(
                text: 'Pending Tests/Quizzes',
                onPressed: () {
                  // Update selected index to PendingTestSection
                  onButtonPressed(1);
                },
              ),
              ActivityButton(
                text: 'Chat with Bot',
                onPressed: () {
                  // Update selected index to ChatBotPage
                  onButtonPressed(2);
                },
              ),
              ActivityButton(
                text: 'Games',
                onPressed: () {
                  // Update selected index to ChatBotPage
                  onButtonPressed(3);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActivityButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ActivityButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Match parent width
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class PendingTestSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Text(
          'Pending Quizzes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        QuizCard(
          quizName: 'Quiz 1', // Provide the name of the quiz
          onPressed: () {
            // Add navigation to take the quiz
          },
        ),
        QuizCard(
          quizName: 'Quiz 2', // Provide the name of the quiz
          onPressed: () {
            // Add navigation to take the quiz
          },
        ),
        // Add more QuizCard widgets for other pending quizzes
      ],
    );
  }
}

class QuizCard extends StatelessWidget {
  final String quizName;
  final VoidCallback onPressed;

  const QuizCard({
    Key? key,
    required this.quizName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: blueViolet,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.quiz, color: Colors.white),
              title: Text(
                quizName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text('Take the quiz'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
