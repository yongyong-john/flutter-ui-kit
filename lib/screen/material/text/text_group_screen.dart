import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/text/text_field_screen.dart';
import 'package:flutter_ui_kit/screen/material/text/text_screen.dart';

class TextGroupScreen extends StatelessWidget {
  const TextGroupScreen({super.key});

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
                title: const Text('Text'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Text Field'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextFieldScreen(),
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
