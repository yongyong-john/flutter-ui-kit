import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/color_manager.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  int _crossAxisCount = 2; // 초기 crossAxisCount 값
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

  // AppBar의 action 버튼을 눌렀을 때 호출되는 함수
  void _changeGridColumnCount() {
    setState(() {
      _crossAxisCount = _crossAxisCount == 5 ? 2 : _crossAxisCount + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_on),
            onPressed: _changeGridColumnCount, // 버튼을 누르면 그리드 컬럼 수 변경
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount, // 한 행에 3개의 항목을 표시
          crossAxisSpacing: 4.0, // 항목 간의 가로 간격
          mainAxisSpacing: 4.0, // 항목 간의 세로 간격
        ),
        itemCount: _colorManager.colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: _colorManager.colors[index],
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _colorManager.addItem, // 버튼을 누르면 항목이 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
