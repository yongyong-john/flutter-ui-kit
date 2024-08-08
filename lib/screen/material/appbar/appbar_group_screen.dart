import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/appbar/basic_appbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/silver_appbar_screen.dart';
import 'package:flutter_ui_kit/screen/material/appbar/tabbar_screen.dart';

class AppbarGroupScreen extends StatelessWidget {
  const AppbarGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar Group'),
        centerTitle: true,
      ),
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
