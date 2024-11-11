import 'package:flutter/material.dart';
import '../user_manager/user_manager.dart'; 
import '../user_manager/add_users_page.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;

class StudentenPage extends StatefulWidget {
  final UserManager userManager;

  StudentenPage({required this.userManager});

  @override
  _StudentenPageState createState() => _StudentenPageState();
}

class _StudentenPageState extends State<StudentenPage> {
  List<String> questions = [];
  int currentQuestionIndex = 0;
  bool showWarning = false;
  bool warningShown = false;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/other/studenten.txt');
    setState(() {
      questions = response.split('\n');
      questions.shuffle(); // Randomize the order of the questions
    });
  }

  void nextQuestion() {
    if (widget.userManager.users.isNotEmpty) {
      setState(() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
      });
    } else {
      showWarningOnce();
    }
  }

  void previousQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex - 1 + questions.length) % questions.length;
    });
  }

  void showWarningOnce() {
    if (!warningShown) {
      setState(() {
        showWarning = true;
        warningShown = true;
      });

      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          showWarning = false;
        });
      });
    }
  }

  String getQuestionWithUser() {
    if (widget.userManager.users.isEmpty) {
      return '';
    }

    String question = questions[currentQuestionIndex];
    String user1 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
    String user2 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];

    while (user1 == user2 && widget.userManager.users.length > 1) {
      user2 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
    }

    return question
        .replaceAll('{user1}', user1)
        .replaceAll('{user2}', user2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spørsmål ${currentQuestionIndex + 1}'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddUsersPage(userManager: widget.userManager),
                ),
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTapUp: (details) {
          double width = MediaQuery.of(context).size.width;

          // Check if the tap was on the left or right side of the screen
          if (details.localPosition.dx < width / 2) {
            previousQuestion(); // Go to previous question on left side click
          } else {
            nextQuestion(); // Go to next question on right side click
          }
        },
        child: Container(
          color: Colors.red, // Background color
          child: Stack(
            children: [
              // Title "Studenten" at the top with same style
              Positioned(
                top: 40,
                left: 20,
                right: 20,
                child: Text(
                  'Studenten',
                  style: GoogleFonts.anton(
                    fontSize: 80,
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
                  textAlign: TextAlign.center,
                ),
              ),
              // Centered question text
              Center(
                child: GestureDetector(
                  onTap: nextQuestion, // Move to next question on tap
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      getQuestionWithUser(),
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white, // Text color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              // Show warning if no players added
              if (showWarning)
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: AnimatedOpacity(
                    opacity: showWarning ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.redAccent,
                      child: Text(
                        'Legg til spillere for å starte!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
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
