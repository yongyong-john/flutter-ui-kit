import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _currentSliderValue = 20;
  double _currentSliderValue2 = 80;
  double _currentSliderPrimaryValue = 0.2;
  double _currentSliderSecondaryValue = 0.5;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Divider(),
          Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 5,
            activeColor: Colors.green,
            thumbColor: Colors.amber,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          const Divider(),
          Slider(
            value: _currentSliderValue2,
            activeColor: Colors.red,
            secondaryTrackValue: 100,
            secondaryActiveColor: Colors.red[100],
            max: 100,
            divisions: 100,
            label: _currentSliderValue2.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue2 = value;
              });
            },
          ),
          const Divider(),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 100,
            divisions: 20,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          const Divider(),
          Slider(
            value: _currentSliderPrimaryValue,
            secondaryTrackValue: _currentSliderSecondaryValue,
            label: _currentSliderPrimaryValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderPrimaryValue = value;
              });
            },
          ),
          Slider(
            value: _currentSliderSecondaryValue,
            label: _currentSliderSecondaryValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderSecondaryValue = value;
              });
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
