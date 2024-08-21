import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({super.key});

  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  double _paddingValue = 10.0;

  void _changePadding() {
    setState(() {
      _paddingValue = _paddingValue == 10.0 ? 50.0 : 10.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(_paddingValue),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Padding',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changePadding,
                child: const Text('Change Padding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
