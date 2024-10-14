import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.warning, color: Colors.red),
            title: Text('Unusual activity detected!'),
          ),
          ListTile(
            leading: Icon(Icons.bolt, color: Colors.green),
            title: Text('Solar panels generated 5kWh today'),
          ),
        ],
      ),
    );
  }
}
