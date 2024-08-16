import 'package:flutter/cupertino.dart';

class SilverRefreshControlScreen extends StatefulWidget {
  const SilverRefreshControlScreen({super.key});

  @override
  State<SilverRefreshControlScreen> createState() => _SilverRefreshControlScreenState();
}

class _SilverRefreshControlScreenState extends State<SilverRefreshControlScreen> {
  List<Color> colors = <Color>[
    CupertinoColors.systemYellow,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPink,
  ];
  List<Widget> items = <Widget>[
    Container(color: CupertinoColors.systemPink, height: 100.0),
    Container(color: CupertinoColors.systemOrange, height: 100.0),
    Container(color: CupertinoColors.systemYellow, height: 100.0),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            middle: Text('Cupertino Sliver Refresh Control'),
            largeTitle: Text('Scroll down'),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(
                const Duration(milliseconds: 1000),
              );
              setState(() {
                items.insert(
                  0,
                  Container(color: colors[items.length % 3], height: 100.0),
                );
              });
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => items[index],
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
