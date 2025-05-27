import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_ui_kit/widget/cupertino_list_tile_widget.dart';

class CupertinoUiScreen extends StatelessWidget {
  final ThemeMode themeMode;

  const CupertinoUiScreen({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
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
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoListTileWidget(title: 'Action Sheet', screen: ActionSheetScreen()),
                CupertinoListTileWidget(title: 'Activity Indicator', screen: ActivityIndicatorScreen()),
                CupertinoListTileWidget(title: 'Alert Dialog', screen: AlertDialogScreen()),
                CupertinoListTileWidget(title: 'Button', screen: ButtonScreen()),
                CupertinoListTileWidget(title: 'Checkbox', screen: CheckboxScreen()),
                CupertinoListTileWidget(title: 'Context Menu', screen: ContextMenuScreen()),
                CupertinoListTileWidget(title: 'Date & Time Picker', screen: DateTimePickerScreen()),
                CupertinoListTileWidget(title: 'Form Row', screen: FormRowScreen()),
                CupertinoListTileWidget(title: 'List Section', screen: ListSectionScreen()),
                CupertinoListTileWidget(title: 'Popup Surface', screen: PopupSurfaceScreen()),
                CupertinoListTileWidget(title: 'Radio', screen: RadioScreen()),
                CupertinoListTileWidget(title: 'Text Field', screen: TextFieldScreen()),
                CupertinoListTileWidget(title: 'Segmented Control', screen: SegmentedControlScreen()),
                CupertinoListTileWidget(title: 'Slider', screen: SliderScreen()),
                CupertinoListTileWidget(title: 'Silver Navigation Bar', screen: SilverNavigationBarScreen()),
                CupertinoListTileWidget(title: 'Silver Refresh Control', screen: SilverRefreshControlScreen()),
                CupertinoListTileWidget(title: 'Switch', screen: SwitchScreen()),
                CupertinoListTileWidget(title: 'Tab Bar', screen: TabBarScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
