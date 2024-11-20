import 'package:flutter/material.dart'; 
import 'user_manager/user_manager.dart'; 
import 'front_page/front_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserManager userManager = UserManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fylla!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FrontPage(userManager: userManager),
    );
  }
}
