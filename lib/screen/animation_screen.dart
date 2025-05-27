import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/animation/animated_group_screen.dart';
import 'package:flutter_ui_kit/screen/animation/hero_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition_group_screen.dart';
import 'package:flutter_ui_kit/screen/animation/tween_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation UI'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Animated Group', screen: AnimatedGroupScreen()),
              ListTileWidget(title: 'Hero', screen: HeroScreen()),
              ListTileWidget(title: 'Transition Group', screen: TransitionGroupScreen()),
              ListTileWidget(title: 'Tween', screen: TweenScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
