import 'package:flutter/material.dart';
import '../user_manager/user_manager.dart'; 
import '../user_manager/add_users_page.dart';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

class DirtyPage extends StatefulWidget {
  final UserManager userManager;

  DirtyPage({required this.userManager});

  @override
  _DirtyPageState createState() => _DirtyPageState();
}

class _DirtyPageState extends State<DirtyPage> {
  List<String> questions = [];
  int currentQuestionIndex = 0;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/other/69sporsmal.txt');
    setState(() {
      questions = LineSplitter().convert(response);
      questions.shuffle();
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
    });
  }

  void previousQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex - 1 + questions.length) % questions.length;
    });
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
      body: Container(
        color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  '69 Spørsmål',
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
            ),
            Center(
              child: GestureDetector(
                onTap: nextQuestion,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    questions.isNotEmpty ? questions[currentQuestionIndex] : '',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: previousQuestion,
                    child: Container(color: Colors.transparent),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: nextQuestion,
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
