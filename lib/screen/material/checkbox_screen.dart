import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool? isCheckedRow = true;
  bool _isChecked = false;
  bool _isSelected = false;
  bool _isLabelSelected = false;
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox'),
        centerTitle: true,
      ),
      body: Center(
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Fill color change',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Tristate checkbox',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Checkbox(
                    tristate: true,
                    value: isCheckedRow,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRow = value;
                      });
                    },
                  ),
                  Checkbox(
                    isError: true,
                    tristate: true,
                    value: isCheckedRow,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedRow = value;
                      });
                    },
                  ),
                  Checkbox(
                    isError: true,
                    tristate: true,
                    value: isCheckedRow,
                    onChanged: null,
                  ),
                ],
              ),
            ),
            LabeledCheckbox(
              label: 'This is the label text',
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              value: _isLabelSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _isLabelSelected = newValue;
                });
              },
            ),
            const Divider(height: 0),
            CheckboxListTile(
              value: checkboxValue1,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue1 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text('Supporting text'),
            ),
            const Divider(height: 0),
            CheckboxListTile(
              value: checkboxValue2,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue2 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                  'Longer supporting text to demonstrate how the text wraps and the checkbox is centered vertically with the text.'),
            ),
            const Divider(height: 0),
            CheckboxListTile(
              value: checkboxValue3,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue3 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                  "Longer supporting text to demonstrate how the text wraps and how setting 'CheckboxListTile.isThreeLine = true' aligns the checkbox to the top vertically with the text."),
              isThreeLine: true,
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
