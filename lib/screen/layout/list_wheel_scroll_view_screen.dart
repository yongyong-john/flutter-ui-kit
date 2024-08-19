import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/color_manager.dart';

class ListWheelScrollViewScreen extends StatefulWidget {
  const ListWheelScrollViewScreen({super.key});

  @override
  State<ListWheelScrollViewScreen> createState() => _ListWheelScrollViewScreenState();
}

class _ListWheelScrollViewScreenState extends State<ListWheelScrollViewScreen> {
  late ColorManager _colorManager;

  @override
  void initState() {
    super.initState();
    _colorManager = ColorManager(10); // 초기 10개의 항목 생성
    _colorManager.addListener(() {
      setState(() {}); // ColorManager의 변화가 있을 때 상태 업데이트
    });
  }

  @override
  void dispose() {
    _colorManager.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Wheel Scroll View'),
        centerTitle: true,
      ),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: height / 3, // 각 아이템의 크기
          children: _colorManager.colors.map((color) {
            return Container(
              color: color,
              alignment: Alignment.center,
              child: Text(
                'Item ${_colorManager.colors.indexOf(color)}',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _colorManager.addItem, // 버튼을 누르면 항목이 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
