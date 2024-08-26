import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widget/item_silver_list_widget.dart';

class PinnedHeaderSilverScreen extends StatefulWidget {
  const PinnedHeaderSilverScreen({super.key});

  @override
  State<PinnedHeaderSilverScreen> createState() => _PinnedHeaderSilverScreenState();
}

class _PinnedHeaderSilverScreenState extends State<PinnedHeaderSilverScreen> {
  int count = 0;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Widget header = Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.all(4),
      child: Material(
        color: colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 7,
            color: colorScheme.outline,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Text(
            count.isOdd ? 'Alternative Title\nWith Two Lines' : 'PinnedHeaderSliver',
            style: theme.textTheme.headlineMedium!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              PinnedHeaderSliver(child: header),
              const ItemList(
                itemCount: 25,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
