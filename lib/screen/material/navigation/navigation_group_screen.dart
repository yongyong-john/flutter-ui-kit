import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/navigation/bottom_navigation_bar_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_bar_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_drawer_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_rail_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class NavigationGroupScreen extends StatelessWidget {
  const NavigationGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Bottom Navigation Bar', screen: BottomNavigationBarScreen()),
              ListTileWidget(title: 'Navigation Bar', screen: NavigationBarScreen()),
              ListTileWidget(title: 'Navigation Rail', screen: NavigationRailScreen()),
              ListTileWidget(title: 'Navigation Drawer', screen: NavigationDrawerScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
