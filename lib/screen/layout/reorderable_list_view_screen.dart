import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/color_manager.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() => _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  late ColorManager _colorManager;

  @override
  void initState() {
    super.initState();
    _colorManager = ColorManager(10); // 초기 5개의 항목 생성
    _colorManager.addListener(() {
      setState(() {});
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
        title: const Text('Reorderable List View'),
        centerTitle: true,
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            _colorManager.reorderItems(oldIndex, newIndex);
          });
        },
        children: _colorManager.colors.map((color) {
          final int index = _colorManager.colors.indexOf(color);
          return ListTile(
            key: ValueKey(color),
            tileColor: color,
            title: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _colorManager.addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
