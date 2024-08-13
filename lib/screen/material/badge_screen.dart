import 'package:flutter/material.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({super.key});

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  int _badgeCount = 0;

  void _incrementBadge() {
    setState(() {
      _badgeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Basic badge',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Badge(
                      label: Text('Your label'),
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.receipt),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    icon: Badge.count(
                      count: 9999,
                      child: const Icon(Icons.notifications),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Press the button to increment the badge count $_badgeCount',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Text(
                  'This is a UI created by adding a Positioned widget to FAB, rather than using the Badge package.'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Badge(
                      child: Icon(Icons.book),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Badge(
                      label: Text('$_badgeCount'),
                      child: const Icon(Icons.star),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: _incrementBadge,
            child: const Icon(Icons.add),
          ),
          if (_badgeCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                child: Center(
                  child: Text(
                    '$_badgeCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
