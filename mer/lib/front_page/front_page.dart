import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import google_fonts package
import 'package:mer/101sporsmal/101sporsmal.dart';
import 'package:mer/studenten/studenten.dart';
import '../user_manager/user_manager.dart'; 
import '../terning/dice_game_page.dart'; 
import '../musikk/music_page.dart'; 
import '../regler/rules_page.dart'; 
import '../kategorier/kategorier.dart'; 

class FrontPage extends StatefulWidget {
  final UserManager userManager;

  FrontPage({required this.userManager});

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _tapCount = 0;
  final TextEditingController _passwordController = TextEditingController();
  bool _specialFeaturesUnlocked = false;

  void _showPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Skriv in passord'),
          content: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(hintText: 'Passord'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_passwordController.text == 'kukost') {
                  setState(() {
                    _specialFeaturesUnlocked = true;
                  });
                  Navigator.of(context).pop();
                  _showSpecialFeatures();
                } else {
                  Navigator.of(context).pop();
                  _showErrorDialog();
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSpecialFeatures() {
    // Implement special features here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dev'),
          content: Text('Du er nå i utviklermodus!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Feil passord.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _handleTap() {
    setState(() {
      _tapCount++;
      if (_tapCount == 5) {
        _tapCount = 0;
        _showPasswordDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.red, // Set background color to red
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20), // Add padding to avoid overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              // Big orange text with solid white outline above the buttons
              GestureDetector(
                onTap: _handleTap,
                child: Container(
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
                        builder: (context) => SporsmalFrontPage(userManager: widget.userManager),
                      ),
                    );
                  },
                  child: Text(
                    'Snusboksen',
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                      fontSize: 30, // Larger font size
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Text color red
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
                        builder: (context) => StudentenPage(userManager: widget.userManager),
                      ),
                    );
                  },
                  child: Text(
                    'Bender',
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                      fontSize: 30, // Larger font size
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Text color red
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
                        builder: (context) => DicePage(specialFeaturesUnlocked: _specialFeaturesUnlocked),
                      ),
                    );
                  },
                  child: Text(
                    'Terning',
                    style: GoogleFonts.anton( // Using Anton font from Google Fonts
                      fontSize: 30, // Larger font size
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Text color red
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
                        builder: (context) => KategorierPage(userManager: widget.userManager,),
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
