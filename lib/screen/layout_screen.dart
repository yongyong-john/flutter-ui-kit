import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/layout/custom_scroll_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/grid_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/list_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/page_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/list_wheel_scroll_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/reorderable_list_view_screen.dart';
import 'package:flutter_ui_kit/screen/layout/silver_fixed_extent_list_screen.dart';
import 'package:flutter_ui_kit/screen/layout/stack_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout UI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('List View'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListViewScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('GridView'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GridViewScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('PageView'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PageViewScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Custom Scroll View with Silver'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CustomScrollViewScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('List Wheel Scroll View'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListWheelScrollViewScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Reorderable List View'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ReorderableListViewScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Sliver Fixed Extent List'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SliverFixedExtentListScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Stack'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StackScreen(),
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
