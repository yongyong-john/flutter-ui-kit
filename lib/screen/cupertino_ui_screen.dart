import 'package:flutter/material.dart';

class CupertinoUiScreen extends StatelessWidget {
  const CupertinoUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
