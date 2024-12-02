import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = "here"; // Місто за замовчуванням
  String airQuality = "Loading...";
  int aqi = 0;

  final List<String> cities = ["here", "London", "New York", "Paris", "Kyiv"];

  Future<void> fetchAirQuality() async {
    final url =
        "https://api.waqi.info/feed/$selectedCity/?token=38bd0f967b70ffe749cae42449b9418d7b0be55f";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          aqi = data['data']['aqi'];
          airQuality = data['data']['dominentpol'] ?? 'Unknown';
        });
      } else {
        setState(() {
          airQuality = "Error fetching data";
        });
      }
    } catch (e) {
      setState(() {
        airQuality = "Error: $e";
      });
    }
  }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Очищення даних користувача

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
  void initState() {
    super.initState();
    fetchAirQuality();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCity,
              items: cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
                fetchAirQuality();
              },
            ),
            const SizedBox(height: 20),
            Text(
              "City: $selectedCity",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Air Quality Index (AQI): $aqi",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Dominant Pollutant: $airQuality",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
