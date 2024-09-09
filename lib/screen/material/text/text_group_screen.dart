import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/text/editable_text_screen.dart';
import 'package:flutter_ui_kit/screen/material/text/text_field_screen.dart';
import 'package:flutter_ui_kit/screen/material/text/text_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class TextGroupScreen extends StatelessWidget {
  const TextGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Editable Text', screen: EditableTextScreen()),
              ListTileWidget(title: 'Text', screen: TextScreen()),
              ListTileWidget(title: 'Text Field', screen: TextFieldScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
