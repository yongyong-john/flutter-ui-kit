import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// An enhanced enum to define the available menus and their shortcuts.
///
/// Using an enum for menu definition is not required, but this illustrates how
/// they could be used for simple menu systems.
enum MenuEntry {
  about('About'),
  showMessage('Show Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  hideMessage('Hide Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  colorMenu('Color Menu'),
  colorRed('Red Background', SingleActivator(LogicalKeyboardKey.keyR, control: true)),
  colorGreen('Green Background', SingleActivator(LogicalKeyboardKey.keyG, control: true)),
  colorBlue('Blue Background', SingleActivator(LogicalKeyboardKey.keyB, control: true));

  const MenuEntry(this.label, [this.shortcut]);
  final String label;
  final MenuSerializableShortcut? shortcut;
}

class MenuAnchorScreen extends StatefulWidget {
  const MenuAnchorScreen({super.key});

  @override
  State<MenuAnchorScreen> createState() => _MenuAnchorScreenState();
}

class _MenuAnchorScreenState extends State<MenuAnchorScreen> {
  MenuEntry? _lastSelection;
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final MenuController _menuController = MenuController();
  ShortcutRegistryEntry? _shortcutsEntry;
  bool _menuWasEnabled = false;

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor = Colors.red;
  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      setState(() {
        _backgroundColor = value;
      });
    }
  }

  bool get showingMessage => _showingMessage;
  bool _showingMessage = false;
  set showingMessage(bool value) {
    if (_showingMessage != value) {
      setState(() {
        _showingMessage = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _disableContextMenu();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Dispose of any previously registered shortcuts, since they are about to
    // be replaced.
    _shortcutsEntry?.dispose();
    // Collect the shortcuts from the different menu selections so that they can
    // be registered to apply to the entire app. Menus don't register their
    // shortcuts, they only display the shortcut hint text.
    final Map<ShortcutActivator, Intent> shortcuts = <ShortcutActivator, Intent>{
      for (final MenuEntry item in MenuEntry.values)
        if (item.shortcut != null) item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    // Register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application.
    _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    _buttonFocusNode.dispose();
    _reenableContextMenu();
    super.dispose();
  }

  Future<void> _disableContextMenu() async {
    if (!kIsWeb) {
      // Does nothing on non-web platforms.
      return;
    }
    _menuWasEnabled = BrowserContextMenu.enabled;
    if (_menuWasEnabled) {
      await BrowserContextMenu.disableContextMenu();
    }
  }

  void _reenableContextMenu() {
    if (!kIsWeb) {
      // Does nothing on non-web platforms.
      return;
    }
    if (_menuWasEnabled && !BrowserContextMenu.enabled) {
      BrowserContextMenu.enableContextMenu();
    }
  }

  void _activate(MenuEntry selection) {
    setState(() {
      _lastSelection = selection;
    });
    switch (selection) {
      case MenuEntry.about:
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('About Dialog'),
            content: const Text('Dialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      case MenuEntry.showMessage:
      case MenuEntry.hideMessage:
        showingMessage = !showingMessage;
      case MenuEntry.colorMenu:
        break;
      case MenuEntry.colorRed:
        backgroundColor = Colors.red;
      case MenuEntry.colorGreen:
        backgroundColor = Colors.green;
      case MenuEntry.colorBlue:
        backgroundColor = Colors.blue;
    }
  }

  void _handleSecondaryTapDown(TapDownDetails details) {
    _menuController.open(position: details.localPosition);
  }

  void _handleTapDown(TapDownDetails details) {
    if (_menuController.isOpen) {
      _menuController.close();
      return;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        // Don't open the menu on these platforms with a Ctrl-tap (or a tap).
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        _menuController.open(position: details.localPosition);
        // Only open the menu on these platforms if the control button is down when the tap occurs.
        if (HardwareKeyboard.instance.logicalKeysPressed.contains(LogicalKeyboardKey.controlLeft) ||
            HardwareKeyboard.instance.logicalKeysPressed.contains(LogicalKeyboardKey.controlRight)) {
          _menuController.open(position: details.localPosition);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    String instructionText;
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      instructionText = 'Long press anywhere on the background to show the menu.';
    } else {
      instructionText = 'Right-click anywhere on the background to show the menu.';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Anchor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: GestureDetector(
          onTapDown: _handleTapDown,
          onSecondaryTapDown: _handleSecondaryTapDown,
          onLongPressStart: (LongPressStartDetails details) {
            _handleSecondaryTapDown(
              TapDownDetails(localPosition: details.localPosition),
            );
          },
          child: MenuAnchor(
            controller: _menuController,
            menuChildren: <Widget>[
              MenuItemButton(
                child: Text(MenuEntry.about.label),
                onPressed: () => _activate(MenuEntry.about),
              ),
              if (_showingMessage)
                MenuItemButton(
                  onPressed: () => _activate(MenuEntry.hideMessage),
                  shortcut: MenuEntry.hideMessage.shortcut,
                  child: Text(MenuEntry.hideMessage.label),
                ),
              if (!_showingMessage)
                MenuItemButton(
                  onPressed: () => _activate(MenuEntry.showMessage),
                  shortcut: MenuEntry.showMessage.shortcut,
                  child: Text(MenuEntry.showMessage.label),
                ),
              SubmenuButton(
                menuChildren: <Widget>[
                  MenuItemButton(
                    onPressed: () => _activate(MenuEntry.colorRed),
                    shortcut: MenuEntry.colorRed.shortcut,
                    child: Text(MenuEntry.colorRed.label),
                  ),
                  MenuItemButton(
                    onPressed: () => _activate(MenuEntry.colorGreen),
                    shortcut: MenuEntry.colorGreen.shortcut,
                    child: Text(MenuEntry.colorGreen.label),
                  ),
                  MenuItemButton(
                    onPressed: () => _activate(MenuEntry.colorBlue),
                    shortcut: MenuEntry.colorBlue.shortcut,
                    child: Text(MenuEntry.colorBlue.label),
                  ),
                ],
                child: const Text('Background Color'),
              ),
            ],
            child: Container(
              alignment: Alignment.center,
              color: backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(instructionText),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      showingMessage ? '"Talk less. Smile more." - A. Burr' : '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Text(_lastSelection != null ? 'Last Selected: ${_lastSelection!.label}' : ''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
