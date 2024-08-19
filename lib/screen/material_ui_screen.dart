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
import 'package:flutter_ui_kit/screen/search_anchor_screen.dart';

class MaterialUiScreen extends StatelessWidget {
  const MaterialUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material UI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('AppBar Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppbarGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Badge'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BadgeScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Bottom Sheet'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomSheetScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Button Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ButtonGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Card'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CardScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Checkbox'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CheckboxScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Clips'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ClipScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Date & Time Picker'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DateTimePickerScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Dialog'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DialogScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Divider'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DividerScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Drawer'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DrawerScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('ListTile'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListTileScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Menu Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Navigation Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NavigationGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Progress Indicators'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProgressIndicatorScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Radio'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RadioScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Scrollbar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScrollbarScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Search Anchor'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchAnchorScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Slider'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SliderScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Switch'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SwitchScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Text Group'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextGroupScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Toast & SnackBar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ToastScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
