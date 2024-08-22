import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/animation/transition/align_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/decorated_box_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/default_text_style_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/fade_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/positioned_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/rotation_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/scale_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/size_transition_screen.dart';
import 'package:flutter_ui_kit/screen/animation/transition/slide_transition_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class TransitionGroupScreen extends StatelessWidget {
  const TransitionGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transition Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Align Transition', screen: AlignTransitionScreen()),
              ListTileWidget(title: 'Decorated Box Transition', screen: DecoratedBoxTransitionScreen()),
              ListTileWidget(title: 'Default Text Style Transition', screen: DefaultTextStyleTransitionScreen()),
              ListTileWidget(title: 'Fade Transition', screen: FadeTransitionScreen()),
              ListTileWidget(title: 'Positioned Transition', screen: PositionedTransitionScreen()),
              ListTileWidget(title: 'Rotation Transition', screen: RotationTransitionScreen()),
              ListTileWidget(title: 'Scale Transition', screen: ScaleTransitionScreen()),
              ListTileWidget(title: 'Size Transition', screen: SizeTransitionScreen()),
              ListTileWidget(title: 'Slide Transition', screen: SlideTransitionScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
