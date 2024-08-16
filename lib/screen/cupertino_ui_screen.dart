import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/screen/cupertino/action_sheet_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/activity_indicator_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/alert_dialog_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/button_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/checkbox_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/context_menu_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/date_time_picker_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/form_row_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/list_section_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/popup_surface_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/radio_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/segmented_control_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/silver_navigation_bar_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/silver_refresh_control_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/slider_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/switch_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/tab_bar_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino/text_field_screen.dart';

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
                CupertinoListTile(
                  title: const Text('Checkbox'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const CheckboxScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Context Menu'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const ContextMenuScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Date & Time Picker'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const DateTimePickerScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Form Row'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const FormRowScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('List Section'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const ListSectionScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Popup Surface'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const PopupSurfaceScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Radio'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const RadioScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Text Field'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const TextFieldScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Segmented Control'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SegmentedControlScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Slider'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SliderScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Silver Navigation Bar'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SilverNavigationBarScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Silver Refrash Control'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SilverRefreshControlScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Switch'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SwitchScreen(),
                      ),
                    );
                  },
                ),
                CupertinoListTile(
                  title: const Text('Tab Bar'),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const TabBarScreen(),
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
