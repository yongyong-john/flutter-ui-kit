import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/menu/dropdown_menu_screen.dart';
import 'package:flutter_ui_kit/screen/material/menu/menu_anchor_screen.dart';
import 'package:flutter_ui_kit/screen/material/menu/menu_bar_screen.dart';

class MenuGroupScreen extends StatelessWidget {
  const MenuGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Group'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Menu Anchor'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuAnchorScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Dropdown Menu'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DropdownMenuScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('MenuBar'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuBarScreen(),
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
