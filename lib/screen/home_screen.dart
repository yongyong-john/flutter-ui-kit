import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screen/about_screen.dart';
import 'package:flutter_ui_kit/screen/added_package_ui_screen.dart';
import 'package:flutter_ui_kit/screen/cupertino_ui_screen.dart';
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
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: const Text('Material UI'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MaterialUiScreen(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Cupertino UI'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CupertinoUiScreen(),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Added Package UI'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddedPackageUiScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
