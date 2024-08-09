import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  int _indexSeparated = 0;
  int _indexBuilder = 0;
  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1516116216624-53e697fedbea?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1532009324734-20a7a5813719?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1524429656589-6633a470097c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1518780664697-55e3ad937233?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1523413651479-597eb2da0ad6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1528825871115-3581a5387919?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Vertical direction of ListView using builder.'
              '\n'
              'The ${_indexBuilder + 1}th image out of ${imageUrls.length} total images.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    final index =
                        (notification.metrics.pixels / (notification.metrics.maxScrollExtent / (imageUrls.length - 1)))
                            .round();
                    if (index != _indexBuilder) {
                      setState(() {
                        _indexBuilder = index;
                      });
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Horizontal direction of ListView using separated.'
              '\n'
              'The ${_indexSeparated + 1}th image out of ${imageUrls.length} total images.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    final index =
                        (notification.metrics.pixels / (notification.metrics.maxScrollExtent / (imageUrls.length - 1)))
                            .round();
                    if (index != _indexSeparated) {
                      setState(() {
                        _indexSeparated = index;
                      });
                    }
                  }
                  return true;
                },
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 50);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          const SizedBox(
                            width: 20,
                          ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2 - 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        if (index == imageUrls.length - 1)
                          const SizedBox(
                            width: 20,
                          ),
                      ],
                    );
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
