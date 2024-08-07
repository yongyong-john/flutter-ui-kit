import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DividerScreen extends StatefulWidget {
  const DividerScreen({super.key});

  @override
  State<DividerScreen> createState() => _DividerScreenState();
}

class _DividerScreenState extends State<DividerScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _thicknessController = TextEditingController();
  final TextEditingController _indentController = TextEditingController();
  final TextEditingController _endIndentController = TextEditingController();

  double _height = 10;
  double _thickness = 1;
  double _indent = 0;
  double _endIndent = 0;

  @override
  void initState() {
    super.initState();
    _heightController.text = _height.toString();
    _thicknessController.text = _thickness.toString();
    _indentController.text = _indent.toString();
    _endIndentController.text = _endIndent.toString();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _thicknessController.dispose();
    _indentController.dispose();
    _endIndentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Divider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                'VerticalDivider',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ColoredBox(
                      color: Colors.red,
                      child: Center(
                        child: Text('left'),
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: ColoredBox(
                      color: Colors.amber,
                      child: Center(
                        child: Text('middle'),
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: ColoredBox(
                      color: Colors.green,
                      child: Center(
                        child: Text('right'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                'Divider',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            const Expanded(
              child: ColoredBox(
                color: Colors.amber,
                child: Center(
                  child: Text('Above'),
                ),
              ),
            ),
            Divider(
              height: _height,
              thickness: _thickness,
              indent: _indent,
              endIndent: _endIndent,
              color: Colors.black,
            ),
            Expanded(
              child: ColoredBox(
                color: Theme.of(context).colorScheme.primary,
                child: const Center(
                  child: Text('Below'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'height:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 50, // Adjust the width as needed
                              child: TextField(
                                controller: _heightController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  isDense: true, // Reduces the height of the TextField
                                  contentPadding: EdgeInsets.all(8), // Adjust padding as needed
                                  border: OutlineInputBorder(),
                                ),
                                onSubmitted: (_) => {
                                  setState(() {
                                    _height = double.tryParse(_heightController.text) ?? _height;
                                  })
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'thickness:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 50, // Adjust the width as needed
                              child: TextField(
                                controller: _thicknessController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  isDense: true, // Reduces the height of the TextField
                                  contentPadding: EdgeInsets.all(8), // Adjust padding as needed
                                  border: OutlineInputBorder(),
                                ),
                                onSubmitted: (_) => {
                                  setState(() {
                                    _thickness = double.tryParse(_thicknessController.text) ?? _thickness;
                                  })
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'indent:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 50, // Adjust the width as needed
                              child: TextField(
                                controller: _indentController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  isDense: true, // Reduces the height of the TextField
                                  contentPadding: EdgeInsets.all(8), // Adjust padding as needed
                                  border: OutlineInputBorder(),
                                ),
                                onSubmitted: (_) => {
                                  setState(() {
                                    _indent = double.tryParse(_indentController.text) ?? _indent;
                                  })
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'endIndent:',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 50, // Adjust the width as needed
                              child: TextField(
                                controller: _endIndentController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                decoration: const InputDecoration(
                                  isDense: true, // Reduces the height of the TextField
                                  contentPadding: EdgeInsets.all(8), // Adjust padding as needed
                                  border: OutlineInputBorder(),
                                ),
                                onSubmitted: (_) => {
                                  setState(() {
                                    _endIndent = double.tryParse(_endIndentController.text) ?? _endIndent;
                                  })
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
