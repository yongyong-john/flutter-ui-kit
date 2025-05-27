import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/button/floating_action_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/icon_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/segmented_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/text_button_example_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/text_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/toggle_button_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class ButtonGroupScreen extends StatelessWidget {
  const ButtonGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Floating Action Buttons', screen: FloatingActionButtonScreen()),
              ListTileWidget(title: 'Icon Buttons', screen: IconButtonScreen()),
              ListTileWidget(title: 'Segmented Buttons', screen: SegmentedButtonScreen()),
              ListTileWidget(title: 'Text Buttons', screen: TextButtonScreen()),
              ListTileWidget(title: 'Text Buttons Example', screen: TextButtonExampleApp()),
              ListTileWidget(title: 'Toggle Buttons', screen: ToggleButtonScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
