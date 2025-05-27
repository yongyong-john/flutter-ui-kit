import 'package:flutter/cupertino.dart';

class CupertinoListTileWidget extends StatelessWidget {
  final String title;
  final Widget screen;

  const CupertinoListTileWidget({
    super.key,
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }
}
