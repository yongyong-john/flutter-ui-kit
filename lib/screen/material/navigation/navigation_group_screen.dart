import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/navigation/bottom_navigation_bar_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_bar_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_drawer_screen.dart';
import 'package:flutter_ui_kit/screen/material/navigation/navigation_rail_screen.dart';

class NavigationGroupScreen extends StatelessWidget {
  const NavigationGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Group'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Bottom Navigation Bar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigationBarScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Navigation Bar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NavigationBarScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Navigation Rail'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NavigationRailScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Navigation Drawer'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NavigationDrawerScreen(),
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
