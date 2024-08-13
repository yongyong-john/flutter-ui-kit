import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool light = true;
  bool light0 = true;
  bool light1 = true;
  bool lightAdaptive = true;
  bool _lights = false;
  bool _isSelected = false;

  final WidgetStateProperty<Icon?> thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    final WidgetStateProperty<Color?> trackColor = WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        // Track color when the switch is selected.
        if (states.contains(WidgetState.selected)) {
          return Colors.amber;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final WidgetStateProperty<Color?> overlayColor = WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        // Material color when switch is selected.
        if (states.contains(WidgetState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Colored Switch',
                style: TextStyle(fontSize: 16),
              ),
              Switch(
                value: light,
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: const WidgetStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  setState(() {
                    light = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Basic Switch',
                style: TextStyle(fontSize: 16),
              ),
              Switch(
                value: light0,
                onChanged: (bool value) {
                  setState(() {
                    light0 = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Icon Switch',
                style: TextStyle(fontSize: 16),
              ),
              Switch(
                thumbIcon: thumbIcon,
                value: light1,
                onChanged: (bool value) {
                  setState(() {
                    light1 = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Adaptive Switch',
                style: TextStyle(fontSize: 16),
              ),
              Switch.adaptive(
                value: lightAdaptive,
                onChanged: (bool value) {
                  setState(() {
                    lightAdaptive = value;
                  });
                },
              ),
              Switch.adaptive(
                // Don't use the ambient CupertinoThemeData to style this switch.
                applyCupertinoTheme: false,
                value: lightAdaptive,
                onChanged: (bool value) {
                  setState(() {
                    lightAdaptive = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Switch List Tile',
                style: TextStyle(fontSize: 16),
              ),
              SwitchListTile(
                title: const Text('Lights'),
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                },
                secondary: _lights
                    ? const Icon(
                        Icons.lightbulb,
                        color: Colors.amber,
                      )
                    : const Icon(Icons.lightbulb),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Labeled Switch',
                style: TextStyle(fontSize: 16),
              ),
              LabeledSwitch(
                label: 'This is the label text',
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
