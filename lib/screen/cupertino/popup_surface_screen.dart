import 'package:flutter/cupertino.dart';

class PopupSurfaceScreen extends StatefulWidget {
  const PopupSurfaceScreen({super.key});

  @override
  State<PopupSurfaceScreen> createState() => _PopupSurfaceScreenState();
}

class _PopupSurfaceScreenState extends State<PopupSurfaceScreen> {
  bool _shouldPaintSurface = true;

  void _showPopupSurface(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPopupSurface(
          isSurfacePainted: _shouldPaintSurface,
          child: Container(
            height: 240,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: _shouldPaintSurface
                        ? null
                        : BoxDecoration(
                            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                    child: const Text(
                      'This is a popup surface.',
                      style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: _shouldPaintSurface ? null : CupertinoTheme.of(context).scaffoldBackgroundColor,
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: CupertinoColors.systemBlue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Popup Surface'),
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
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Paint surface'),
                const SizedBox(width: 16.0),
                CupertinoSwitch(
                  value: _shouldPaintSurface,
                  onChanged: (bool value) => setState(() => _shouldPaintSurface = value),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: () => _showPopupSurface(context),
              child: const Text('Show popup'),
            ),
          ],
        ),
      ),
    );
  }
}
