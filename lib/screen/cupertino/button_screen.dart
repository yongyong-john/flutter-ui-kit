import 'package:flutter/cupertino.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Button'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CupertinoButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const SizedBox(height: 30),
            const CupertinoButton.filled(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const SizedBox(height: 30),
            CupertinoButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
