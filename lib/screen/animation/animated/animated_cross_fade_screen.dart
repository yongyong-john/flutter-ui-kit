import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({super.key});

  @override
  State<AnimatedCrossFadeScreen> createState() => _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool _showFirst = true;

  void _toggleCrossFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              firstChild: Image.asset(
                'assets/images/owl.png',
                width: 300,
                height: 400,
                fit: BoxFit.cover,
              ),
              secondChild: Image.asset(
                'assets/images/owl2.png',
                width: 300,
                height: 400,
                fit: BoxFit.cover,
              ),
              crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleCrossFade,
              child: const Text('Toggle CrossFade'),
            ),
          ],
        ),
      ),
    );
  }
}
