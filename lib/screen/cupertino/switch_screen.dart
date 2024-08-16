import 'package:flutter/cupertino.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Switch'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoSwitch(
              // This bool value toggles the switch.
              value: switchValue,
              activeColor: CupertinoColors.activeBlue,
              onChanged: (bool? value) {
                // This is called when the user toggles the switch.
                setState(() {
                  switchValue = value ?? false;
                });
              },
            ),
            CupertinoSwitch(
              value: switchValue,
              activeColor: CupertinoColors.activeOrange,
              thumbColor: CupertinoColors.activeGreen,
              trackColor: CupertinoColors.systemIndigo,
              onChanged: (bool? value) {
                setState(() {
                  switchValue = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
