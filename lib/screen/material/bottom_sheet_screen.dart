import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  String _selectedOption = 'Option 1';

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  // Perform some action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Get link'),
                onTap: () {
                  // Perform some action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit name'),
                onTap: () {
                  // Perform some action
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete collection'),
                onTap: () {
                  // Perform some action
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Persistent Bottom Sheet',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDraggableBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 1.0,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.white,
              child: ListView.builder(
                controller: scrollController,
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Show the bottom sheet using a floating action button.',
                style: TextStyle(fontSize: 22),
              ),
            ),
            const Text(
              'Choose an option:',
              style: TextStyle(fontSize: 18),
            ),
            ListTile(
              title: const Text('Set modal bottom sheet'),
              leading: Radio<String>(
                value: 'Option 1',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Set persistent bottom sheet'),
              leading: Radio<String>(
                value: 'Option 2',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Set scrollable bottom sheet'),
              leading: Radio<String>(
                value: 'Option 3',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              if (_selectedOption == 'Option 1') {
                _showModalBottomSheet(context);
              } else if (_selectedOption == 'Option 2') {
                _showPersistentBottomSheet(context);
              } else {
                _showDraggableBottomSheet(context);
              }
            },
            child: const Icon(
              Icons.keyboard_arrow_up,
              size: 45,
            ),
          );
        },
      ),
    );
  }
}
