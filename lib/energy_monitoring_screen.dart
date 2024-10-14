import 'package:flutter/material.dart';

class EnergyMonitoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Energy Monitoring')),
      body: Center(
        child: Text('Energy usage graph will go here'),
        // Placeholder for a graph (use charts_flutter package for real charts)
      ),
    );
  }
}
