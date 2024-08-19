import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/color_manager.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _pageController = PageController(); // PageView를 제어하기 위한 컨트롤러
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
        title: const Text('Page View'),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: _pageController, // PageView를 제어하는 컨트롤러
        itemCount: _colorManager.colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: _colorManager.colors[index],
            child: Center(
              child: Text(
                'Page $index',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _colorManager.addItem, // 버튼을 누르면 페이지가 추가됨
        child: const Icon(Icons.add),
      ),
    );
  }
}
