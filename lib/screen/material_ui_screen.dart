import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/badge_screen.dart';
import 'package:flutter_ui_kit/screen/material/basic_appbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/bottom_sheet_screen.dart';
import 'package:flutter_ui_kit/screen/material/card_screen.dart';
import 'package:flutter_ui_kit/screen/material/clip_screen.dart';
import 'package:flutter_ui_kit/screen/material/datetime_picker_screen.dart';
import 'package:flutter_ui_kit/screen/material/button_screen.dart';
import 'package:flutter_ui_kit/screen/material/dialog_screen.dart';
import 'package:flutter_ui_kit/screen/material/divider_screen.dart';
import 'package:flutter_ui_kit/screen/material/icon_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/list_tile_screen.dart';
import 'package:flutter_ui_kit/screen/material/list_view_screen.dart';
import 'package:flutter_ui_kit/screen/material/progress_screen.dart';
import 'package:flutter_ui_kit/screen/material/side_sheet_screen.dart';
import 'package:flutter_ui_kit/screen/material/silver_appbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/slider_screen.dart';
import 'package:flutter_ui_kit/screen/material/tabbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/text_button_screen.dart';
import 'package:flutter_ui_kit/screen/material/text_screen.dart';
import 'package:flutter_ui_kit/screen/material/toast_screen.dart';

class MaterialUiScreen extends StatelessWidget {
  const MaterialUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('AppBar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BasicAppBarScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('SilverAppBar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SilverAppBarScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Text'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Progress'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProgressScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Date Time Picker'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DateTimePickerScreen(),
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
              ListTile(
                title: const Text('Side Sheet'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SideSheetScreen(),
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
                title: const Text('Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ButtonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Icon Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IconButtonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Text Buttons'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TextButtonScreen(),
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
                title: const Text('ListView'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListViewScreen(),
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
                title: const Text('Clip'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ClipScreen(),
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
                title: const Text('TabBar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TabBarScreen(),
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
