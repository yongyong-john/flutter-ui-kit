import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/appbar/appbar_group_screen.dart';
import 'package:flutter_ui_kit/screen/material/badge_screen.dart';
import 'package:flutter_ui_kit/screen/material/bottom_sheet_screen.dart';
import 'package:flutter_ui_kit/screen/material/button/button_group_screen.dart';
import 'package:flutter_ui_kit/screen/material/card_screen.dart';
import 'package:flutter_ui_kit/screen/material/checkbox_screen.dart';
import 'package:flutter_ui_kit/screen/material/clip_screen.dart';
import 'package:flutter_ui_kit/screen/material/datetime_picker_screen.dart';
import 'package:flutter_ui_kit/screen/material/dialog_screen.dart';
import 'package:flutter_ui_kit/screen/material/divider_screen.dart';
import 'package:flutter_ui_kit/screen/material/list_tile_screen.dart';
import 'package:flutter_ui_kit/screen/material/menu/menu_group_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_group_screen.dart';
import 'package:flutter_ui_kit/screen/material/progress_screen.dart';
import 'package:flutter_ui_kit/screen/material/drawer_screen.dart';
import 'package:flutter_ui_kit/screen/material/radio_screen.dart';
import 'package:flutter_ui_kit/screen/material/scrollbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/slider_screen.dart';
import 'package:flutter_ui_kit/screen/material/switch_screen.dart';
import 'package:flutter_ui_kit/screen/material/text/text_group_screen.dart';
import 'package:flutter_ui_kit/screen/material/toast_screen.dart';
import 'package:flutter_ui_kit/screen/material/search_anchor_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class MaterialUiScreen extends StatelessWidget {
  const MaterialUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material UI'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'AppBar Group', screen: AppbarGroupScreen()),
              ListTileWidget(title: 'Badge', screen: BadgeScreen()),
              ListTileWidget(title: 'Bottom Sheet', screen: BottomSheetScreen()),
              ListTileWidget(title: 'Button Group', screen: ButtonGroupScreen()),
              ListTileWidget(title: 'Card', screen: CardScreen()),
              ListTileWidget(title: 'Checkbox', screen: CheckboxScreen()),
              ListTileWidget(title: 'Clips', screen: ClipScreen()),
              ListTileWidget(title: 'Date & Time Picker', screen: DateTimePickerScreen()),
              ListTileWidget(title: 'Dialog', screen: DialogScreen()),
              ListTileWidget(title: 'Divider', screen: DividerScreen()),
              ListTileWidget(title: 'Drawer', screen: DrawerScreen()),
              ListTileWidget(title: 'ListTile', screen: ListTileScreen()),
              ListTileWidget(title: 'Menu Group', screen: MenuGroupScreen()),
              ListTileWidget(title: 'Navigation Group', screen: NavigationGroupScreen()),
              ListTileWidget(title: 'Progress Indicators', screen: ProgressIndicatorScreen()),
              ListTileWidget(title: 'Radio', screen: RadioScreen()),
              ListTileWidget(title: 'Scrollbar', screen: ScrollbarScreen()),
              ListTileWidget(title: 'Search Anchor', screen: SearchAnchorScreen()),
              ListTileWidget(title: 'Slider', screen: SliderScreen()),
              ListTileWidget(title: 'Switch', screen: SwitchScreen()),
              ListTileWidget(title: 'Text Group', screen: TextGroupScreen()),
              ListTileWidget(title: 'Toast & SnackBar', screen: ToastScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
