import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              width: _isExpanded ? 200.0 : 100.0,
              height: _isExpanded ? 200.0 : 100.0,
              decoration: BoxDecoration(
                color: _isExpanded ? Colors.blue : Colors.red,
                borderRadius: BorderRadius.circular(_isExpanded ? 0.0 : 50.0),
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleContainer,
              child: const Text('Toggle Container'),
            ),
          ],
        ),
      ),
    );
  }
}
