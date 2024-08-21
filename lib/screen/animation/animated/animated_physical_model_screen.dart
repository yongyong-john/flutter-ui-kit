import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  const AnimatedPhysicalModelScreen({super.key});

  @override
  State<AnimatedPhysicalModelScreen> createState() => _AnimatedPhysicalModelScreenState();
}

class _AnimatedPhysicalModelScreenState extends State<AnimatedPhysicalModelScreen> {
  bool _isToggled = false;

  void _togglePhysicalModel() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Physical Model'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              elevation: _isToggled ? 10.0 : 0.0,
              color: _isToggled ? Colors.blue : Colors.red,
              shadowColor: _isToggled ? Colors.blueAccent : Colors.black,
              borderRadius: _isToggled ? BorderRadius.circular(80.0) : BorderRadius.circular(0.0),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.transparent,
                child: const Center(
                  child: Text(
                    'Tap the button!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _togglePhysicalModel,
              child: const Text('Toggle Physical Model'),
            ),
          ],
        ),
      ),
    );
  }
}
