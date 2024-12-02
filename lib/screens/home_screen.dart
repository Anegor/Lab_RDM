import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> airQualityData = [
      {'city': 'London', 'quality': 'Moderate', 'aqi': 70},
      {'city': 'Manchester', 'quality': 'Good', 'aqi': 50},
      {'city': 'Birmingham', 'quality': 'Poor', 'aqi': 150},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Air Quality')),
      body: ListView.builder(
        itemCount: airQualityData.length,
        itemBuilder: (context, index) {
          final data = airQualityData[index];
          return Card(
            child: ListTile(
              title: Text('${data['city']} - AQI: ${data['aqi']}'),
              subtitle: Text('Quality: ${data['quality']}'),
            ),
          );
        },
      ),
    );
  }
}
