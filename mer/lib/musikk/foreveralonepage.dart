import 'package:flutter/material.dart';

class ForeverAlonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background
      appBar: AppBar(
        title: Text('Forever Alone'),
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // Remove shadow for app bar
        centerTitle: true, // Center the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 49, // Number of lines (same as the number of pairs)
          itemBuilder: (context, index) {
            // Create a pair of texts for left and right columns
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  // Left Column Text
                  Expanded(
                    child: Text(
                      _getTextForLeftColumn(index),
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
                      _getTextForRightColumn(index),
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
    );
  }

  String _getTextForLeftColumn(int index) {
    // The list of texts you want to display, based on the index (left column)
    List<String> lines = [
      "Alle som er fra Østlandet",
      "Alle",
      "Alle som har hatt sex",
      "Alle som har blitt dumpa av noen",
      "Har hatt kjæreste",
      "Alle som bor utenfor Østlandet",
      "De som har friår",
      "De som gikk rett på studiene etter VGS",
      "Alle som savner RT",
      "Melodi pause",
      "Har hatt et ons",
      "Har grått dette året",
      "Sugd noen før",
      "Spydd på fest",
      "Har hatt sex på kjøkkenet",
      "Tror de spyr i kveld",
      "Brunt hår",
      "Har farget håret før",
      "Har hatt sex i sengen til foreldrene",
      "Har et crush",
      "Alle som har ligget med noen fra Bergen",
      "Alle",
      "Hooket flere enn 5",
      "Har angret på noen man har hatt sex med",
      "De som tar opp fag",
      "Har dusjet med en annen",
      "Alle med blondt hår",
      "Alle som er single",
      "De som har strøket i et fag",
      "Har blitt blokket på snap av noen før",
      "Har blokket noen før",
      "Har hatt blackout",
      "Alle som skal ligge i kveld",
      "Alle",
      "Den som hoster",
      "Alle",
      "Alle som studerer",
      "Fått 2 på en prøve",
      "Ditchet skolen",
      "Alle som drikker vin",
      "Vært på tinderdate",
      "Har onanert",
      "Alle som skal bli fulle idag",
      "Hadde gått på en date med en sugardaddy for 1 mill",
      "Alle som har jobbet idag",
      "Alle",
      "Den siste som kom på vorset",
      "Alle som er kåte",
      "ALLE",
    ];

    return lines[index];
  }

  String _getTextForRightColumn(int index) {
    // The list of texts you want to display, based on the index (right column)
    List<String> lines = [
      "No one can say I didn't try",
      "Tried everything to make you feel what I feel ",
      "Well, I guess I pushed to hard",
      "And now you're slipping aways",
      "Feels like my love for you",
      "Is stopping you from being you",
      "You shine best without me",
      "Like all the ones I had before",
      "I am Forever Alone",
      "2 slurker",
      "Home alone eating sushi for two",
      "Home alone and I'm waiting for someone who never shows up",
      "Ooh, and I'm lonely, I'm angry I'm tired",
      "You're only giving med drips of your love",
      "Appointments, you've been breaking them all",
      "It's like a never ending story, I give and you take",
      "And I give, it feels like my love for you",
      "Is stopping you from being you",
      "You shine best without me",
      "Like all the ones I had before",
      "I am forever alone",
      "When I held your hand you were sincere",
      "But did you ever think about me when I wasn't near you?",
      "Why would you ever put me first?",
      "You are second to noneg",
      "I wanted to leave, I tried to find someone new",
      "But I always end up still wanting you",
      "Why do I do this to myself?",
      "Feels like my love for you",
      "Is stopping you from being you.",
      "You shine best without me",
      "Like all the ones I had before",
      "I am forever alone",
      "When I'm with you, you tell me you love me ",
      "When you're not I don't even exist",
      "If I ask you if you want to hang with me",
      "You got a thousand excuses rehearsed",
      "But when you're drunk and got no place to hide",
      "Who's the one you always call?",
      "Feels like my love for you",
      "Is stopping you from being you",
      "You shine best without me",
      "Like all the ones I had before",
      "I am forever alone",
      "My love for you",
      "Is stopping you from being you",
      "You shine best without me",
      "Like all the ones I had before",
      "I am forever alone",
    ];

    // Make sure there are enough items in the list
    if (index < lines.length) {
      return lines[index];
    } else {
      return ''; // Return an empty string if out of range
    }
  }
}
