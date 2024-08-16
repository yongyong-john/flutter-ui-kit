import 'package:flutter/cupertino.dart';

enum Sky { midnight, viridian, cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
};

class SegmentedControlScreen extends StatefulWidget {
  const SegmentedControlScreen({super.key});

  @override
  State<SegmentedControlScreen> createState() => _SegmentedControlScreenState();
}

class _SegmentedControlScreenState extends State<SegmentedControlScreen> {
  Sky _selectedSegment = Sky.midnight;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
        backgroundColor: skyColors[_selectedSegment],
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Cupertino Segmented Control'),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // This Cupertino segmented control has the enum "Sky" as the type.
              CupertinoSegmentedControl<Sky>(
                selectedColor: skyColors[_selectedSegment],
                // Provide horizontal padding around the children.
                padding: const EdgeInsets.symmetric(horizontal: 12),
                // This represents a currently selected segmented control.
                groupValue: _selectedSegment,
                // Callback that sets the selected segmented control.
                onValueChanged: (Sky value) {
                  setState(() {
                    _selectedSegment = value;
                  });
                },
                children: const <Sky, Widget>{
                  Sky.midnight: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Midnight'),
                  ),
                  Sky.viridian: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Viridian'),
                  ),
                  Sky.cerulean: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Cerulean'),
                  ),
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Selected Segment: ${_selectedSegment.name}',
                style: const TextStyle(color: CupertinoColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
