import 'package:flutter/material.dart';
import 'user_manager.dart';

class AddUsersPage extends StatefulWidget {
  final UserManager userManager;

  AddUsersPage({required this.userManager});

  @override
  _AddUsersPageState createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    // Wait for the frame to be rendered before focusing the TextField
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // Red background color for the whole page
      appBar: AppBar(
        title: Text('Legg til spillere'),
        backgroundColor: Colors.red, // App bar color
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center( // Center everything inside the body
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              // TextField with styling for user input
              TextField(
                controller: _controller,
                focusNode: _focusNode, // Attach the FocusNode
                decoration: InputDecoration(
                  labelText: 'Skriv inn navn',
                  labelStyle: TextStyle(color: Colors.orange), // Styled label
                  errorText: errorMessage.isEmpty ? null : errorMessage,
                  errorStyle: TextStyle(color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Button to add a player
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    String newUser = _controller.text.trim();
                    if (newUser.isNotEmpty) {
                      if (widget.userManager.users.contains(newUser)) {
                        errorMessage = 'Bruker er allerede med!';
                      } else {
                        widget.userManager.addUser(newUser);
                        _controller.clear();
                        errorMessage = '';
                      }
                    }
                  });
                },
                child: Text(
                  'Legg til spiller',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),

              // User list with padding
              Expanded(
                child: ListView.builder(
                  itemCount: widget.userManager.users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        tileColor: index.isEven ? Colors.orange[100] : Colors.orange[200], // Alternate row color
                        title: Text(
                          widget.userManager.users[index],
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              widget.userManager.removeUser(
                                  widget.userManager.users[index]);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
