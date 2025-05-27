import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/description/material_description.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  final TextEditingController _fontSizeController = TextEditingController();
  double _fontSize = 14;
  FontWeight _fontWeight = FontWeight.normal;
  FontStyle _fontStyle = FontStyle.normal;
  TextDecoration _textDecoration = TextDecoration.none;
  bool _useItalic = false;

  final List<FontWeight> _weight = [
    FontWeight.w100,
    FontWeight.w300,
    FontWeight.normal, // This is w400
    FontWeight.w500,
    FontWeight.bold, // This is w700
    FontWeight.w900,
  ];

  final List<TextDecoration> _decoration = [
    TextDecoration.none,
    TextDecoration.underline,
    TextDecoration.lineThrough,
    TextDecoration.overline,
  ];

  @override
  void initState() {
    super.initState();
    _fontSizeController.text = _fontSize.toString().split('.')[0];
  }

  @override
  void dispose() {
    _fontSizeController.dispose();
    super.dispose();
  }

  void _updateFontSize() {
    setState(() {
      _fontSize = double.tryParse(_fontSizeController.text) ?? _fontSize;
    });
  }

  String _getFontWeightText(FontWeight fontWeight) {
    if (fontWeight == FontWeight.normal) return 'normal (w400)';
    if (fontWeight == FontWeight.bold) return 'bold (w700)';
    return fontWeight.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Text(
                      textDescription,
                      style: TextStyle(
                        fontSize: _fontSize,
                        fontWeight: _fontWeight,
                        fontStyle: _fontStyle,
                        decoration: _textDecoration,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'fontSize:',
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
                      controller: _fontSizeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        isDense: true, // Reduces the height of the TextField
                        contentPadding: EdgeInsets.all(8), // Adjust padding as needed
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _updateFontSize(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'fontStyle:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Checkbox(
                    value: _useItalic,
                    onChanged: (bool? value) {
                      setState(() {
                        _useItalic = value!;
                        if (_useItalic) {
                          _fontStyle = FontStyle.italic;
                        } else {
                          _fontStyle = FontStyle.normal;
                        }
                      });
                    },
                  ),
                  Text(
                    _useItalic ? 'Use italic style ture' : 'Use italic style false',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'fontWeight:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<FontWeight>(
                    value: _fontWeight,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (FontWeight? newValue) {
                      setState(() {
                        _fontWeight = newValue!;
                      });
                    },
                    items: _weight.map<DropdownMenuItem<FontWeight>>((FontWeight font) {
                      return DropdownMenuItem<FontWeight>(
                        value: font,
                        child: Text(_getFontWeightText(font)),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'decoration:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<TextDecoration>(
                    value: _textDecoration,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (TextDecoration? newValue) {
                      setState(() {
                        _textDecoration = newValue!;
                      });
                    },
                    items: _decoration.map<DropdownMenuItem<TextDecoration>>((TextDecoration decoration) {
                      return DropdownMenuItem<TextDecoration>(
                        value: decoration,
                        child: Text(decoration.toString()),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
