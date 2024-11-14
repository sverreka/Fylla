import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'foreveralonepage.dart' as foreveralone; // Alias the ForeverAlonePage import
import 'package:google_fonts/google_fonts.dart';
import 'sexonfire.dart' as sexonfire;
import 'sweetcaroline.dart' as sweetcaroline; // Alias the SexOnFirePage import

class MusicPage extends StatelessWidget {
  // URLs for your playlists (replace these with actual URLs)
  final String festMusikkUrl = "https://open.spotify.com/playlist/24BrIjOjrEs4DH01fnOqIQ?si=c3937824e0434fb0"; // Replace with actual Festmusikk playlist URL
  final String drikkeLekerUrl = "https://open.spotify.com/playlist/7zNHkXHCC5O9cjxDQaSmMg?si=b794142eabcd4b5d"; // Replace with actual Drikkeleker playlist URL

  // Function to open Spotify playlist
  void _openSpotify(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background for the page
      appBar: AppBar(
        title: Text('Musikk'),
        backgroundColor: Colors.transparent, // Transparent app bar to show the red background
        elevation: 0, // Remove shadow for app bar
        centerTitle: true, // Center the title
      ),
      
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Festmusikk Button
             Container(
              margin: EdgeInsets.only(bottom: 40), // Space between the text and buttons
              child: Text(
                'Musikk!',
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
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color (orange)
                  foregroundColor: Colors.white, // Button text color (white)
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for button
                  ),
                  minimumSize: Size(250, 50), // Fixed size for buttons
                ),
                onPressed: () => _openSpotify(festMusikkUrl), // Open Festmusikk playlist
                child: Text(
                  'Fest Spilleliste',
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Drikkeleker Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color (orange)
                  foregroundColor: Colors.white, // Button text color (white)
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for button
                  ),
                  minimumSize: Size(250, 50), // Fixed size for buttons
                ),
                onPressed: () => _openSpotify(drikkeLekerUrl), // Open Drikkeleker playlist
                child: Text(
                  'Drikkeleker spilleliste',
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Forever Alone Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color (orange)
                  foregroundColor: Colors.white, // Button text color (white)
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for button
                  ),
                  minimumSize: Size(250, 50), // Fixed size for buttons
                ),
                onPressed: () {
                  // Navigate to Forever Alone page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => foreveralone.ForeverAlonePage()),
                  );
                },
                child: Text(
                  'Forever Alone', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color (orange)
                  foregroundColor: Colors.white, // Button text color (white)
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for button
                  ),
                  minimumSize: Size(250, 50), // Fixed size for buttons
                ),
                onPressed: () {
                  // Navigate to Forever Alone page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sweetcaroline.SweetCaroline()),
                  );
                },
                child: Text(
                  'Sweet Caroline', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Sex On Fire Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button background color (orange)
                  foregroundColor: Colors.white, // Button text color (white)
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for button
                  ),
                  minimumSize: Size(250, 50), // Fixed size for buttons
                ),
                onPressed: () {
                  // Navigate to Sex On Fire page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sexonfire.SexOnFirePage()),
                  );
                },
                child: Text(
                  'Sex On Fire', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
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
