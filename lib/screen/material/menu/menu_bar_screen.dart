import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuBarScreen extends StatefulWidget {
  const MenuBarScreen({super.key});

  @override
  State<MenuBarScreen> createState() => _MenuBarScreenState();
}

class _MenuBarScreenState extends State<MenuBarScreen> {
  ShortcutRegistryEntry? _shortcutsEntry;
  String? _lastSelection;

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor = Colors.red;
  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      setState(() {
        _backgroundColor = value;
      });
    }
  }

  bool get showingMessage => _showMessage;
  bool _showMessage = false;
  set showingMessage(bool value) {
    if (_showMessage != value) {
      setState(() {
        _showMessage = value;
      });
    }
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Bar'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: MenuBar(
                  children: [
                    fileSubMenuButton(context),
                    viewSubMenuButton(context),
                    menuDemoSubMenuButton(context),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      showingMessage ? '"Talk less. Smile more." - A. Burr' : '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(_lastSelection != null ? 'Last Selected: $_lastSelection' : ''),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  SubmenuButton menuDemoSubMenuButton(BuildContext context) {
    return SubmenuButton(
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: 'MenuBar Sample',
              applicationVersion: '1.0.0',
            );
            setState(() {
              _lastSelection = 'About';
            });
          },
          child: const Text('About'),
        ),
        MenuItemButton(
          onPressed: () {
            setState(() {
              _lastSelection = showingMessage ? 'Hide Message' : 'Show Message';
              showingMessage = !showingMessage;
            });
          },
          shortcut: const SingleActivator(LogicalKeyboardKey.keyS, control: true),
          child: Text(showingMessage ? 'Hide Message' : 'Show Message'),
        ),
        MenuItemButton(
          onPressed: showingMessage
              ? () {
                  setState(() {
                    _lastSelection = 'Reset Message';
                    showingMessage = false;
                  });
                }
              : null,
          shortcut: const SingleActivator(LogicalKeyboardKey.escape),
          child: const Text('Reset Message'),
        ),
        SubmenuButton(
          menuChildren: [
            MenuItemButton(
              onPressed: () {
                setState(() {
                  _lastSelection = 'Red Background';
                  backgroundColor = Colors.red;
                });
              },
              shortcut: const SingleActivator(LogicalKeyboardKey.keyR, control: true),
              child: const Text('Red Background'),
            ),
            MenuItemButton(
              onPressed: () {
                setState(() {
                  _lastSelection = 'Green Background';
                  backgroundColor = Colors.green;
                });
              },
              shortcut: const SingleActivator(LogicalKeyboardKey.keyG, control: true),
              child: const Text('Green Background'),
            ),
            MenuItemButton(
              onPressed: () {
                setState(() {
                  _lastSelection = 'Blue Background';
                  backgroundColor = Colors.blue;
                });
              },
              shortcut: const SingleActivator(LogicalKeyboardKey.keyB, control: true),
              child: const Text('Blue Background'),
            ),
          ],
          child: const Text('Background Color'),
        ),
      ],
      child: const Text('Menu Demo'),
    );
  }

  SubmenuButton viewSubMenuButton(BuildContext context) {
    return SubmenuButton(
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Magnify!'),
              ),
            );
          },
          child: const MenuAcceleratorLabel('&Magnify'),
        ),
        MenuItemButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Minify!'),
              ),
            );
          },
          child: const MenuAcceleratorLabel('Mi&nify'),
        ),
      ],
      child: const MenuAcceleratorLabel('&View'),
    );
  }

  SubmenuButton fileSubMenuButton(BuildContext context) {
    return SubmenuButton(
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Saved!'),
              ),
            );
          },
          child: const MenuAcceleratorLabel('&Save'),
        ),
        MenuItemButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Quit!'),
              ),
            );
          },
          child: const MenuAcceleratorLabel('&Quit'),
        ),
      ],
      child: const MenuAcceleratorLabel('&File'),
    );
  }
}
