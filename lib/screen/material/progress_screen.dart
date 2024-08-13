import 'package:flutter/material.dart';

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Circular progress indicator',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const CircularProgressIndicator(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Linear progress indicator',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 100,
            child: LinearProgressIndicator(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(),
          ),
          const Text(
            'Refresh indicator',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('When you scroll down, the Refresh indicator will work.'),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
