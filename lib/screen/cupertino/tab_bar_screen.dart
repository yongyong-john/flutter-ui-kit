import 'package:flutter/cupertino.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star_fill),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clock_solid),
              label: 'Recents',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt_circle_fill),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
              label: 'Keypad',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Cupertino Tab Bar: Page 1 of tab $index'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: const Text('Next page'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text('Page 2 of tab $index'),
                              ),
                              child: Center(
                                child: CupertinoButton(
                                  child: const Text('Back'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
