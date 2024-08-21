import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/about_screen.dart';
import 'package:flutter_ui_kit/screen/animation_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino_ui_screen.dart';
import 'package:flutter_ui_kit/screen/layout_screen.dart';
import 'package:flutter_ui_kit/screen/material_ui_screen.dart';
import 'package:flutter_ui_kit/screen/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // 설정 옵션 처리
                Navigator.of(context).pop(); // 드로어 닫기
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // 정보 옵션 처리
                Navigator.of(context).pop(); // 드로어 닫기
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutScreen()));
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
                                builder: (context) => const CupertinoUiScreen(),
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
                              'Basic Layout UI',
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
                              'Basic Animation UI',
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
