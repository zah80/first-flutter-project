import 'package:flutter/material.dart';
import 'sign_in_screen.dart'; // Import SignInScreen
import 'create_account_screen.dart'; // Import CreateAccountScreen

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Removed 'const' as 'Image.asset' cannot be const
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign in or create a new account",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/cap.JPG', // Make sure the path matches the asset location
              height: 350, // Adjust height based on your requirements
              // fit: BoxFit.contain, // Ensures the image fits within the box
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign In Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text("Login"), // Text for the ElevatedButton
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 160, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
              
              ),
            ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                // Navigate to Create Account Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'No account yet? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey, // Grey color for normal text
                  ),
                  children: [
                    TextSpan(
                      text: 'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue, // Blue color for the clickable text
                      ),
                    ),
                  ],
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Circular shape for the outline button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
