// import 'package:flutter/material.dart';
// import 'loginpage.dart';
// import 'firebase_service.dart';
// import 'chatbot.dart';
// import 'quiz.dart';
//
// final Color blueViolet = Color(0xFF8A2BE2);
//
// class ParentDashboard extends StatelessWidget {
//   final FirebaseService _firebaseService = FirebaseService();
//
//   void navigateToQuiz(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => QuizPage(onQuizCompleted: onQuizCompleted),
//       ),
//     );
//   }
//
//   void onQuizCompleted(List<Map<String, dynamic>> quizData) async {
//     try {
//       // Get the user ID
//       String userId = await _firebaseService.getUserId() ?? '';
//
//       // Save quiz responses to Firebase
//       await _firebaseService.saveQuizResponses(userId, quizData);
//
//       // Additional logic after saving the quiz responses
//       // For example, show a success message or navigate to another page
//     } catch (e) {
//       print('Error saving quiz responses: $e');
//       // Handle the error as needed
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Psychalyzer'),
//         automaticallyImplyLeading: false,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LoginPage(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Pending tests',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   color: Colors.black,
//                   height: 2,
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   height: MediaQuery.of(context).size.height * 0.3,
//                   child: ListView(
//                     children: <Widget>[
//                       _buildTestCard(
//                         testName: 'ADHD Test',
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (_) => SimpleDialog(
//                               contentPadding: EdgeInsets.all(16),
//                               titlePadding: EdgeInsets.all(16),
//                               title: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('ADHD Information'),
//                                   IconButton(
//                                     icon: Icon(Icons.close),
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               children: [
//                                 SingleChildScrollView(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       _buildSection(
//                                         title: 'What is ADHD?',
//                                         content:
//                                         'Attention-Deficit/Hyperactivity Disorder, commonly known as ADHD, is a neurodevelopmental disorder that affects both children and adults. It is characterized by persistent patterns of inattention, hyperactivity, and impulsivity that can significantly impact daily functioning.',
//                                       ),
//                                       _buildSection(
//                                         title: 'Inattention Symptoms:',
//                                         content: '• Difficulty staying focused on tasks.\n'
//                                             '• Frequent careless mistakes.\n'
//                                             '• Trouble organizing activities.\n'
//                                             '• Avoiding tasks requiring effort.\n'
//                                             '• Easily distracted.\n'
//                                             '• Forgetfulness in daily life.',
//                                       ),
//                                       _buildSection(
//                                         title: 'Hyperactivity-Impulsivity Symptoms:',
//                                         content: '• Fidgeting or restlessness.\n'
//                                             '• Inability to stay seated.\n'
//                                             '• Excessive talking.\n'
//                                             '• Interrupting others.\n'
//                                             '• Impatience, difficulty waiting turns.',
//                                       ),
//                                       _buildSection(
//                                         title: 'Assessment:',
//                                         content: '• Clinical evaluation (symptoms, milestones, family history).\n'
//                                             '• Behavioral observations (school, home).\n'
//                                             '• Questionnaires and rating scales (teachers, parents, individual).\n'
//                                             '• Neuropsychological testing (attention, executive function).',
//                                       ),
//                                       _buildSection(
//                                         title: 'Treatments:',
//                                         content: '• Medication : Includes stimulants (e.g., methylphenidate) or non-stimulants (e.g., atomoxetine).\n'
//                                             '• Educational Support : Provides academic accommodations and plans.\n'
//                                             '• Parent & Family Education : Teaches support strategies.\n'
//                                             '• Lifestyle Modifications : Routines, exercise, diet, and sleep.\n'
//                                             '• Individualized Approach : Tailored to the person\'s needs.',
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(height: 16),
//                                 Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       Navigator.pop(
//                                           context); // Close the dialog
//                                       navigateToQuiz(
//                                           context); // Start the quiz
//                                     },
//                                     child: Text('Start Quiz'),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       _buildTestCard(
//                         testName: 'Autism Test',
//                         onPressed: () {
//                           // Add navigation to Autism test page
//                         },
//                       ),
//                       _buildTestCard(
//                         testName: 'General Behavior Test',
//                         onPressed: () {
//                           // Add navigation to General Behavior test page
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   "Child's Report:",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   color: Colors.black,
//                   height: 2,
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   height: 200,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: <Widget>[
//                         _buildCircularSquare(Colors.red),
//                         _buildCircularSquare(Colors.blue),
//                         _buildCircularSquare(Colors.green),
//                         _buildCircularSquare(Colors.yellow),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ChatBotPage(),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         color: blueViolet,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30),
//                         ),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'TALK Bot',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTestCard({required String testName, required Function onPressed}) {
//     return Card(
//       color: blueViolet,
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         side: BorderSide(color: Colors.black),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.quiz, color: Colors.white),
//               title: Text(
//                 testName,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 width: 200, // Increased width
//                 child: ElevatedButton(
//                   onPressed: onPressed as void Function()?,
//                   child: Text('Take the quiz'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCircularSquare(Color color) {
//     return Container(
//       width: 100,
//       height: 100,
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
//
//   Widget _buildSection({required String title, required String content}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(content),
//         SizedBox(height: 16),
//       ],
//     );
//   }
// }
//











import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'loginpage.dart';
import 'firebase_service.dart';
import 'chatbot.dart'; // Import the ChatBotPage class from chatbot.dart
import 'quiz.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

final Color blueViolet = Color(0xFF57B7CD);

class ParentDashboard extends StatefulWidget {
  @override
  _ParentDashboardState createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
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
      ChatBotPage(), // This is where you use the ChatBotPage widget
      ChildReportSection(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Psychalyzer'),
        automaticallyImplyLeading: false,
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
            icon: Icon(Icons.description),
            selectedColor: blueViolet,
          ),
        ],
      ),
    );
  }
}

