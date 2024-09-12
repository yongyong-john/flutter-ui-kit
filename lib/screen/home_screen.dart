import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/animation_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino_screen.dart';
import 'package:flutter_ui_kit/screen/layout_screen.dart';
import 'package:flutter_ui_kit/screen/material_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const HomeScreen({super.key, required this.toggleTheme, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Kit'),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
              title: Text(themeMode == ThemeMode.dark ? 'Dark Mode' : 'Light Mode'),
              onTap: () {
                toggleTheme();
              },
            ),
            const AboutListTile(
              icon: Icon(Icons.info),
              applicationIcon: FlutterLogo(),
              applicationVersion: '1.0.0',
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).pop(); // 드로어 닫기
                // 정보 옵션 처리
                showAboutDialog(
                    context: context,
                    applicationName: 'About this app.',
                    // NOTE: Update the version.
                    applicationVersion: '1.0.0',
                    children: [
                      const SizedBox(height: 10.0),
                      const Text(
                        'Flutter UI Kit is a sample application that demonstrates various UI components. It is implemented only with Flutter SDK without any external libraries.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Built with the following libraries:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ]);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutScreen()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double totalHeight = constraints.maxHeight - 20.0; // 10.0 패딩 상단과 하단 합
              double cardHeight = totalHeight / 3;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(
                              'Material UI',
                              style: TextStyle(fontSize: cardHeight / 7),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MaterialUiScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(
                              'Cupertino UI',
                              style: TextStyle(fontSize: cardHeight / 7),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CupertinoUiScreen(themeMode: themeMode),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(
                              'Layout UI',
                              style: TextStyle(fontSize: cardHeight / 7),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LayoutScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: ListTile(
                          title: Center(
                            child: Text(
                              'Animation UI',
                              style: TextStyle(fontSize: cardHeight / 7),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AnimationScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
