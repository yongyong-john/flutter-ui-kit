import 'package:flutter/material.dart';

class AnimatedPositiondScreen extends StatefulWidget {
  const AnimatedPositiondScreen({super.key});

  @override
  State<AnimatedPositiondScreen> createState() => _AnimatedPositiondScreenState();
}

class _AnimatedPositiondScreenState extends State<AnimatedPositiondScreen> {
  bool _isMoved = false;

  void _togglePosition() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.grey[300],
            ),
            AnimatedPositioned(
              left: _isMoved ? 150.0 : 50.0,
              top: _isMoved ? 150.0 : 50.0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePosition,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
