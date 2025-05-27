import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/appbar/basic_appbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/pinned_header_silver_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/silver_appbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/silver_resizing_header_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/tabbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/bottom_appbar_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class AppbarGroupScreen extends StatelessWidget {
  const AppbarGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'AppBar', screen: BasicAppBarScreen()),
              ListTileWidget(title: 'BottomAppBar', screen: BottomAppBarScreen()),
              ListTileWidget(title: 'PinnedHeaderSilver', screen: PinnedHeaderSilverScreen()),
              ListTileWidget(title: 'SilverAppBar', screen: SilverAppBarScreen()),
              ListTileWidget(title: 'SilverResizingHeader', screen: SilverResizingHeaderScreen()),
              ListTileWidget(title: 'TabBar', screen: TabBarScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
