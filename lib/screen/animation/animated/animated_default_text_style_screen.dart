import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleScreen extends StatefulWidget {
  const AnimatedDefaultTextStyleScreen({super.key});

  @override
  State<AnimatedDefaultTextStyleScreen> createState() => _AnimatedDefaultTextStyleScreenState();
}

class _AnimatedDefaultTextStyleScreenState extends State<AnimatedDefaultTextStyleScreen> {
  bool _isToggled = false;

  void _toggleTextStyle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Default Text Style'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedDefaultTextStyle(
              style: _isToggled
                  ? const TextStyle(
                      fontSize: 40.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const Text('Hello, Flutter!'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleTextStyle,
              child: const Text('Toggle Text Style'),
            ),
          ],
        ),
      ),
    );
  }
}
