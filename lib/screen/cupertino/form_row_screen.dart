import 'package:flutter/cupertino.dart';

class FormRowScreen extends StatefulWidget {
  const FormRowScreen({super.key});

  @override
  State<FormRowScreen> createState() => _FormRowScreenState();
}

class _FormRowScreenState extends State<FormRowScreen> {
  bool airplaneMode = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Form Row'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: SafeArea(
        child: CupertinoFormSection(
          header: const Text('Connectivity'),
          children: <Widget>[
            CupertinoFormRow(
              prefix: const PrefixWidget(
                icon: CupertinoIcons.airplane,
                title: 'Airplane Mode',
                color: CupertinoColors.systemOrange,
              ),
              child: CupertinoSwitch(
                value: airplaneMode,
                onChanged: (bool value) {
                  setState(() {
                    airplaneMode = value;
                  });
                },
              ),
            ),
            const CupertinoFormRow(
              prefix: PrefixWidget(
                icon: CupertinoIcons.wifi,
                title: 'Wi-Fi',
                color: CupertinoColors.systemBlue,
              ),
              error: Text('Home network unavailable'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Not connected'),
                  SizedBox(width: 5),
                  Icon(CupertinoIcons.forward),
                ],
              ),
            ),
            const CupertinoFormRow(
              prefix: PrefixWidget(
                icon: CupertinoIcons.bluetooth,
                title: 'Bluetooth',
                color: CupertinoColors.activeBlue,
              ),
              helper: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Headphone'),
                    Text('Connected'),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('On'),
                  SizedBox(width: 5),
                  Icon(CupertinoIcons.forward),
                ],
              ),
            ),
            const CupertinoFormRow(
              prefix: PrefixWidget(
                icon: CupertinoIcons.bluetooth,
                title: 'Mobile Data',
                color: CupertinoColors.systemGreen,
              ),
              child: Icon(CupertinoIcons.forward),
            ),
          ],
        ),
      ),
    );
  }
}

class PrefixWidget extends StatelessWidget {
  const PrefixWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(icon, color: CupertinoColors.white),
        ),
        const SizedBox(width: 15),
        Text(title)
      ],
    );
  }
}
