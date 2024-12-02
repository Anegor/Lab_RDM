import 'package:flutter/material.dart';
import '../widgets/common_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is your Home Page', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            CommonButton(
              text: 'Profile',
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
            SizedBox(height: 10),
            CommonButton(
              text: 'Logout',
              onPressed: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      ),
    );
  }
}
