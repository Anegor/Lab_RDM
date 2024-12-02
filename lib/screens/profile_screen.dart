import 'package:flutter/material.dart';
import '../widgets/common_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, User!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            CommonButton(
              text: 'Go to Home',
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ],
        ),
      ),
    );
  }
}
