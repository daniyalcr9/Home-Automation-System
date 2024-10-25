import 'package:flutter/material.dart';
import 'package:home_automation_system/screen1.dart';
import 'package:home_automation_system/security.dart';
import 'add_device_screen.dart'; // Import AddDeviceScreen
import 'device_control_screen.dart'; // Import DeviceControlScreen
import 'appliance_scheduling_screen.dart'; // Import ApplianceSchedulingScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            HomeScreen1(),
            SecuritySystemUI(),
            Center(child: Text('Calls Screen', style: TextStyle(fontSize: 24))),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.lightBlue, // Background color of TabBar
          child: TabBar(
            tabs: [
              Tab(text: 'Home', icon: Icon(Icons.home)),
              Tab(text: 'Security', icon: Icon(Icons.lock)),
              Tab(text: 'Settings', icon: Icon(Icons.settings)),
            ],
            labelColor: Colors.white, // Active tab color
            unselectedLabelColor: Colors.white70, // Inactive tab color
          ),
        ),
      ),
    );
  }
}
