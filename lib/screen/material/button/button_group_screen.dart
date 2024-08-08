import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/button/button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/icon_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/text_button_example_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/text_button_screen.dart';

class ButtonGroupScreen extends StatelessWidget {
  const ButtonGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar Group'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ButtonScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
