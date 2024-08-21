import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/animation/animated_group_screen.dart';
import 'package:flutter_ui_kit/screen/animation/hero_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition_group_screen.dart';
import 'package:flutter_ui_kit/screen/animation/tween_screen.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation UI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Animated Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Hero'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HeroScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Transition Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TransitionGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Tween'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TweenScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
