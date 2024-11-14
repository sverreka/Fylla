import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts package
import '../user_manager/user_manager.dart'; 
import '../101sporsmal/question_page.dart';
import '../101sporsmal/69_sporsmal.dart'; 


class SporsmalFrontPage extends StatelessWidget {
  final UserManager userManager;

  SporsmalFrontPage({required this.userManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Set background color to red
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set app bar to transparent to show the red background
        elevation: 0, // Remove the app bar shadow
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Big orange text with solid white outline above the buttons
            Container(
              margin: EdgeInsets.only(bottom: 40), // Space between the text and buttons
              child: Text(
                'Snusboksen',
                style: GoogleFonts.anton( // Using Anton font from Google Fonts
                  fontSize: 60, // Larger font size
                  fontWeight: FontWeight.bold,
                  color: Colors.orange, // Text color orange
                  shadows: [
                    Shadow(
                      offset: Offset(0, 0), // No offset for solid outline
                      blurRadius: 0, // No blur for solid outline
                      color: Colors.white, // Solid white outline
                    ),
                  ],
                ),
              ),
            ),

            // Button for 101 Questions game
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color
                  foregroundColor: Colors.white, // Button text color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the button
                  ),
                  minimumSize: Size(200, 50), // Fixed size for all buttons
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionPage(userManager: userManager),
                    ),
                  );
                },
                child: Text(
                  '101 Spørsmål',
                  style: TextStyle(
                    fontSize: 18, // Larger text for the button
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),


            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color
                  foregroundColor: Colors.white, // Button text color
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the button
                  ),
                  minimumSize: Size(200, 50), // Fixed size for all buttons
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DirtyPage(userManager: userManager),
                    ),
                  );
                },
                child: Text(
                  '69 Spørsmål',
                  style: TextStyle(
                    fontSize: 18, // Larger text for the button
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}