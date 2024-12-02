import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Очищаємо збережені дані користувача

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> airQualityData = [
      {'city': 'London', 'quality': 'Moderate', 'aqi': 70},
      {'city': 'Manchester', 'quality': 'Good', 'aqi': 50},
      {'city': 'Birmingham', 'quality': 'Poor', 'aqi': 150},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Quality'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
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
