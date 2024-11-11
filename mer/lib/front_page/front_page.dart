import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts package
import 'package:mer/101sporsmal/101sporsmal.dart';
import 'package:mer/studenten/studenten.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:flutter/material.dart'; 
import '../user_manager/user_manager.dart'; 
import '../user_manager/add_users_page.dart';
import '../101sporsmal/question_page.dart'; 
import '../terning/dice_game_page.dart'; 
import '../musikk/music_page.dart'; 
import '../studenten/studenten.dart';

class FrontPage extends StatelessWidget {
  final UserManager userManager;

  FrontPage({required this.userManager});

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
                'Fylla!',
                style: GoogleFonts.anton( // Using Anton font from Google Fonts
                  fontSize: 80, // Larger font size
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
                      builder: (context) => SporsmalFrontPage(userManager: userManager),
                    ),
                  );
                },
                child: Text(
                  'Snusboksen',
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
                      builder: (context) => StudentenPage(userManager: userManager),
                    ),
                  );
                },
                child: Text(
                  'Studenten',
                  style: TextStyle(
                    fontSize: 18, // Larger text for the button
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Button to add players
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
                      builder: (context) => AddUsersPage(userManager: userManager),
                    ),
                  );
                },
                child: Text(
                  'Legg til spillere',
                  style: TextStyle(
                    fontSize: 18, // Larger text for the button
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Button to open Dice Game page
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,                  
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
                      builder: (context) => DicePage(),
                    ),
                  );
                },
                child: Text(
                  'Terning',
                  style: TextStyle(
                    fontSize: 18, // Larger text for the button
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // New "Drikkesanger" button to navigate to MusicPage
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
                      builder: (context) => MusicPage(),
                    ),
                  );
                }, // Navigate to MusicPage
                child: Text(
                  'Drikkesanger',
                  style: TextStyle(
                    fontSize: 18, // Larger text for the button
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}