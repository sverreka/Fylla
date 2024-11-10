import 'package:flutter/material.dart';
import 'user_manager.dart';
import 'add_users_page.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class StudentenPage extends StatefulWidget {
  final UserManager userManager;

  StudentenPage({required this.userManager});

  @override
  _StudentenPageState createState() => _StudentenPageState();
}

class _StudentenPageState extends State<StudentenPage> {
  final List<Question> questions = [
    Question(
        '{user1} er på date med {user2}. {user1} bruk 1 minutt på å forføre {user2}. Om den så har boksen godtar forføringen, kan {user1} dele ut 10 slurker.',
        requiresUsers: true,
        twoPlayers: true),
    Question(
        '{user1} og {user2} finn fram en full enhet. No skal dere ha kappløp i chugging. KJØØØR!',
        requiresUsers: true,
        twoPlayers: true),
    Question(
        '{user1} og {user2} Still dere rygg mot rygg. Den som har boksen stiller dere 3 spørsmål. Om du mener det er deg drikker du. Om dere er enige drikker resten. Om dere er uenige drikker dere.',
        requiresUsers: true,
        twoPlayers: true),
    Question('Jeg har aldri strøket på en eksamen.', requiresUsers: false),
    Question('Jeg har aldri glemt navnet på et one-night-stand.', requiresUsers: false),
    Question('{user1} vis din nettleserhistorikk eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('{user1} vipps 50kr til 47711007 eller drikk 10 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Jeg har aldri fått et nei til å bli ja.', requiresUsers: false),
    Question('Kategorien er ølmerker. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2} er nå drink buddies.', requiresUsers: true, twoPlayers: true),
    Question('Jeg har aldri hatt meg med noen med 5 år i aldersforskjell.', requiresUsers: false),
    Question('Alle som drikker vin idag må ta 3 slurker.', requiresUsers: false),
    Question('Alle som drikker øl idag må ta 3 slurker.', requiresUsers: false),
    Question('Den som styrer musikken kan dele ut 7 slurker.', requiresUsers: false),
    Question('Jeg har aldri onanert på jobb', requiresUsers: false),
    Question('{user1} velg 2 personer i rommet du ville hatt med på trekant eller drikk 3 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Hot seat! alle still et spørsmål til {user1}. For alle spørsmålene {user1} nekter å svare på må {user1} drikke 1 slurk. ', requiresUsers: true, twoPlayers: true),
    Question(
        '{user1} og {user2} Still dere rygg mot rygg. Den som har boksen stiller dere 3 spørsmål. Om du mener det er deg drikker du. Om dere er enige drikker resten. Om dere er uenige drikker dere.',
        requiresUsers: true,
        twoPlayers: true),
    Question('Hot seat! alle still et spørsmål til {user1}. For alle spørsmålene {user1} nekter å svare på må {user1} drikke 1 slurk. ', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er kosmetikkmerker. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er Fotballag i Premier League. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1} ta et selfie med gjengen å post på instagram story med teksten "JEG SKAL KNULLE!" eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('{user1} velg 2 personer som skal kysse. om en eller begge nekter må dei drikke 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('2 sannheter, 1 løgn. {user1} kom på 2 sannheter og 1 løgn. Resten av gruppen skal gjette hvilken påstand som er løgn. Om gruppen tipper riktig må du drikke 5 slurker, om dei tipper feil må resten drikke 3 slurker. ', requiresUsers: true, twoPlayers: true),
    Question('Jeg har aldri løyet for sex.', requiresUsers: false),
    Question('Jeg har aldri tæsjet noe fra en butikk.', requiresUsers: false),
    Question('Jeg har aldri dratt tideleg hjem fra fest for sex.', requiresUsers: false),
    Question('Hot seat! alle still et spørsmål til {user1}. For alle spørsmålene {user1} nekter å svare på må {user1} drikke 1 slurk. ', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er etternavn på personer i rommet. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2} kom på hver sin sexstilling. Resten av gruppen stemmer på den beste stillingen. Taperen drikker 5 slurker', requiresUsers: true, twoPlayers: true),
    Question('{user1} tenk på den kåteste i dette rommet. Resten av gruppen skal tippe på tur hvem du tenker på. Vinneren kan dele ut 9 slurker. {user2} begynner', requiresUsers: true, twoPlayers: true),
    Question('Jeg har aldri hatt meg med noen i dette rommet.', requiresUsers: false),
    Question('Jeg har aldri tapt mer enn 10.000kr på gambling.', requiresUsers: false),
    Question('Kategorien er land i Europa. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2} kom på hver sin pickup line. Resten av gruppen stemmer på den beste pickup linen. Taperen drikker 5 slurker', requiresUsers: true, twoPlayers: true),
    Question('Jeg har aldri stjelt penger fra en forelders lommebok.', requiresUsers: false),
    Question('Jeg har aldri tatt piercing.', requiresUsers: false),
    Question('{user1} og {user2} ha stirrekonkurranse. Taperen drikker 10 slurker.', requiresUsers: true, twoPlayers: true),
    Question('SKÅL FOR FAEN!', requiresUsers: false),
    Question('Jeg har aldri sovnet under sex', requiresUsers: false),
    Question('Hot seat! alle still et spørsmål til {user1}. For alle spørsmålene {user1} nekter å svare på må {user1} drikke 1 slurk. ', requiresUsers: true, twoPlayers: true),
    Question('Pekelek! Hvem har høyest promille?', requiresUsers: false),
    Question('Pekelek! Hvem har best drag på det motsatte kjønn?', requiresUsers: false),
    Question('Pekelek! Hvem skal ta 10 slurker nå?', requiresUsers: false),
    Question('Pekelek! Hvem har størst lommebok?', requiresUsers: false),
    Question('Pekelek! Hvem har høyest bodycount?', requiresUsers: false),
    Question('Pekelek! Hvem er keen på noen andre i dette rommet?', requiresUsers: false),
    Question('Karaoke! Velg et objekt som dere setter i midten på bordet. Den som styrer musikk tar på en tilfeldig sang dei fleste kan. Førstemann som tar objektet å synger sangen kan dele ut 10 slurker. ', requiresUsers: false),
    Question('Konkurranse! Alle sammen finn fram mobilen og vipps et beløp til 2277 (kreftforeningen). Om du nekter å vippse drikker du 10 slurker. Den som vippser mest kan dele ut 10 slurker. ', requiresUsers: false),
    Question('{user1} gi {user2} et kompliment, ellers må du drikke 3 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle som har Tinder på mobilen må ta 2 slurker.', requiresUsers: false),
    Question('Kategorien er bilmerker. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1}, fortell din pinligste fyllehistorie, eller drikk 5 slurker.', requiresUsers: true),
    Question('Alle som har tatt solarium i det siste må drikke 3 slurker.', requiresUsers: false),
    Question('Jeg har aldri blitt tatt av politiet.', requiresUsers: false),
    Question('{user1} og {user2}, ha en armheving konkurranse. Taperen drikker 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Hvem har reist til flest land? Den personen deler ut 5 slurker.', requiresUsers: false),
    Question('{user1}, ring din ex og si "jeg tenker på deg", eller drikk 7 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er spillkonsoller. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Alle som har en tatovering må ta 3 slurker.', requiresUsers: false),
    Question('{user1} og {user2} ha en tommelkrig. Taperen drikker 4 slurker.', requiresUsers: true, twoPlayers: true),
    Question('{user1} mim deg selv ut en kjent sang. Første som gjetter riktig deler ut 5 slurker.', requiresUsers: true),
    Question('Den som sist brukte badet drikker 3 slurker.', requiresUsers: false),
    Question('{user1}, les siste tekstmeldingen din høyt eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle med Spotify må dele sin "mest spilte" sang i år, eller ta 2 slurker.', requiresUsers: false),
    Question('{user1} og {user2}, første til å finne noe rødt og ta på det kan dele ut 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er populære filmer. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Alle som møtte opp tidelig til vorset, ta 2 slurker.', requiresUsers: false),
    Question('{user1} velg en person i rommet til å tømme sin drikk.', requiresUsers: true, twoPlayers: true),
    Question('Den som har flest sosiale medier på mobilen må drikke 4 slurker.', requiresUsers: false),
    Question('Kategorien er dyreriket. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Den som sov lengst i dag må drikke 3 slurker.', requiresUsers: false),
    Question('{user1}, syng refrenget på en sang du kan utenat, ellers drikk 3 slurker.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2}, første til å finne en selfie på mobilen og vise gruppen, vinner. Taper drikker 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle som har en Apple-enhet må ta 2 slurker.', requiresUsers: false),
    Question('{user1}, hva var det siste du søkte på internett? Del det eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er TV-serier. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Den som har flest meldinger på telefonen må drikke 4 slurker.', requiresUsers: false),
    Question('{user1} si noe hyggelig om {user2}. Hvis du ikke kan, drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle med blå klær tar 2 slurker.', requiresUsers: false),
    Question('Kategorien er klesmerker. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Alle som har hatt et forhold lengre enn ett år må ta 3 slurker.', requiresUsers: false),
    Question('{user1}, hvem i rommet er mest sannsynlig til å bli kjendis? Den personen drikker 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2}, spill stein, saks, papir. Taperen drikker 3 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle som har en bestevenn må drikke 2 slurker.', requiresUsers: false),
    Question('Den som sist sjekket sosiale medier må ta 2 slurker.', requiresUsers: false),
    Question('{user1} gi en person en "challenge". Hvis de nekter, drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er norske byer. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Den som oftest lager mat hjemme drikker 3 slurker.', requiresUsers: false),
    Question('Kategorien er sportsutstyr. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1}, hva er det mest ulovlige du har gjort? Del det eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle som har en kjæledyr må ta 3 slurker.', requiresUsers: false),
    Question('Kategorien er typer alkohol. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Den som har mest kontanter med seg må ta 2 slurker.', requiresUsers: false),
    Question('{user1}, skriv en melding til en tilfeldig kontakt og la de andre velge hva du skriver eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Den som sist brukte pengene sine, drikk 3 slurker.', requiresUsers: false),
    Question('{user1} og {user2}, spill en runde med håndbak. Taper drikker 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle som er født i desember må drikke 3 slurker.', requiresUsers: false),
    Question('Kategorien er julefilmer. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Den som har flest par sko, ta 2 slurker.', requiresUsers: false),
    Question('{user1}, del din største flause på sosiale medier eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle med en tatovering drikker 2 slurker.', requiresUsers: false),
    Question('Kategorien er pornostjerner. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2}, ha en mimekonkurranse der gruppen gjetter. Taper drikker 3 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Den som har flest følgere på Instagram, ta 3 slurker.', requiresUsers: false),
    Question('Alle som har drukket alkohol alene må drikke 3 slurker.', requiresUsers: false),
    Question('Kategorien er navn på norske artister. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('Den som har flest apps på mobilen må ta 3 slurker.', requiresUsers: false),
    Question('{user1} og {user2} ha en løgndetektor-runde hvor resten gjetter sannhet eller løgn. Taper drikker 3 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Alle som kan svømme, ta 1 slurk.', requiresUsers: false),
    Question('Den som kom sist i dag, drikk 3 slurker.', requiresUsers: false),
    Question('{user1} si en ting du angrer på, eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Kategorien er ferieland. {user1} starter.', requiresUsers: true, twoPlayers: true),
    Question('{user1} og {user2} stå på ett bein og konkurrer. Taper drikker 5 slurker.', requiresUsers: true, twoPlayers: true),
    Question('Den som har flest år på høyere utdanning må drikke 2 slurker.', requiresUsers: false),
    Question('{user1} fortell om det flaueste som har hendt under samleie eller drikk 5 slurker', requiresUsers: true, twoPlayers: true),
    Question('{user1} fortell om et flaut barndomsminne som har brent seg fast i hjernen din eller drikk 5 slurker.', requiresUsers: true, twoPlayers: true),
    

    // Add more questions here...
  ];

  int currentQuestionIndex = 0;
  bool showWarning = false;
  bool warningShown = false;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    questions.shuffle(); // Randomize the order of the questions
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

    Question question = questions[currentQuestionIndex];
    if (question.requiresUsers) {
      if (question.twoPlayers) {
        String user1 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
        String user2 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];

        while (user1 == user2 && widget.userManager.users.length > 1) {
          user2 = widget.userManager.users[random.nextInt(widget.userManager.users.length)];
        }

        return question.text
            .replaceAll('{user1}', user1)
            .replaceAll('{user2}', user2);
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

class Question {
  final String text;
  final bool requiresUsers;
  final bool twoPlayers;

  Question(this.text, {this.requiresUsers = false, this.twoPlayers = false});
}