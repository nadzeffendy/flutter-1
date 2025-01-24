import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basic Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 7, 193, 35)),
        useMaterial3: true,
      ),
      home: const BasicWidgetsDemo(),
    );
  }
}

class BasicWidgetsDemo extends StatefulWidget {
  const BasicWidgetsDemo({super.key});

  @override
  State<BasicWidgetsDemo> createState() => _BasicWidgetsDemoState();
}

class _BasicWidgetsDemoState extends State<BasicWidgetsDemo> {
  final TextEditingController _controller = TextEditingController();
  String _welcomeMessage = 'Welcome to Flutter Basics';

  void _updateWelcomeMessage() {
    setState(() {
      if (_controller.text.trim().isNotEmpty) {
        _welcomeMessage = 'Hi, ${_controller.text.trim()}!';
      } else {
        _welcomeMessage = 'Welcome To Flutter Basics';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Basic Widgets',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _welcomeMessage,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateWelcomeMessage,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
