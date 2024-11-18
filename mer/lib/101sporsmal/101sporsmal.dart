import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import '../user_manager/user_manager.dart';
import 'question_page.dart';

class SporsmalFrontPage extends StatefulWidget {
  final UserManager userManager;

  SporsmalFrontPage({required this.userManager});

  @override
  _SporsmalFrontPageState createState() => _SporsmalFrontPageState();
}

class _SporsmalFrontPageState extends State<SporsmalFrontPage> {
  List<String> files = [];

  @override
  void initState() {
    super.initState();
    loadFiles();
  }

  Future<void> loadFiles() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final assetPaths = manifestMap.keys
        .where((String key) => key.startsWith('assets/snusboksen/') && key.endsWith('.txt'))
        .toList();

    setState(() {
      files = assetPaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Snusboksen',
                    style: GoogleFonts.anton(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                ...files.map((file) {
                  final fileName = file.split('/').last.split('.').first;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
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
                              builder: (context) => QuestionPage(
                                userManager: widget.userManager,
                                filePath: file,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          fileName,
                          style: GoogleFonts.anton( // Using Anton font from Google Fonts
                            fontSize: 30, // Larger font size
                            fontWeight: FontWeight.bold,
                            color: Colors.red, // Text color red
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}