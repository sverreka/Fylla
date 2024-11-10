import 'package:flutter/material.dart';
import 'user_manager.dart';
import 'add_users_page.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatefulWidget {
  final UserManager userManager;

  QuestionPage({required this.userManager});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<Question> questions = [
    Question('Hvem her i rommet skal kysse den til høyre for seg?', requiresUsers: false),
    Question('Hvem har størst kuk?', requiresUsers: false),
    Question('Hvem tar det den får?', requiresUsers: false),
    Question('Hvem har finest kropp?', requiresUsers: false),
    Question('Hvem er mest skoleflink?', requiresUsers: false),
    Question('Hvem har mest flus?', requiresUsers: false),
    Question('Hvem har den styggeste dialekten?', requiresUsers: false),
    Question('Hvem ville du tatt med på en øde øy?', requiresUsers: false),
    Question('SKÅÅÅÅÅÅL!?', requiresUsers: false),
    Question('Hvem er den mest sjenerøse?', requiresUsers: false),
    Question('Hvem har best stil??', requiresUsers: false),
    Question('Hvem kan drikke mest uten å bli full?', requiresUsers: false),
    Question('Hvem i rommet kunne du tenkt deg å ha en het natt med?', requiresUsers: false),
    Question('Hvem har den beste sjansen til å få et one-night-stand i kveld?', requiresUsers: false),
    Question('Hvem sine foreldre er diggest?', requiresUsers: false),
    Question('Hvem bruker mest penger på kle?', requiresUsers: false),
    Question('Hvem er den største tøffelen?', requiresUsers: false),
    Question('Hvem får alltid et nei til å bli et ja?', requiresUsers: false),
    Question('Hvem er den største gamblingavhengige?', requiresUsers: false),
    Question('Hvem har best musikksmak?', requiresUsers: false),
    Question('Hvem jukser mest?', requiresUsers: false),
    Question('Hvem har finest øyner?', requiresUsers: false),
    Question('Hvem har de største titsa?', requiresUsers: false),
    Question('Hvem hadde vært fotballproff om det ikke var for en skade?', requiresUsers: false),
    Question('Hvem onanerer mest?', requiresUsers: false),
    Question('Hvem har den mest poisitive instillingen?', requiresUsers: false),
    Question('Hvem er den mest joviale?', requiresUsers: false),
    Question('Hvem er mest bortskjemt?', requiresUsers: false),
    Question('Hvem tenker alltid koffert?', requiresUsers: false),
    Question('Hvem bruker mest sminke?', requiresUsers: false),
    Question('Hvem synest best om seg selv?', requiresUsers: false),
    Question('Gi boksen til en person og nevn 3 personer til fuck, marry, kill.', requiresUsers: false),
    Question('Hvem skjuler en mørk side av seg selv?', requiresUsers: false),
    Question('Hvem er alltid på mobilen?', requiresUsers: false),
    Question('Hvem er dårligst sjåfør?', requiresUsers: false),
    Question('Hvem er best på å chugge?', requiresUsers: false),
    Question('Hvem googler seg selv mest?', requiresUsers: false),
    Question('Hvem har shava og er klar for en våt natt?', requiresUsers: false),
    Question('Hvem ender opp på gaten?', requiresUsers: false),
    Question('Hvem snorker mest?', requiresUsers: false),
    Question('Hvem slipper dei værste fisene?', requiresUsers: false),
    Question('Hvem er den største nerden?', requiresUsers: false),
    Question('Hvem rir best?', requiresUsers: false),
    Question('Hvem er den beste kysseren?', requiresUsers: false),
    Question('Hvem hoster dei beste vorsene?', requiresUsers: false),
    Question('Hvem må alltid avbryte alt dei gjer for å ta bilde i golden hour?', requiresUsers: false),
    Question('Hvem er mest drita?', requiresUsers: false),
    Question('Hvem er mest edru?', requiresUsers: false),
    Question('Hvem kler briller best?', requiresUsers: false),
    Question('Hvem er mest blond?', requiresUsers: false),
    Question('Hvem er den største playeren?', requiresUsers: false),
    Question('Hvem synger styggest?', requiresUsers: false),
    Question('Hvem skal lese opp sin nettleserhistorikk?', requiresUsers: false),
    Question('Hvem er mest kjent i byen?', requiresUsers: false),
    Question('Hvem er mest sjarmerende?', requiresUsers: false),
    Question('Hvem er den største tinderhoren?', requiresUsers: false),
    Question('Hvem er mest frekk i kjeften?', requiresUsers: false),
    Question('Hvem tar alltid en for laget?', requiresUsers: false),
    Question('Hvem skal chugge en enhet ilag med deg?', requiresUsers: false),
    Question('Hvem ender alltid opp i slosskamp på byen?', requiresUsers: false),
    Question('Hvem blir bedt om å gå en runde før dei kommer inn på byen?', requiresUsers: false),
    Question('Hvem kunne du aldri tatt med deg i et familieselskap?', requiresUsers: false),
    Question('Hvem er mest spontan?', requiresUsers: false),
    Question('Hvem tror på synske?', requiresUsers: false),
    Question('Hvem er tøffest i trynet?', requiresUsers: false),
    Question('Hvem er sjef?', requiresUsers: false),
    Question('Hvem har høyest ego?', requiresUsers: false),
    Question('Hvem tror selv den er morsomst?', requiresUsers: false),
    Question('Hvem har høyest bodycount?', requiresUsers: false),
    Question('Hvem har et barn med et one-night-stand uten å vite om det?', requiresUsers: false),
    Question('Hvem lever fortsatt i russetiden?', requiresUsers: false),
    Question('Hvem ville du hatt med deg på en trekant?', requiresUsers: false),
    Question('Hvem gir dei beste kjærlighetsrådene?', requiresUsers: false),
    Question('Hvem er den beste wingman?', requiresUsers: false),
    Question('Hvem er snillest?', requiresUsers: false),
    Question('Hvem kommer til å stryke i et fag dette semesteret?', requiresUsers: false),
    Question('Hvem kommer raskest?', requiresUsers: false),
    Question('Hvem er mest gay?', requiresUsers: false),
    Question('Hvem er den største rasisten?', requiresUsers: false),
    Question('Hvem har drøyest humor?', requiresUsers: false),
    Question('Hvem stikker uten å si ifra?', requiresUsers: false),
    Question('Hvem kommer til å bli mest suksessfull?', requiresUsers: false),
    Question('Hvem kommer til å gifte seg først?', requiresUsers: false),
    Question('Hvem lyser opp rommet?', requiresUsers: false),
    Question('Hvem skiller seg mest ut i mengden?', requiresUsers: false),
    Question('Hvem er best på smalltalk?', requiresUsers: false),
    Question('Hvem er mest utadvendt?', requiresUsers: false),
    Question('Hvem spanderer alltid på byen?', requiresUsers: false),
    Question('Hvem løper fortest?', requiresUsers: false),
    Question('Hvem må bli oftere med ut?', requiresUsers: false),
    Question('Hvem bor finest?', requiresUsers: false),
    Question('Hvem kommer til å spy ikveld?', requiresUsers: false),
    Question('Hvem går hjem før byen?', requiresUsers: false),
    Question('Hvem tenker alltid nattmat istedenfor byen?', requiresUsers: false),
    Question('Hvem er mest eventyrlysten?', requiresUsers: false),
    Question('Hvem gir mest til veldedighet?', requiresUsers: false),
    Question('Hvem er mest ubesluttsom?', requiresUsers: false),
    Question('Hvem er mest rettferdig?', requiresUsers: false),
    Question('Hvem er den værste stalkeren?', requiresUsers: false),
    Question('Hvem bruker mest penger på wolt/foodora?', requiresUsers: false),
    Question('Hvem her lykkeligst', requiresUsers: false),
    Question('Hvem er sterkest?', requiresUsers: false),


    // Add more questions here...
  ];

  int currentQuestionIndex = 0;
  bool showWarning = false;
  bool warningShown = false; 
  Random random = Random();

  @override
  void initState() {
    super.initState();
    questions.shuffle();
    if (questions[currentQuestionIndex].requiresUsers && widget.userManager.users.isEmpty) {
      showWarningOnce();
      nextQuestion();
    }
  }

  void nextQuestion() {
    setState(() {
      int attempts = 0;
      bool foundQuestion = false;
      while (attempts < questions.length && !foundQuestion) {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
        if (questions[currentQuestionIndex].requiresUsers && widget.userManager.users.isEmpty) {
          if (!warningShown) {
            showWarningOnce();
          }
        } else {
          foundQuestion = true;
        }
        attempts++;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      int attempts = 0;
      bool foundQuestion = false;
      while (attempts < questions.length && !foundQuestion) {
        currentQuestionIndex = (currentQuestionIndex - 1) % questions.length;
        if (currentQuestionIndex < 0) {
          currentQuestionIndex = questions.length - 1;
        }
        if (questions[currentQuestionIndex].requiresUsers && widget.userManager.users.isEmpty) {
          if (!warningShown) {
            showWarningOnce();
          }
        } else {
          foundQuestion = true;
        }
        attempts++;
      }
    });
  }

  void showWarningOnce() {
    if (!warningShown) {
      setState(() {
        showWarning = true;
        warningShown = true;
      });

      Future.delayed(Duration(seconds: 10), () {
        setState(() {
          showWarning = false;
        });
      });
    }
  }

  String getQuestionWithUser() {
    Question question = questions[currentQuestionIndex];
    if (question.requiresUsers && widget.userManager.users.isEmpty) {
      return '';
    }
    if (question.requiresUsers) {
      if (question.twoPlayers) {
        String user1 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
        String user2 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
        while (user1 == user2 && widget.userManager.users.length > 1) {
          user2 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
        }
        return question.text.replaceAll('{user1}', user1).replaceAll('{user2}', user2);
      } else {
        String randomUser = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
        return question.text.replaceAll('{user}', randomUser);
      }
    } else {
      return question.text;
    }
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
                  '101 Spørsmål',
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
                    getQuestionWithUser(),
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
                      'Husk å legge til spillere for kulere spørsmål',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
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

class Question {
  final String text;
  final bool requiresUsers;
  final bool twoPlayers;

  Question(this.text, {this.requiresUsers = false, this.twoPlayers = false});
}