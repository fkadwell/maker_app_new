import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //stateless widget that represents the entire app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Set the default font to Roboto
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  //stateless widget representing the Login page
  //stateless widget representing the login page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/login/images/design.png', // Change to your image path g
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF014C72), // Text color
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF014C72), // Text color
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Please enter Email:',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF014C72), // Text color
                    ),
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Please enter Password:',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF014C72), // Text color
                    ),
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Action when "Create an account" is pressed
                        },
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: Color(0xFF014C72), // Text color
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Action when "Reset Password" is pressed
                        },
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Color(0xFF014C72), // Text color
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Action when "Need Help?" is pressed
                      },
                      child: Text(
                        'Need Help ?',
                        style: TextStyle(
                          color: Color(0xFF014C72), // Text color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Action when "Login" is pressed
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white, // Button text color
                          fontSize: 20.0, // Button text size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                        minimumSize: Size(double.infinity, 50), // Button size
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
