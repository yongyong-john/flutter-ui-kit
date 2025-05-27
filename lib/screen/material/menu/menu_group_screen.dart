import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/material/menu/dropdown_menu_screen.dart';
import 'package:flutter_ui_kit/screen/material/menu/menu_anchor_screen.dart';
import 'package:flutter_ui_kit/screen/material/menu/menu_bar_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class MenuGroupScreen extends StatelessWidget {
  const MenuGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Group'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Menu Anchor', screen: MenuAnchorScreen()),
              ListTileWidget(title: 'Dropdown Menu', screen: DropdownMenuScreen()),
              ListTileWidget(title: 'MenuBar', screen: MenuBarScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
