import 'package:flutter/material.dart';
import 'front_page.dart';
import 'user_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserManager userManager = UserManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drikke Mer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FrontPage(userManager: userManager),
    );
  }
}
