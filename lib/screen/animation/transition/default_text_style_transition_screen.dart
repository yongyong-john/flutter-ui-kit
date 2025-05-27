import 'package:flutter/material.dart';

class DefaultTextStyleTransitionScreen extends StatefulWidget {
  const DefaultTextStyleTransitionScreen({super.key});

  @override
  State<DefaultTextStyleTransitionScreen> createState() => _DefaultTextStyleTransitionScreenState();
}

class _DefaultTextStyleTransitionScreenState extends State<DefaultTextStyleTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _textStyleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textStyleAnimation = TextStyleTween(
      begin: const TextStyle(
        fontSize: 24,
        color: Colors.blue,
        fontWeight: FontWeight.normal,
      ),
      end: const TextStyle(
        fontSize: 48,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTextStyle() {
    setState(() {
      if (_controller.isCompleted) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Text Style Transition'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DefaultTextStyleTransition(
              style: _textStyleAnimation,
              child: const Text('Animate Me'),
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
