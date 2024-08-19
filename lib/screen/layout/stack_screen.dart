import 'dart:math';

import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  final List<Widget> _widgets = []; // Stack에 추가될 위젯들을 저장할 리스트
  final Random _random = Random(); // 랜덤 색상을 생성하기 위한 랜덤 객체

  // 랜덤 색상을 생성하는 함수
  Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  // FAB를 눌렀을 때 호출되는 함수
  void _addWidget() {
    double width = MediaQuery.of(context).size.width;
    setState(() {
      _widgets.add(
        Positioned(
          top: _widgets.length * 100.0, // 각 위젯이 반씩 겹치도록 top 설정
          // left: _widgets.length * 50.0, // 각 위젯이 반씩 겹치도록 left 설정
          child: Container(
            width: width,
            height: 200,
            color: _generateRandomColor(),
            child: Center(
              child: Text(
                'Widget ${_widgets.length}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Overlap'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: (_widgets.length * 100.0) + 200,
          child: Stack(
            children: _widgets,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWidget, // 버튼을 누르면 새로운 위젯이 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
