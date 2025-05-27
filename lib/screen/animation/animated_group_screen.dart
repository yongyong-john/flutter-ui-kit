import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_align_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_container_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_cross_fade_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_default_text_style_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_icon_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_list_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_modal_barrier_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_opacity_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_padding_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_physical_model_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_positioned_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_switcher_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class AnimatedGroupScreen extends StatelessWidget {
  const AnimatedGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animatied Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Animated Align', screen: AnimatedAlignScreen()),
              ListTileWidget(title: 'Animated Container', screen: AnimatedContainerScreen()),
              ListTileWidget(title: 'Animated Cross Fade', screen: AnimatedCrossFadeScreen()),
              ListTileWidget(title: 'Animated Default Text Style', screen: AnimatedDefaultTextStyleScreen()),
              ListTileWidget(title: 'Animated Icon', screen: AnimatedIconScreen()),
              ListTileWidget(title: 'Animated List', screen: AnimatedListScreen()),
              ListTileWidget(title: 'Animated Modal Barrier', screen: AnimatedModalBarrierScreen()),
              ListTileWidget(title: 'Animated Opacity', screen: AnimatedOpacityScreen()),
              ListTileWidget(title: 'Animated Padding', screen: AnimatedPaddingScreen()),
              ListTileWidget(title: 'Animated Physical Model', screen: AnimatedPhysicalModelScreen()),
              ListTileWidget(title: 'Animated Positioned', screen: AnimatedPositionedScreen()),
              ListTileWidget(title: 'Animated Switcher', screen: AnimatedSwitcherScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
