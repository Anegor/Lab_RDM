import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Interactive Input',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; // Лічильник
  final TextEditingController _controller = TextEditingController();

  void _updateCounter() {
    String input = _controller.text;

  
    if (input == "The answer to life, the universe, and everything") {
      setState(() {
        _counter = 42;
      });
      return;
    }

    // Перевірка, чи введене значення можна конвертувати в число
    final int? value = int.tryParse(input);
    if (value != null) {
      setState(() {
        _counter += value; // Додаємо число до лічильника
      });
    } else {
      // Якщо це не число, показуємо повідомлення
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Введіть число або спеціальну фразу!'),
        ),
      );
    }

    _controller.clear(); // Очищення поля вводу
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Інтерактивне поле вводу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Лічильник: $_counter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Введіть число або фразу',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _updateCounter(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _updateCounter,
              child: Text('Оновити лічильник'),
            ),
          ],
        ),
      ),
    );
  }
}
