import 'package:flutter/material.dart';

class AddedPackageUiScreen extends StatelessWidget {
  const AddedPackageUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Added Package UI'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Comming soon...',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
