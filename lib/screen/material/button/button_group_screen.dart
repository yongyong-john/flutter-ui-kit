import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/button/floating_action_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/icon_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/segmented_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/text_button_example_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/text_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/toggle_button_screen.dart';

class ButtonGroupScreen extends StatelessWidget {
  const ButtonGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Group'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Floating Action Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FloatingActionButtonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Icon Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IconButtonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Segmented Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SegmentedButtonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Text Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextButtonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Text Buttons Example'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextButtonExampleApp(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Toggle Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ToggleButtonScreen(),
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
