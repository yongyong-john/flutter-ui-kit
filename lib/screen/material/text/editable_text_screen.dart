import 'package:flutter/material.dart';

class EditableTextScreen extends StatefulWidget {
  const EditableTextScreen({super.key});

  @override
  State<EditableTextScreen> createState() => _EditableTextScreenState();
}

class _EditableTextScreenState extends State<EditableTextScreen> {
  // 텍스트 편집 컨트롤러를 생성합니다.
  final TextEditingController _controller = TextEditingController();
  // 포커스 노드 생성
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // 위젯이 dispose될 때 텍스트 편집 컨트롤러와 포커스 노드를 정리합니다.
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editable Text'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EditableText(
              controller: _controller,
              focusNode: _focusNode,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),
              cursorColor: Colors.blue,
              backgroundCursorColor: Colors.grey,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text(
              '입력된 텍스트: ${_controller.text}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // 버튼 클릭 시 텍스트 필드의 내용을 읽고 업데이트합니다.
                });
              },
              child: const Text('텍스트 확인'),
            ),
          ],
        ),
      ),
    );
  }
}
