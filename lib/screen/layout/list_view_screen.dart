import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/color_manager.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  late ColorManager _colorManager;

  @override
  void initState() {
    super.initState();
    _colorManager = ColorManager(5); // 초기 5개의 항목 생성
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // 화면의 절반에 표시되는 세로 방향 ListView
            Expanded(
              child: ListView.builder(
                itemCount: _colorManager.colors.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: _colorManager.colors[index],
                    height: 100,
                    child: ListTile(
                      leading: const Icon(Icons.label),
                      title: Text('Vertical Item $index'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // 화면의 절반에 표시되는 가로 방향 ListView
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _colorManager.colors.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    color: _colorManager.colors[index],
                    child: Center(
                      child: Text(
                        'Horizontal\n Item $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _colorManager.addItem, // 버튼을 누르면 항목이 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
