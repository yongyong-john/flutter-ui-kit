import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({super.key});

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double _opacity = 1.0;

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(_opacity == 0 ? 'Opacity = 0' : 'Opacity = 1'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleOpacity,
              child: const Text('Toggle Opacity'),
            ),
          ],
        ),
      ),
    );
  }
}
