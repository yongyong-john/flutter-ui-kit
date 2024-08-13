import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/screen/cupertino/action_sheet_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/activity_indicator_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/alert_dialog_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/button_screen.dart';

class CupertinoUiScreen extends StatelessWidget {
  const CupertinoUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Cupertino UI'),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoListTile(
                  title: const Text('Action Sheet'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const ActionSheetScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Activity Indicator'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const ActivityIndicatorScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Alert Dialog'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const AlertDialogScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Button'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const ButtonScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
