import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'rules_display_page.dart'; // Import the RulesDisplayPage

class RulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background for the page
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent, // Transparent app bar to show the red background
        elevation: 0, // Remove shadow for app bar
        centerTitle: true, // Center the title
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _getRulesFiles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final files = snapshot.data as List<String>;
              return Center(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 40), // Space between the text and buttons
                          child: Text(
                            'Regler',
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
                        ...files.map((filePath) {
                          final fileName = filePath.split('/').last;
                          final title = StringExtension(fileName.replaceAll('.txt', '').replaceAll('_', ' ')).capitalize();

                          return Column(
                            children: [
                              ElevatedButton(
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
                                  // Navigate to RulesDisplayPage with the path to the file
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RulesDisplayPage(
                                        title: title,
                                        filePath: filePath,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  title, // Button text
                                  style: TextStyle(
                                    fontSize: 18, // Button text size
                                    fontWeight: FontWeight.bold, // Bold text
                                  ),
                                ),
                              ),
                              SizedBox(height: 20), // Space between buttons
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<String>> _getRulesFiles() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final rulesFiles = manifestMap.keys
        .where((String key) => key.contains('assets/regler/') && key.endsWith('.txt'))
        .toList();
    return rulesFiles;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}