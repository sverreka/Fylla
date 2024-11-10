import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher package

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  final List<String> diceImages = [
    'assets/images/dice_1.png',
    'assets/images/dice_2.png',
    'assets/images/dice_3.png',
    'assets/images/dice_4.png',
    'assets/images/dice_5.png',
    'assets/images/dice_6.png',
  ];

  int _currentDiceFace = 0;

  // Spotify playlist URL
  final String spotifyPlaylistUrl = "https://open.spotify.com/playlist/7zNHkXHCC5O9cjxDQaSmMg?si=64fc336c5b9f4879"; // Replace with your actual Spotify playlist URL

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Create a rotation animation for 2D rotation
    _rotation = Tween<double>(begin: 0, end: pi * 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Listen for animation updates to change the dice face
    _controller.addListener(() {
      setState(() {
        _currentDiceFace = Random().nextInt(6); // Randomize the dice face
      });
    });
  }

  // Function to trigger the dice roll on tap
  void rollDice() {
    _controller.forward(from: 0); // Reset and start the animation
  }

  // Function to launch the Spotify URL
  void openSpotify() async {
    if (await canLaunch(spotifyPlaylistUrl)) {
      await launch(spotifyPlaylistUrl);
    } else {
      throw 'Could not launch $spotifyPlaylistUrl';
    }
  }

  // Secret hidden function to roll a 6 directly
  void rollSix() {
    setState(() {
      _currentDiceFace = 5; // Set the dice face to 6 (index 5)
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Adjust the height of the AppBar
        child: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Container(
                      width: 50,  // Set width of the Spotify logo
                      height: 50,  // Set height of the Spotify logo
                      child: Image.asset(
                        'assets/images/spotify.png',  // Path to your logo
                        fit: BoxFit.contain,  // Ensure the logo fits within the container
                      ),
                    ),
                    onPressed: openSpotify,  // Open the Spotify playlist when tapped
                  ),
                  SizedBox(width: 10),  // Add some space between the button and the text
                  Text(
                    'Opus - Eric Prydz', // Text next to the Spotify logo
                    style: TextStyle(
                      fontSize: 18,  // Set font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: const Color.fromARGB(255, 211, 57, 201),  // Set text color to white
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Dice animation using 2D rotation and GestureDetector to tap the dice
                GestureDetector(
                  onTap: rollDice, // Trigger the rollDice function when the dice is tapped
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotation.value, // 2D rotation
                        child: Image.asset(
                          diceImages[_currentDiceFace], // Show the current dice face
                          width: 250,
                          height: 250,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 50),
                // No button here, just tap the dice to roll
              ],
            ),
          ),
          // Secret button at the bottom-right (hidden unless tapped)
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: rollSix, // Roll a 6 when the secret area is tapped
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent, // Make the container invisible
              ),
            ),
          ),
        ],
      ),
    );
  }
}
