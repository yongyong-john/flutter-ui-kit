import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/message.dart';

class IconButtonScreen extends StatefulWidget {
  const IconButtonScreen({super.key});

  @override
  State<IconButtonScreen> createState() => _IconButtonScreenState();
}

class _IconButtonScreenState extends State<IconButtonScreen> {
  double _volume = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Buttons'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_down),
                tooltip: 'Decrease volume by 10',
                onPressed: () {
                  setState(() {
                    _volume -= 10;
                    if (_volume < 0) _volume = 0;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.volume_up),
                tooltip: 'Increase volume by 10',
                onPressed: () {
                  setState(() {
                    _volume += 10;
                    if (_volume > 100) _volume = 100;
                  });
                },
              ),
            ],
          ),
          Text('Volume : $_volume'),
          const SizedBox(
            height: 20,
          ),
          const Text('A sample for enabling/disabling each icon button.'),
          const Text('In order, they are basic, filled, filledTonal, outlined.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dramaIconButton(true),
              dramaIconButton(false),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Message.showMessage(context, 'Mini FAB pressed');
                },
                mini: true,
                heroTag: 'fab1',
                child: const Icon(Icons.edit),
              ),
              FloatingActionButton(
                onPressed: () {
                  Message.showMessage(context, 'Colored FAB pressed');
                },
                backgroundColor: Colors.green,
                heroTag: 'fab2',
                child: const Icon(Icons.color_lens),
              ),
              FloatingActionButton(
                onPressed: () {
                  Message.showMessage(context, 'Icon FAB pressed');
                },
                foregroundColor: Colors.red,
                heroTag: 'fab3',
                child: const Icon(Icons.thumb_up),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {
              Message.showMessage(context, 'Extended FAB 1 pressed');
            },
            label: const Text('Extended FAB 1'),
            icon: const Icon(Icons.add),
            heroTag: 'extendedFab1',
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              Message.showMessage(context, 'Extended FAB 2 pressed');
            },
            label: const Text('Extended FAB 2'),
            icon: const Icon(Icons.edit),
            heroTag: 'extendedFab2',
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              Message.showMessage(context, 'Extended FAB 3 pressed');
            },
            label: const Text('Extended FAB 3'),
            icon: const Icon(Icons.navigation),
            heroTag: 'extendedFab3',
          ),
        ],
      ),
    );
  }

  Padding dramaIconButton(bool enabled) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(icon: const Icon(Icons.filter_drama), onPressed: onPressed),

          // Filled icon button
          IconButton.filled(onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

          // Filled tonal icon button
          IconButton.filledTonal(onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

          // Outlined icon button
          IconButton.outlined(onPressed: onPressed, icon: const Icon(Icons.filter_drama)),
        ],
      ),
    );
  }
}
