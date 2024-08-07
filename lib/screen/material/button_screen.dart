import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum RadioButtonMenu {
  ferrari,
  mercedes,
  redBull,
}

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool isChecked = false;
  bool _isSelected = false;
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;
  RadioButtonMenu? _buttonMenu = RadioButtonMenu.ferrari;
  int singleSelectedIndex = 0;
  List<bool> isMultiSelected = [false, false, false];

  @override
  void dispose() {
    timeDilation = 1.0;
    super.dispose();
  }

  final WidgetStateProperty<Icon?> thumbIcon = WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
      WidgetState.selected,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('Animate Slowly'),
              subtitle: const Text('timeDilation proceeds 5 times slower.'),
              value: timeDilation != 1.0,
              onChanged: (bool? value) {
                setState(() {
                  timeDilation = value! ? 5.0 : 1.0;
                });
              },
              secondary: const Icon(Icons.hourglass_empty),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Change fill color when checkbox selected',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Linked, tappable label text',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                      ),
                    ),
                  ),
                  Checkbox(
                    value: _isSelected,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isSelected = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Basic switch button',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: light0,
                    onChanged: (bool value) {
                      setState(() {
                        light0 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'thumbIcon added switch button',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    thumbIcon: thumbIcon,
                    value: light1,
                    onChanged: (bool value) {
                      setState(() {
                        light1 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'My favorite F1 team is ${capitalizeFirstLetter(_buttonMenu.toString().split('.')[1])}.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Ferrari'),
                  leading: Radio<RadioButtonMenu>(
                    value: RadioButtonMenu.ferrari,
                    groupValue: _buttonMenu,
                    onChanged: (RadioButtonMenu? value) {
                      setState(() {
                        _buttonMenu = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Mercedes'),
                  leading: Radio<RadioButtonMenu>(
                    value: RadioButtonMenu.mercedes,
                    groupValue: _buttonMenu,
                    onChanged: (RadioButtonMenu? value) {
                      setState(() {
                        _buttonMenu = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('RedBull'),
                  leading: Radio<RadioButtonMenu>(
                    value: RadioButtonMenu.redBull,
                    groupValue: _buttonMenu,
                    onChanged: (RadioButtonMenu? value) {
                      setState(() {
                        _buttonMenu = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Single-Select Segmented Button',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ToggleButtons(
              isSelected: List.generate(3, (index) => index == singleSelectedIndex),
              onPressed: (int index) {
                setState(() {
                  singleSelectedIndex = index;
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Option 1'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Option 2'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Option 3'),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Multi-Select Segmented Button',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ToggleButtons(
              isSelected: isMultiSelected,
              onPressed: (int index) {
                setState(() {
                  isMultiSelected[index] = !isMultiSelected[index];
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Option 1'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Option 2'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Option 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
