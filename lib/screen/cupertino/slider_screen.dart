import 'package:flutter/cupertino.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _currentSliderValue = 0.0;
  String? _sliderStatus;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Slider'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Display the current slider value.
              Text((_currentSliderValue).toStringAsFixed(0)),
              CupertinoSlider(
                key: const Key('slider'),
                value: _currentSliderValue,
                // This allows the slider to jump between divisions.
                // If null, the slide movement is continuous.
                // divisions: 50,
                // The maximum slider value
                max: 100,
                activeColor: CupertinoColors.systemPurple,
                thumbColor: CupertinoColors.systemPurple,
                // This is called when sliding is started.
                onChangeStart: (double value) {
                  setState(() {
                    _sliderStatus = 'Sliding';
                  });
                },
                // This is called when sliding has ended.
                onChangeEnd: (double value) {
                  setState(() {
                    _sliderStatus = 'Finished sliding';
                  });
                },
                // This is called when slider value is changed.
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Text(
                _sliderStatus ?? '',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
