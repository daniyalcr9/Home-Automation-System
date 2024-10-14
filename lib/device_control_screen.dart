import 'package:flutter/material.dart';

class DeviceControlScreen extends StatefulWidget {
  final List<String> devices;

  DeviceControlScreen({required this.devices});

  @override
  _DeviceControlScreenState createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
  Map<String, bool> _deviceStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Device Control',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: widget.devices.length,
        itemBuilder: (context, index) {
          String device = widget.devices[index];
          bool deviceState = _deviceStates[device] ?? false;

          return ListTile(
            leading: Icon(Icons.device_hub),
            title: Text(device),
            trailing: Switch(
              value: deviceState,
              onChanged: (bool value) {
                setState(() {
                  _deviceStates[device] = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
