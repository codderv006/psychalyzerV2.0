import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registration.dart';
import 'childdashb.dart';
import 'parentdashb.dart';
import 'counsellordashb.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'client.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isConsentChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showConsentDialog();
    });
  }

  void _login() async {
    if (!_isConsentChecked) {
      _showConsentDialog();
      return;
    }

    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? user = authResult.user;

      if (user != null) {
        // Retrieve user role from Firestore
        DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
            .instance
            .collection('users')
            .doc(user.uid)
            .get();
        String role = userDoc['role'];

        // Redirect based on the user's role
        switch (role) {
          case 'Child':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChildDashboard()),
            );
            break;
          case 'Parent':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ParentDashboard()),
            );
            break;
          case 'Counsellor':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ClientList(user: user)),
            );
            break;
          default:
          // Handle unknown role
            _showErrorDialog(
                'Role Error', 'Invalid role. Please contact support.');
        }
      }
    } catch (e) {
      print('Login error: $e');
      // If user is not registered, show an alert
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        _showRegisterDialog();
      } else {
        _showErrorDialog(
            'Login Error', 'Invalid email or password. Please try again.');
      }
    }
  }

  void _showConsentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Consent Form'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'By logging into this app, you consent to:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('1. Use of your information for research purposes.'),
                Text('2. App development and updates.'),
                Text(
                    '3. Secure storage of your personal information, accessible only by authorized personnel.'),
                Text(
                    '4. Deletion of your information upon request, subject to certain conditions.'),
                Text(
                    '5. Understand that the results of mental health assessments provided by this app are not 100% reliable. Seek help from a mental health professional if needed.'),
                SizedBox(height: 8),
                Text(
                  'Your data privacy and security are important to us. If you have any concerns, please contact support.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _isConsentChecked,
                      onChanged: (value) {
                        setState(() {
                          _isConsentChecked = value ?? false;
                        });
                      },
                    ),
                    Text('I agree to the T&C.'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog
              },
              child: Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_isConsentChecked) {
                  Navigator.pop(context); // Close the alert dialog
                  // Proceed with login or registration
                  _login();
                } else {
                  // Just close the dialog if consent is not checked
                  Navigator.pop(context);
                }
              },
              child: Text('Proceed'),
            ),
          ],
        );
      },
    );
  }


  void _showRegisterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Not Registered'),
          content: Text('Do you want to register now?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog
                // Navigate to the registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationPage(),
                  ),
                );
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the alert dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationPage(),
                  ),
                );
              },
              child: Text('Not registered? Register now'),
            ),
          ],
        ),
      ),
    );
  }
}
