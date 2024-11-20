import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:typed_data'; // Import for handling image data
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

void main() {
  runApp(DrinkingGameApp());
}

class DrinkingGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drinking Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrinkingGamePage(),
    );
  }
}

class DrinkingGamePage extends StatefulWidget {
  @override
  _DrinkingGamePageState createState() => _DrinkingGamePageState();
}

class _DrinkingGamePageState extends State<DrinkingGamePage> {
  final List<Uint8List> contestants = [];
  final Random random = Random();
  int selectedContestantIndex = -1;
  int sips = 0;
  bool showAnimation = false;
  bool isRolling = false;

  Future pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        contestants.add(bytes);
      });
    }
  }

  void showRandomContestant() {
    setState(() {
      isRolling = true;
    });

    // Roll through images quickly
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        selectedContestantIndex = random.nextInt(contestants.length);
        sips = random.nextInt(5) + 1; // Random number of sips between 1 and 5
        showAnimation = true;
        isRolling = false;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          showAnimation = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drinking Game'), // Default font for AppBar
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: pickImage,
          ),
        ],
      ),
      body: Container(
        color: Colors.red, // Set the background color to red
        child: Center(
          child: contestants.isEmpty
              ? Text(
                  'Add contestants by clicking the camera icon.',
                  style: GoogleFonts.anton(), // Apply Anton font
                )
              : SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (selectedContestantIndex != -1 || isRolling)
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedOpacity(
                                  opacity: showAnimation ? 1.0 : 1.0, // Keep the picture visible
                                  duration: Duration(milliseconds: 500), // Faster rolling effect
                                  child: CircleAvatar(
                                    backgroundImage: MemoryImage(
                                      contestants[isRolling
                                          ? random.nextInt(contestants.length)
                                          : selectedContestantIndex],
                                    ),
                                    radius: constraints.maxWidth * 0.3, // Responsive radius
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                              minimumSize: Size(constraints.maxWidth * 0.8, 50), // Responsive button size
                            ),
                            onPressed: showRandomContestant,
                            child: Text(
                              'Show Random Contestant',
                              style: GoogleFonts.anton(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          if (contestants.isNotEmpty)
                            Container(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: contestants.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundImage: MemoryImage(contestants[index]),
                                      radius: 40,
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (selectedContestantIndex != -1)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Sips Needed:',
                                    style: GoogleFonts.anton(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$sips',
                                    style: GoogleFonts.anton(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}