import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollViewScreen extends StatefulWidget {
  const CustomScrollViewScreen({super.key});

  @override
  State<CustomScrollViewScreen> createState() => _CustomScrollViewScreenState();
}

class _CustomScrollViewScreenState extends State<CustomScrollViewScreen> {
  final List<Color> _colors = []; // 색상을 저장할 리스트
  final Random _random = Random(); // 랜덤 값을 생성하기 위한 랜덤 객체
  final List<double> _heights = []; // 각 항목의 높이를 저장할 리스트

  @override
  void initState() {
    super.initState();
    _initializeItems(10); // 초기 10개의 아이템 추가
  }

  // 초기 아이템들을 추가하는 함수
  void _initializeItems(int count) {
    setState(() {
      for (int i = 0; i < count; i++) {
        _colors.add(_generateRandomColor());
        _heights.add(_generateRandomHeight()); // 각 항목의 랜덤 높이를 추가
      }
    });
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

  // 랜덤 높이를 생성하는 함수 (50에서 150 사이)
  double _generateRandomHeight() {
    return 50 + _random.nextInt(101).toDouble();
  }

  // FAB를 눌렀을 때 호출되는 함수
  void _addItem() {
    setState(() {
      _colors.add(_generateRandomColor()); // 리스트에 랜덤 색상을 추가
      _heights.add(_generateRandomHeight()); // 리스트에 랜덤 높이를 추가
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height / 2,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Custom Scroll View with Silver'),
              centerTitle: true,
              background: Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: _heights[index],
                  color: _colors[index],
                  child: Center(
                    child: Text(
                      'List Item $index',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
              childCount: _colors.length,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: _colors[index],
                  child: Center(
                    child: Text(
                      'Grid Item $index',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
              childCount: _colors.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 그리드의 열 개수
              mainAxisSpacing: 10.0, // 항목 간의 세로 간격
              crossAxisSpacing: 10.0, // 항목 간의 가로 간격
              childAspectRatio: 1.0, // 항목의 가로 세로 비율
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem, // 버튼을 누르면 항목이 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
