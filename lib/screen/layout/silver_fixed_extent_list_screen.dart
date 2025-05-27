import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/color_manager.dart';

class SliverFixedExtentListScreen extends StatefulWidget {
  const SliverFixedExtentListScreen({super.key});

  @override
  State<SliverFixedExtentListScreen> createState() => _SliverFixedExtentListScreenState();
}

class _SliverFixedExtentListScreenState extends State<SliverFixedExtentListScreen> {
  late ColorManager _colorManager;

  @override
  void initState() {
    super.initState();
    _colorManager = ColorManager(10);
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Sliver Fixed Extent List'),
              background: Image.asset(
                "assets/images/owl.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0, // 각 항목의 고정된 크기
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: _colorManager.colors[index],
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
              childCount: _colorManager.colors.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _colorManager.addItem, // 버튼을 누르면 항목이 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
