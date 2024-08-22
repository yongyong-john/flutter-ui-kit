import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final DecorationTween _tween = DecorationTween(
  begin: BoxDecoration(
    color: CupertinoColors.systemYellow,
    boxShadow: const <BoxShadow>[],
    borderRadius: BorderRadius.circular(20.0),
  ),
  end: BoxDecoration(
    color: CupertinoColors.systemYellow,
    boxShadow: CupertinoContextMenu.kEndBoxShadow,
    borderRadius: BorderRadius.circular(20.0),
  ),
);

class ContextMenuScreen extends StatefulWidget {
  const ContextMenuScreen({super.key});

  @override
  State<ContextMenuScreen> createState() => _ContextMenuScreenState();
}

class _ContextMenuScreenState extends State<ContextMenuScreen> {
  static Animation<Decoration> _boxDecorationAnimation(Animation<double> animation) {
    return _tween.animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(
          0.0,
          CupertinoContextMenu.animationOpensAt,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Context Menu'),
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
            const Text('Please press the logo for 2 seconds'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CupertinoContextMenu.builder(
                actions: <Widget>[
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                    child: const Text('Copy'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    trailingIcon: CupertinoIcons.share,
                    child: const Text('Share'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    trailingIcon: CupertinoIcons.heart,
                    child: const Text('Favorite'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDestructiveAction: true,
                    trailingIcon: CupertinoIcons.delete,
                    child: const Text('Delete'),
                  ),
                ],
                builder: (BuildContext context, Animation<double> animation) {
                  final Animation<Decoration> boxDecorationAnimation = _boxDecorationAnimation(animation);

                  return Container(
                    decoration:
                        animation.value < CupertinoContextMenu.animationOpensAt ? boxDecorationAnimation.value : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemYellow,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const FlutterLogo(size: 500.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
