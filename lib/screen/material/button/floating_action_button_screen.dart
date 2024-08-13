import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/utils/message.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({super.key});

  @override
  State<FloatingActionButtonScreen> createState() => _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState extends State<FloatingActionButtonScreen> {
  // The FAB's foregroundColor, backgroundColor, and shape
  static const List<(Color?, Color? background, ShapeBorder?)> customizations = <(Color?, Color?, ShapeBorder?)>[
    (null, null, null), // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, CircleBorder()),
  ];
  int index = 0; // Selects the customization.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Buttons'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            FloatingActionButton.small(
              onPressed: () {
                Message.showMessage(context, 'small FAB pressed');
              },
              heroTag: 'small',
              child: const Icon(Icons.directions_car),
            ),
            const SizedBox(height: 20),
            FloatingActionButton.large(
              onPressed: () {
                Message.showMessage(context, 'large FAB pressed');
              },
              heroTag: 'large',
              child: const Icon(Icons.airplanemode_active),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = (index + 1) % customizations.length;
          });
        },
        foregroundColor: customizations[index].$1,
        backgroundColor: customizations[index].$2,
        shape: customizations[index].$3,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
