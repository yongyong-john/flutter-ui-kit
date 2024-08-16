import 'package:flutter/cupertino.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Checkbox'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoCheckbox(
              tristate: true,
              value: isCheck,
              onChanged: (bool? vlaue) {
                setState(() {
                  isCheck = vlaue;
                });
              },
            ),
            CupertinoCheckbox(
              activeColor: CupertinoColors.activeGreen,
              tristate: true,
              value: isCheck,
              onChanged: (bool? value) {
                setState(() {
                  isCheck = value;
                });
              },
            ),
            CupertinoCheckbox(
              tristate: true,
              value: isCheck,
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
