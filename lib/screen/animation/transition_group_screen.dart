import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/animation/transition/align_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/decorated_box_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/default_text_style_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/fade_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/positioned_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/rotation_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/scale_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/size_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/slide_tranistion_screen.dart';

class TransitionGroupScreen extends StatelessWidget {
  const TransitionGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition Group'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Align Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AlignTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Decorated Box Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DecoratedBoxTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Default Text Style Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DefaultTextStyleTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Fade Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FadeTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Positioned Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PositionedTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Rotation Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RotationTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Scale Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScaleTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Size Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SizeTransitionScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Slide Transition'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SlideTranistionScreen(),
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
