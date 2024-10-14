import 'package:flutter/material.dart';

class AddDeviceScreen extends StatefulWidget {
  final Function(String) onAddDevice;

  AddDeviceScreen({required this.onAddDevice});

  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  final _deviceController = TextEditingController();

  void _submitDevice() {
    String deviceName = _deviceController.text;
    if (deviceName.isNotEmpty) {
      widget.onAddDevice(deviceName);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add New Device',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.lightBlue, // Light blue AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 280, 16, 100),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _deviceController,
              decoration: InputDecoration(
                labelText: 'Device Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitDevice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text(
                'Add Device',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
