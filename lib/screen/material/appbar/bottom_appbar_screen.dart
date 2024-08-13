import 'package:flutter/material.dart';

/// Flutter code sample for [BottomAppBar].

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;

  // static final List<FloatingActionButtonLocation> allLocations = <FloatingActionButtonLocation>[
  //   FloatingActionButtonLocation.startDocked,
  //   FloatingActionButtonLocation.startFloat,
  //   FloatingActionButtonLocation.startTop,
  //   FloatingActionButtonLocation.centerDocked,
  //   FloatingActionButtonLocation.centerFloat,
  //   FloatingActionButtonLocation.centerTop,
  //   FloatingActionButtonLocation.endContained,
  //   FloatingActionButtonLocation.endDocked,
  //   FloatingActionButtonLocation.endFloat,
  //   FloatingActionButtonLocation.endTop,
  //   FloatingActionButtonLocation.miniCenterDocked,
  //   FloatingActionButtonLocation.miniCenterFloat,
  //   FloatingActionButtonLocation.miniCenterTop,
  //   FloatingActionButtonLocation.miniEndDocked,
  //   FloatingActionButtonLocation.miniEndFloat,
  //   FloatingActionButtonLocation.miniEndTop,
  //   FloatingActionButtonLocation.miniStartDocked,
  //   FloatingActionButtonLocation.miniStartFloat,
  //   FloatingActionButtonLocation.miniStartTop,
  // ];

  static final List<FloatingActionButtonLocation> centerLocations = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.centerTop,
  ];

  static final List<FloatingActionButtonLocation> startLocation = <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startTop,
  ];

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      print(value);
      if (value != null) {
        _fabLocation = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom App Bar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: <Widget>[
          SwitchListTile(
            title: const Text(
              'Floating Action Button',
            ),
            value: _showFab,
            onChanged: _onShowFabChanged,
          ),
          SwitchListTile(
            title: const Text('Notch'),
            value: _showNotch,
            onChanged: _onShowNotchChanged,
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Floating action button position'),
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Docked - End'),
            value: FloatingActionButtonLocation.endDocked,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Docked - Center'),
            value: FloatingActionButtonLocation.centerDocked,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Docked - Start'),
            value: FloatingActionButtonLocation.startDocked,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Floating - End'),
            value: FloatingActionButtonLocation.endFloat,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Floating - Center'),
            value: FloatingActionButtonLocation.centerFloat,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Floating - Start'),
            value: FloatingActionButtonLocation.startFloat,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
          RadioListTile<FloatingActionButtonLocation>(
            title: const Text('Contanied - End'),
            value: FloatingActionButtonLocation.endContained,
            groupValue: _fabLocation,
            onChanged: _onFabLocationChanged,
          ),
        ],
      ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Create',
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: BottomAppBar(
        shape: _showNotch ? const CircularNotchedRectangle() : null,
        color: Colors.blue,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              if (startLocation.contains(_fabLocation)) const Spacer(),
              IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              if (centerLocations.contains(_fabLocation)) const Spacer(),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
