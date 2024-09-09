import 'dart:ui';

import 'package:flutter/material.dart';

class DisplayFeatureSubScreenScreen extends StatelessWidget {
  const DisplayFeatureSubScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Feature Sub Screen'),
        centerTitle: true,
      ),
      body: const FoldableScreen(),
    );
  }
}

class FoldableScreen extends StatelessWidget {
  const FoldableScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final displayFeatures = mediaQuery.displayFeatures;
    if (displayFeatures.isEmpty) {
      // 폴더블 디스플레이가 아닌 경우
      return const Center(child: Text('This device has no display features.'));
    } else {
      // 폴더블 디스플레이가 있는 경우
      return Row(
        children: displayFeatures.map((feature) {
          return DisplayFeatureSubScreen(
            anchorPoint: const Offset(0, 0),
            child: Expanded(
              child: Container(
                color: feature.type == DisplayFeatureType.fold ? Colors.blue : Colors.red,
                child: Center(
                  child: Text(
                    feature.type == DisplayFeatureType.fold ? 'Fold Area' : 'Non-Fold Area',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }
  }
}
