import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

enum Groceries { pickles, tomato, lettuce }

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  Groceries? _groceryItem = Groceries.pickles;
  bool _isLinkedRadioSelected = false;
  bool _isLabeledRadioSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile<SingingCharacter>(
            title: const Text('Lafayette'),
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<SingingCharacter>(
            title: const Text('Thomas Jefferson'),
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          const Divider(),
          RadioListTile<Groceries>(
            value: Groceries.pickles,
            groupValue: _groceryItem,
            onChanged: (Groceries? value) {
              setState(() {
                _groceryItem = value;
              });
            },
            title: const Text('Pickles'),
            subtitle: const Text('Supporting text'),
          ),
          RadioListTile<Groceries>(
            value: Groceries.tomato,
            groupValue: _groceryItem,
            onChanged: (Groceries? value) {
              setState(() {
                _groceryItem = value;
              });
            },
            title: const Text('Tomato'),
            subtitle: const Text(
                'Longer supporting text to demonstrate how the text wraps and the radio is centered vertically with the text.'),
          ),
          RadioListTile<Groceries>(
            value: Groceries.lettuce,
            groupValue: _groceryItem,
            onChanged: (Groceries? value) {
              setState(() {
                _groceryItem = value;
              });
            },
            title: const Text('Lettuce'),
            subtitle: const Text(
                "Longer supporting text to demonstrate how the text wraps and how setting 'RadioListTile.isThreeLine = true' aligns the radio to the top vertically with the text."),
            isThreeLine: true,
          ),
          const Divider(),
          LinkedLabelRadio(
            label: 'First tappable label text',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: true,
            groupValue: _isLinkedRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isLinkedRadioSelected = newValue;
              });
            },
          ),
          LinkedLabelRadio(
            label: 'Second tappable label text',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: false,
            groupValue: _isLinkedRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isLinkedRadioSelected = newValue;
              });
            },
          ),
          const Divider(),
          LabeledRadio(
            label: 'This is the first label text',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: true,
            groupValue: _isLabeledRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isLabeledRadioSelected = newValue;
              });
            },
          ),
          LabeledRadio(
            label: 'This is the second label text',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: false,
            groupValue: _isLabeledRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isLabeledRadioSelected = newValue;
              });
            },
          ),
        ],
      )),
    );
  }
}

class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Radio<bool>(
            groupValue: groupValue,
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
