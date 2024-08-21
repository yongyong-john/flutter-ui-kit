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
import 'package:flutter_ui_kit/screen/animation/animated/animated_positiond_screen.dart';
import 'package:flutter_ui_kit/screen/animation/animated/animated_switcher_screen.dart';

class AnimatedGroupScreen extends StatelessWidget {
  const AnimatedGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animatied Group'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Animated Align'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedAlignScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Container'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedContainerScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Cross Fade'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedCrossFadeScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Default Text Style'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedDefaultTextStyleScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Icon'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedIconScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated List'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedListScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Modal Barrier'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedModalBarrierScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Opacity'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedOpacityScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Padding'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedPaddingScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Physical Model'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedPhysicalModelScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Positioned'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedPositiondScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Animated Switcher'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AnimatedSwitcherScreen(),
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
