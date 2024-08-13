import 'package:flutter/material.dart';

class SearchAnchorScreen extends StatefulWidget {
  const SearchAnchorScreen({super.key});

  @override
  State<SearchAnchorScreen> createState() => _SearchAnchorScreenState();
}

class _SearchAnchorScreenState extends State<SearchAnchorScreen> {
  final SearchController controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Anchor'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SearchAnchor(
              searchController: controller,
              builder: (BuildContext context, SearchController controller) {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    controller.openView();
                  },
                );
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
          Center(
            child: controller.text.isEmpty
                ? const Text('No item selected')
                : Text('Selected item: ${controller.value.text}'),
          ),
        ],
      ),
    );
  }
}
