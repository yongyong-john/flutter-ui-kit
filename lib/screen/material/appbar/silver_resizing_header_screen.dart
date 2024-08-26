import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widget/item_silver_list_widget.dart';

class SilverResizingHeaderScreen extends StatefulWidget {
  const SilverResizingHeaderScreen({super.key});

  @override
  State<SilverResizingHeaderScreen> createState() => _SilverResizingHeaderScreenState();
}

class _SilverResizingHeaderScreenState extends State<SilverResizingHeaderScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Scrollbar(
            controller: scrollController,
            child: CustomScrollView(
              controller: scrollController,
              slivers: const <Widget>[
                SliverResizingHeader(
                  minExtentPrototype: ListHeader(
                    text: 'One',
                  ),
                  maxExtentPrototype: ListHeader(text: 'One\nTwo\nThree'),
                  child: ListHeader(
                    text: 'SliverResizingHeader\nWith Two Optional\nLines of Text',
                  ),
                ),
                ItemList(
                  itemCount: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// A widget that displays its text within a thick rounded rectangle border
class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 4),
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium!.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
