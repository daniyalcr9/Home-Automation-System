import 'package:flutter/material.dart';

class ApplianceSchedulingScreen extends StatefulWidget {
  final List<String> devices; // List of devices to schedule

  // Constructor to accept devices
  ApplianceSchedulingScreen({required this.devices});

  @override
  _ApplianceSchedulingScreenState createState() =>
      _ApplianceSchedulingScreenState();
}

class _ApplianceSchedulingScreenState extends State<ApplianceSchedulingScreen> {
  final _scheduleList = <Map<String, String>>[]; // Store schedules
  String? _selectedDevice; // For dropdown menu
  TimeOfDay? _selectedTime;

  void _scheduleAppliance() {
    if (_selectedDevice != null && _selectedTime != null) {
      setState(() {
        _scheduleList.add({
          'device': _selectedDevice!,
          'time': _selectedTime!.format(context),
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Schedule set for $_selectedDevice at ${_selectedTime!.format(context)}')),
      );
      _selectedDevice = null; // Reset selected device
      _selectedTime = null; // Reset selected time
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a device and a time.')),
      );
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appliance Scheduling'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: _selectedDevice,
              hint: Text('Select Device'),
              items: widget.devices.map((String device) {
                return DropdownMenuItem<String>(
                  value: device,
                  child: Text(device),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDevice = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              _selectedTime != null
                  ? 'Scheduled Time: ${_selectedTime!.format(context)}'
                  : 'No time selected',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scheduleAppliance,
              child: Text('Schedule Appliance'),
            ),
            SizedBox(height: 20),
            Text('Scheduled Appliances:'),
            Expanded(
              child: ListView.builder(
                itemCount: _scheduleList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${_scheduleList[index]['device']} at ${_scheduleList[index]['time']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
