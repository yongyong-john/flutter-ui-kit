import 'package:flutter/cupertino.dart';

class ListSectionScreen extends StatefulWidget {
  const ListSectionScreen({super.key});

  @override
  State<ListSectionScreen> createState() => _ListSectionScreenState();
}

class _ListSectionScreenState extends State<ListSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino List Section'),
      ),
      child: SafeArea(
        child: CupertinoListSection.insetGrouped(
          header: const Text('My Reminders'),
          children: <CupertinoListTile>[
            CupertinoListTile.notched(
              title: const Text('Open pull request'),
              leading: Container(
                width: double.infinity,
                height: double.infinity,
                color: CupertinoColors.activeGreen,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) {
                    return const _SecondPage(text: 'Open pull request');
                  },
                ),
              ),
            ),
            CupertinoListTile.notched(
              title: const Text('Push to master'),
              leading: Container(
                width: double.infinity,
                height: double.infinity,
                color: CupertinoColors.systemRed,
              ),
              additionalInfo: const Text('Not available'),
            ),
            CupertinoListTile.notched(
              title: const Text('View last commit'),
              leading: Container(
                width: double.infinity,
                height: double.infinity,
                color: CupertinoColors.activeOrange,
              ),
              additionalInfo: const Text('12 days ago'),
              trailing: const CupertinoListTileChevron(),
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) {
                    return const _SecondPage(text: 'Last commit');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Second page'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: CupertinoPageScaffold(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
