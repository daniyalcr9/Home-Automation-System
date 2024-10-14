import 'package:flutter/material.dart';
import 'add_device_screen.dart'; // Import AddDeviceScreen
import 'device_control_screen.dart'; // Import DeviceControlScreen
import 'appliance_scheduling_screen.dart'; // Import ApplianceSchedulingScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _devices = [];

  void _addDevice(String deviceName) {
    setState(() {
      _devices.add(deviceName);
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
      body: Center(
        // Center the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddDeviceScreen(onAddDevice: _addDevice),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Light blue background
                foregroundColor: Colors.white, // White text color
                minimumSize: Size(200, 60), // Increased button size
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              ),
              child: Text(
                'Add New Device',
                style: TextStyle(fontSize: 18), // Bigger font
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _devices.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DeviceControlScreen(devices: _devices),
                        ),
                      );
                    }
                  : null, // Disable button if no devices are added
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Light blue background
                foregroundColor: Colors.white, // White text color
                minimumSize: Size(200, 60), // Increased button size
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              ),
              child: Text(
                'Control Devices',
                style: TextStyle(fontSize: 18), // Bigger font
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _devices.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ApplianceSchedulingScreen(devices: _devices),
                        ),
                      );
                    }
                  : null, // Disable button if no devices are added
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue, // Light blue background
                foregroundColor: Colors.white, // White text color
                minimumSize: Size(200, 60), // Increased button size
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              ),
              child: Text(
                'Schedule Appliances',
                style: TextStyle(fontSize: 18), // Bigger font
              ),
            ),
          ],
        ),
      ),
    );
  }
}
