import 'package:flutter/material.dart';
import 'loginpage.dart'; // Import LoginPage

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delayed navigation to login page after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo here
            Image.asset(
              'assets/logo.png', // Adjust the path to your logo image
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Psychalyzer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Center( // Center alignment for the tagline text
              child: Text(
                'Early childhood mental health \n Assessment, Monitoring, Tracking',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
