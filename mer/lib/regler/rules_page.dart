import 'package:flutter/material.dart';
import 'rules_display_page.dart'; // Import the RulesDisplayPage

class RulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background for the page
      appBar: AppBar(
        title: Text('Regler'),
        backgroundColor: Colors.transparent, // Transparent app bar to show the red background
        elevation: 0, // Remove shadow for app bar
        centerTitle: true, // Center the title
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Studenten Button
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
                  // Navigate to RulesDisplayPage with the path to studentenregler.txt
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesDisplayPage(
                        title: 'Studenten Regler',
                        filePath: 'assets/regler/studentenregler.txt',
                      ),
                    ),
                  );
                },
                child: Text(
                  'Studenten', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between buttons

            // Musikk Button
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
                  // Navigate to RulesDisplayPage with the path to musikkregler.txt
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesDisplayPage(
                        title: 'Musikk Regler',
                        filePath: 'assets/regler/musikkregler.txt',
                      ),
                    ),
                  );
                },
                child: Text(
                  'Musikk', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

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
                  // Navigate to RulesDisplayPage with the path to studentenregler.txt
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesDisplayPage(
                        title: 'Snusboksen regler',
                        filePath: 'assets/regler/snusboksen.txt',
                      ),
                    ),
                  );
                },
                child: Text(
                  'Snusboksen', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

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
                  // Navigate to RulesDisplayPage with the path to studentenregler.txt
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesDisplayPage(
                        title: 'Kategorier regler',
                        filePath: 'assets/regler/kategorierregler.txt',
                      ),
                    ),
                  );
                },
                child: Text(
                  'Kategorier', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

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
                  // Navigate to RulesDisplayPage with the path to studentenregler.txt
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesDisplayPage(
                        title: 'Opus regler',
                        filePath: 'assets/regler/opusregler.txt',
                      ),
                    ),
                  );
                },
                child: Text(
                  'Opus', // Button text
                  style: TextStyle(
                    fontSize: 18, // Button text size
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
