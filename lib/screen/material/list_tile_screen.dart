import 'package:flutter/material.dart';

class ListTileScreen extends StatefulWidget {
  const ListTileScreen({super.key});

  @override
  State<ListTileScreen> createState() => _ListTileScreenState();
}

class _ListTileScreenState extends State<ListTileScreen> {
  bool _selected = false;
  bool _enabled = true;
  bool _checked = false;
  ListTileTitleAlignment? titleAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const Center(
            child: Text('stateless widget'),
          ),
          const Card(
            child: ListTile(
              title: Text('One-line ListTile'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          const Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          const Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          const Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle: Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Headline'),
            subtitle: Text('Supporting text'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: CircleAvatar(
              child: Text('B'),
            ),
            title: Text('Headline'),
            subtitle: Text(
                'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: CircleAvatar(
              child: Text('C'),
            ),
            title: Text('Headline'),
            subtitle: Text(
                "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
            trailing: Icon(Icons.favorite_rounded),
            isThreeLine: true,
          ),
          const Center(
            child: Text('stateful widget'),
          ),
          ListTile(
            enabled: _enabled,
            selected: _selected,
            onTap: () {
              setState(() {
                // This is called when the user toggles the switch.
                _selected = !_selected;
              });
            },
            // This sets text color and icon color to red when list tile is disabled and
            // green when list tile is selected, otherwise sets it to black.
            iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.red;
              }
              if (states.contains(WidgetState.selected)) {
                return Colors.green;
              }
              return Colors.black;
            }),
            // This sets text color and icon color to red when list tile is disabled and
            // green when list tile is selected, otherwise sets it to black.
            textColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.red;
              }
              if (states.contains(WidgetState.selected)) {
                return Colors.green;
              }
              return Colors.black;
            }),
            leading: const Icon(Icons.person),
            title: const Text('Headline'),
            subtitle: Text('Enabled: $_enabled, Selected: $_selected'),
            trailing: Switch(
              onChanged: (bool? value) {
                // This is called when the user toggles the switch.
                setState(() {
                  _enabled = value!;
                });
              },
              value: _enabled,
            ),
          ),
          const Divider(height: 0),
          ListTile(
            titleAlignment: titleAlignment,
            leading: Checkbox(
              value: _checked,
              onChanged: (bool? value) {
                setState(() {
                  _checked = !_checked;
                });
              },
            ),
            title: const Text('Headline Text'),
            subtitle: const Text(
                'Tapping on the trailing widget will show a menu that allows you to change the title alignment. The title alignment is set to threeLine by default if `ThemeData.useMaterial3` is true. Otherwise, defaults to titleHeight.'),
            trailing: PopupMenuButton<ListTileTitleAlignment>(
              onSelected: (ListTileTitleAlignment? value) {
                setState(() {
                  titleAlignment = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<ListTileTitleAlignment>>[
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.threeLine,
                  child: Text('threeLine'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.titleHeight,
                  child: Text('titleHeight'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.top,
                  child: Text('top'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.center,
                  child: Text('center'),
                ),
                const PopupMenuItem<ListTileTitleAlignment>(
                  value: ListTileTitleAlignment.bottom,
                  child: Text('bottom'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
