import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class RulesDisplayPage extends StatefulWidget {
  final String title;
  final String filePath;

  RulesDisplayPage({required this.title, required this.filePath});

  @override
  _RulesDisplayPageState createState() => _RulesDisplayPageState();
}

class _RulesDisplayPageState extends State<RulesDisplayPage> {
  String rules = '';

  @override
  void initState() {
    super.initState();
    _loadRules();
  }

  Future<void> _loadRules() async {
    final String fileContent = await rootBundle.loadString(widget.filePath);
    setState(() {
      rules = fileContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background for the page
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent, // Transparent app bar to show the red background
        elevation: 0, // Remove shadow for app bar
        centerTitle: true, // Center the title
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(
              rules,
              textAlign: TextAlign.center, // Center the text horizontally
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
