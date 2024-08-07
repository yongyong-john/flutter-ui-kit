import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/description/material_description.dart';
import 'package:flutter_ui_kit/screen/utils/message.dart';

class TextButtonScreen extends StatefulWidget {
  const TextButtonScreen({super.key});

  @override
  State<TextButtonScreen> createState() => _TextButtonScreenState();
}

class _TextButtonScreenState extends State<TextButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Button'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      buttonsDescription,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Message.showMessage(context, 'TextButton pressed');
                  },
                  child: const Text('TextButton'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Message.showMessage(context, 'ElevatedButton pressed');
                  },
                  child: const Text('ElevatedButton'),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Message.showMessage(context, 'OutlinedButton pressed');
                  },
                  child: const Text('OutlinedButton'),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    Message.showMessage(context, 'FilledButton pressed');
                  },
                  child: const Text('FilledButton'),
                ),
                const SizedBox(height: 20),
                FilledButton.tonal(
                  onPressed: () {
                    Message.showMessage(context, 'FilledTonalButton pressed');
                  },
                  child: const Text('FilledTonalButton'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
