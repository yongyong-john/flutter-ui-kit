import 'package:flutter/material.dart';

class AnimatedIconScreen extends StatefulWidget {
  const AnimatedIconScreen({super.key});

  @override
  State<AnimatedIconScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleIcon() {
    setState(() {
      if (_isPlaying) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icon'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          iconSize: 200,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _controller,
          ),
          onPressed: _toggleIcon,
        ),
      ),
    );
  }
}
