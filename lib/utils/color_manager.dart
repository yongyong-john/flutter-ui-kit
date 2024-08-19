import 'package:flutter/material.dart';
import 'dart:math';

class ColorManager extends ChangeNotifier {
  final List<Color> _colors = [];
  final Random _random = Random();

  ColorManager(int initialItemCount) {
    _initializeItems(initialItemCount);
  }

  // 초기 아이템을 생성하는 함수
  void _initializeItems(int count) {
    for (int i = 0; i < count; i++) {
      _addItem();
    }
  }

  // 랜덤 색상을 생성하는 함수
  Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  // 새 항목을 추가하는 함수
  void _addItem() {
    _colors.add(_generateRandomColor());
    notifyListeners(); // 상태가 변경되었음을 알림
  }

  // 외부에서 항목을 추가할 수 있도록 하는 함수
  void addItem() {
    _addItem();
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final Color item = _colors.removeAt(oldIndex);
    _colors.insert(newIndex, item);
    notifyListeners();
  }

  // 현재 색상 리스트를 반환하는 함수
  List<Color> get colors => List.unmodifiable(_colors);
}
