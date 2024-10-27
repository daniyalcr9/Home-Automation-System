import 'package:flutter/material.dart';

class DeviceControlScreen extends StatefulWidget {
  final List<String> devices;

  DeviceControlScreen({required this.devices});

  @override
  _DeviceControlScreenState createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
  Map<String, bool> _deviceStates = {};
  double _temperature = 20.0; // Default temperature
  bool _isHotMode = false; // Flag for hot mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Device Control',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Temperature: ${_temperature.toStringAsFixed(1)}°C',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: _temperature,
                  min: 16,
                  max: 30,
                  divisions: 14,
                  label: _temperature.toStringAsFixed(1),
                  onChanged: (double value) {
                    setState(() {
                      _temperature = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isHotMode = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isHotMode ? Colors.red : Colors.grey,
                      ),
                      child: Text('Hot Mode'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isHotMode = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !_isHotMode ? Colors.blue : Colors.grey,
                      ),
                      child: Text('Cold Mode'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
