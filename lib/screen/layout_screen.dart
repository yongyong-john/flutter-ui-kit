import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/layout/custom_scroll_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/grid_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/list_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/page_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/list_wheel_scroll_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/reorderable_list_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/silver_fixed_extent_list_screen.dart';
import 'package:flutter_ui_kit/screen/layout/stack_screen.dart';
import 'package:flutter_ui_kit/widget/list_tile_widget.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout UI'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(title: 'Custom Scroll View with Silver', screen: CustomScrollViewScreen()),
              ListTileWidget(title: 'GridView', screen: GridViewScreen()),
              ListTileWidget(title: 'List View', screen: ListViewScreen()),
              ListTileWidget(title: 'List Wheel Scroll View', screen: ListWheelScrollViewScreen()),
              ListTileWidget(title: 'PageView', screen: PageViewScreen()),
              ListTileWidget(title: 'Reorderable List View', screen: ReorderableListViewScreen()),
              ListTileWidget(title: 'Sliver Fixed Extent List', screen: SliverFixedExtentListScreen()),
              ListTileWidget(title: 'Stack', screen: StackScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
