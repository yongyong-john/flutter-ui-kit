import 'package:flutter/material.dart';

class ExpansionTileScreen extends StatefulWidget {
  const ExpansionTileScreen({super.key});

  @override
  State<ExpansionTileScreen> createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
  bool _customTileExpanded = false;
  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionTile'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const ExpansionTile(
            title: Text('ExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              ListTile(title: Text('This is tile number 1')),
            ],
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2\nThis is tile number 2\nThis is tile number 2\n')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded = expanded;
              });
            },
          ),
          const ExpansionTile(
            title: Text('ExpansionTile 3'),
            subtitle: Text('Leading expansion arrow icon'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(
                  title: Text(
                      'This is tile number 3\nThis is tile number 3\nThis is tile number 3\nThis is tile number 3\nThis is tile number 3\n')),
            ],
          ),
          ExpansionTile(
            controller: controller,
            title: const Text('ExpansionTile with explicit controller.'),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(24),
                child: const Text('ExpansionTile Contents'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text('Expand/Collapse the Tile Above'),
            onPressed: () {
              if (controller.isExpanded) {
                controller.collapse();
              } else {
                controller.expand();
              }
            },
          ),
          const SizedBox(height: 48),
          // A controller has not been provided to the ExpansionTile because
          // the automatically created one can be retrieved via the tile's BuildContext.
          ExpansionTile(
            title: const Text('ExpansionTile with implicit controller.'),
            children: <Widget>[
              Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: const Text('Collapse This Tile'),
                      onPressed: () {
                        return ExpansionTileController.of(context).collapse();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
