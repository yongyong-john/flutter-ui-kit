import 'package:flutter/material.dart';

class PositionedTransitionScreen extends StatefulWidget {
  const PositionedTransitionScreen({super.key});

  @override
  State<PositionedTransitionScreen> createState() => _PositionedTransitionScreenState();
}

class _PositionedTransitionScreenState extends State<PositionedTransitionScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(50, 50, 0, 0),
      end: const RelativeRect.fromLTRB(150, 150, 0, 0),
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

  void _togglePosition() {
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
        title: const Text('Positioned Transition'),
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
            PositionedTransition(
              rect: _animation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Position Me',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
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
