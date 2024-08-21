import 'package:flutter/material.dart';

class AnimatedModalBarrierScreen extends StatefulWidget {
  const AnimatedModalBarrierScreen({super.key});

  @override
  State<AnimatedModalBarrierScreen> createState() => _AnimatedModalBarrierScreenState();
}

class _AnimatedModalBarrierScreenState extends State<AnimatedModalBarrierScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.black54,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
      if (_isLoading) {
        _controller.forward();

        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Modal Barrier'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: IgnorePointer(
              ignoring: false,
              child: ElevatedButton(
                onPressed: _toggleLoading,
                child: Text(_isLoading ? 'Stop Loading' : 'Start Loading'),
              ),
            ),
          ),
          if (_isLoading)
            IgnorePointer(
              ignoring: false,
              child: AnimatedModalBarrier(
                color: _colorAnimation,
                dismissible: false,
              ),
            ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
