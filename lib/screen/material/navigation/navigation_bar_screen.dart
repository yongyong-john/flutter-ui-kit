import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.amber,
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.commute),
            ),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.bookmark_border),
            ),
            label: 'Saved',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Label behavior: ${labelBehavior.name}'),
            const SizedBox(height: 10),
            OverflowBar(
              spacing: 10.0,
              children: <Widget>[
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
                      });
                    },
                    child: const Text('alwaysShow'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;
                      });
                    },
                    child: const Text('onlyShowSelected'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
                      });
                    },
                    child: const Text('alwaysHide'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
