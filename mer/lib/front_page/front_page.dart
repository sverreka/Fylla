import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts package
import 'package:mer/101sporsmal/101sporsmal.dart';
import 'package:mer/studenten/studenten.dart';
import '../user_manager/user_manager.dart'; 
import '../user_manager/add_users_page.dart';
import '../terning/dice_game_page.dart'; 
import '../musikk/music_page.dart'; 
import '../regler/rules_page.dart'; 
import '../kategorier/kategorier.dart'; 


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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20), // Add padding to avoid overflow
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
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    minimumSize: Size(300, 100), // Fixed size for all buttons
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
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                    fontSize: 30, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Text color orange
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
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    minimumSize: Size(300, 100), // Fixed size for all buttons
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
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                    fontSize: 30, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Text color orange
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
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    minimumSize: Size(300, 100), // Fixed size for all buttons
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
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                    fontSize: 30, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Text color orange
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
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    minimumSize: Size(300, 100), // Fixed size for all buttons
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Drikkesanger',
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                    fontSize: 30, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Text color orange
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
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    minimumSize: Size(300, 100), // Fixed size for all buttons
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KategorierPage(userManager: userManager,),
                      ),
                    );
                  },
                  child: Text(
                    'Kategorier',
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                    fontSize: 30, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Text color orange
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // New "Regler" button to navigate to RulesPage
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button background color
                    foregroundColor: Colors.white, // Button text color
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners for the button
                      side: BorderSide(color: Colors.white, width: 2), // White outline
                    ),
                    minimumSize: Size(300, 100), // Fixed size for all buttons
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RulesPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Regler',
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                    fontSize: 30, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Text color orange
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
