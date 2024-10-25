import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecuritySystemUI(),
    );
  }
}

class SecuritySystemUI extends StatefulWidget {
  @override
  _SecuritySystemUIState createState() => _SecuritySystemUIState();
}

class _SecuritySystemUIState extends State<SecuritySystemUI> {
  bool isArmed = true;

  void toggleSecurity() {
    setState(() {
      isArmed = !isArmed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Smart Home Automation System',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.lightBlue, // Light blue AppBar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Status circle and text
          CircleAvatar(
            radius: 40,
            backgroundColor: isArmed ? Colors.green : Colors.red,
            child: Icon(
              isArmed ? Icons.lock : Icons.lock_open,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(height: 10),
          Text(
            isArmed ? "System Armed" : "System Disarmed",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),

          SizedBox(height: 30),

          // Image cards (like kitchen and library)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SecurityCard(
                imagePath: 'assets/kitchen.jpg',
                roomName: 'Kitchen',
                status: 'Online',
              ),
              SecurityCard(
                imagePath: 'assets/library.jpg',
                roomName: 'Library',
                status: 'Offline',
              ),
            ],
          ),
          SizedBox(height: 30),

          // Buttons for arm/disarm
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed:
                    isArmed ? null : toggleSecurity, // Disable if already armed
                icon: Icon(Icons.lock, color: Colors.white),
                label: Text('Arm Security'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150, 50),
                ),
              ),
              ElevatedButton.icon(
                onPressed: isArmed
                    ? toggleSecurity
                    : null, // Disable if already disarmed
                icon: Icon(Icons.lock_open, color: Colors.white),
                label: Text('Disarm Security'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150, 50),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecurityCard extends StatelessWidget {
  final String imagePath;
  final String roomName;
  final String status;

  const SecurityCard({
    required this.imagePath,
    required this.roomName,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(roomName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(status,
                      style: TextStyle(
                          color:
                              status == 'Online' ? Colors.green : Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
