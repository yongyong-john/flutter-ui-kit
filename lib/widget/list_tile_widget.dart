import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final Widget screen;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }
}
