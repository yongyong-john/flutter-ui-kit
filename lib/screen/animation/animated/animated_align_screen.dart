import 'package:flutter/material.dart';

class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({super.key});

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  bool _isTopLeft = true;

  void _changeAlignment() {
    setState(() {
      _isTopLeft = !_isTopLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.grey[300],
              child: AnimatedAlign(
                alignment: _isTopLeft ? Alignment.topLeft : Alignment.bottomRight,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(_isTopLeft ? 'Top left' : 'Bottom right'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _changeAlignment,
              child: const Text('Change Alignment'),
            ),
          ],
        ),
      ),
    );
  }
}