// The rest of your code remains the same



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
                text: "Child's Report",
                onPressed: () {
                  // Update selected index to ChildReportSection
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
  final FirebaseService _firebaseService = FirebaseService();

  void navigateToQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(onQuizCompleted: onQuizCompleted),
      ),
    );
  }

  void onQuizCompleted(List<Map<String, dynamic>> quizData) async {
    try {
      // Get the user ID
      String userId = await _firebaseService.getUserId() ?? '';

      // Save quiz responses to Firebase
      await _firebaseService.saveQuizResponses(userId, quizData);

      // Additional logic after saving the quiz responses
      // For example, show a success message or navigate to another page
    } catch (e) {
      print('Error saving quiz responses: $e');
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pending tests',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.black,
                height: 2,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView(
                  children: <Widget>[
                    _buildTestCard(
                      testName: 'ADHD Test',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => SimpleDialog(
                            contentPadding: EdgeInsets.all(16),
                            titlePadding: EdgeInsets.all(16),
                            title: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ADHD Information'),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    _buildSection(
                                      title: 'What is ADHD?',
                                      content:
                                      'Attention-Deficit/Hyperactivity Disorder, commonly known as ADHD, is a neurodevelopmental disorder that affects both children and adults. It is characterized by persistent patterns of inattention, hyperactivity, and impulsivity that can significantly impact daily functioning.',
                                    ),
                                    _buildSection(
                                      title: 'Inattention Symptoms:',
                                      content: '• Difficulty staying focused on tasks.\n'
                                          '• Frequent careless mistakes.\n'
                                          '• Trouble organizing activities.\n'
                                          '• Avoiding tasks requiring effort.\n'
                                          '• Easily distracted.\n'
                                          '• Forgetfulness in daily life.',
                                    ),
                                    _buildSection(
                                      title: 'Hyperactivity-Impulsivity Symptoms:',
                                      content: '• Fidgeting or restlessness.\n'
                                          '• Inability to stay seated.\n'
                                          '• Excessive talking.\n'
                                          '• Interrupting others.\n'
                                          '• Impatience, difficulty waiting turns.',
                                    ),
                                    _buildSection(
                                      title: 'Assessment:',
                                      content: '• Clinical evaluation (symptoms, milestones, family history).\n'
                                          '• Behavioral observations (school, home).\n'
                                          '• Questionnaires and rating scales (teachers, parents, individual).\n'
                                          '• Neuropsychological testing (attention, executive function).',
                                    ),
                                    _buildSection(
                                      title: 'Treatments:',
                                      content: '• Medication : Includes stimulants (e.g., methylphenidate) or non-stimulants (e.g., atomoxetine).\n'
                                          '• Educational Support : Provides academic accommodations and plans.\n'
                                          '• Parent & Family Education : Teaches support strategies.\n'
                                          '• Lifestyle Modifications : Routines, exercise, diet, and sleep.\n'
                                          '• Individualized Approach : Tailored to the person\'s needs.',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Close the dialog
                                    navigateToQuiz(
                                        context); // Start the quiz
                                  },
                                  child: Text('Start Quiz'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    _buildTestCard(
                      testName: 'Autism Test',
                      onPressed: () {
                        // Add navigation to Autism test page
                      },
                    ),
                    _buildTestCard(
                      testName: 'General Behavior Test',
                      onPressed: () {
                        // Add navigation to General Behavior test page
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTestCard({required String testName, required Function onPressed}) {
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
                testName,
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
                width: 200, // Increased width
                child: ElevatedButton(
                  onPressed: onPressed as void Function()?,
                  child: Text('Take the quiz'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(content),
        SizedBox(height: 16),
      ],
    );
  }
}

class ChildReportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Child's Report:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.black,
                height: 2,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      _buildCircularSquare(Colors.red),
                      _buildCircularSquare(Colors.blue),
                      _buildCircularSquare(Colors.green),
                      _buildCircularSquare(Colors.yellow),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircularSquare(Color color) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
