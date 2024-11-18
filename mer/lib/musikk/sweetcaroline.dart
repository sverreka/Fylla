import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

class SweetCaroline extends StatefulWidget {
  @override
  _SweetCarolineState createState() => _SweetCarolineState();
}

class _SweetCarolineState extends State<SweetCaroline> {
  List<String> leftColumnTexts = [];
  List<String> rightColumnTexts = [];

  @override
  void initState() {
    super.initState();
    _loadTexts();
  }

  Future<void> _loadTexts() async {
    final String fileContent = await rootBundle.loadString('assets/sanger/sweetcaroline.txt');
    final List<String> lines = fileContent.split('\n');

    setState(() {
      for (int i = 0; i < lines.length; i++) {
        if (i % 2 == 0) {
          leftColumnTexts.add(lines[i]);
        } else {
          rightColumnTexts.add(lines[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background
      appBar: AppBar(
        title: Text('Sweet Caroline'),
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0,
        scrolledUnderElevation: 0, // Remove shadow for app bar
        centerTitle: true, // Center the title
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Big orange text with solid white outline above the columns
            Container(
              margin: EdgeInsets.only(bottom: 40, top: 20), // Space between the text and columns
              child: Column(
                children: [
                  Text(
                    'Sweet Caroline',
                    style: GoogleFonts.anton(
                      fontSize: 40, // Larger font size
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
                  Text(
                    'av Dj Ötzi',
                    style: GoogleFonts.anton(
                      fontSize: 20, // Smaller font size
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
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: leftColumnTexts.length, // Number of lines (same as the number of pairs)
                  itemBuilder: (context, index) {
                    // Create a pair of texts for left and right columns
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          // Left Column Text
                          Expanded(
                            child: Text(
                              leftColumnTexts[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: index.isEven ? Colors.white : Colors.yellow, // Alternate color
                              ),
                            ),
                          ),
                          // Spacer between the columns
                          SizedBox(width: 20),
                          // Right Column Text
                          Expanded(
                            child: Text(
                              rightColumnTexts[index],
                              style: TextStyle(
                                fontSize: 16,
                                color: index.isEven ? Colors.white : Colors.yellow, // Alternate color
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
