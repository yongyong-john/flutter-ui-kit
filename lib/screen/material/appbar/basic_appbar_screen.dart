import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/description/material_description.dart';

class BasicAppBarScreen extends StatefulWidget {
  const BasicAppBarScreen({super.key});

  @override
  State<BasicAppBarScreen> createState() => _BasicAppBarScreenState();
}

class _BasicAppBarScreenState extends State<BasicAppBarScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNodeAppBarTitle = FocusNode();
  final FocusNode _focusNodeToolBarHeight = FocusNode();
  bool _centerTitle = true;
  bool _backLeading = false;
  double toolBarHeight = kToolbarHeight;
  Color? _foregroundColor;
  Color? _backgroundColor;
  final List<Color> _colors = [
    Colors.white,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.black,
  ];

  @override
  void initState() {
    super.initState();
    _controller.text = 'AppBar';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _foregroundColor = MediaQuery.of(context).platformBrightness == Brightness.light ? Colors.black : Colors.white;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNodeAppBarTitle.dispose();
    _focusNodeToolBarHeight.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    _focusNodeAppBarTitle.unfocus();
    _focusNodeToolBarHeight.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.text),
        centerTitle: _centerTitle,
        leading: _backLeading ? Container() : null,
        foregroundColor: _foregroundColor,
        backgroundColor: _backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: toolBarHeight,
      ),
      body: GestureDetector(
        onTap: _dismissKeyboard,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              editAppBarTitle(),
              const SizedBox(
                height: 16,
              ),
              setToolBarHeight(),
              useCenterTitle(),
              useLeading(),
              editForegroundColor(),
              editBackgroundColor(),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        appbarDescription,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row editBackgroundColor() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'backgroundColor is',
            style: TextStyle(fontSize: 20),
          ),
        ),
        DropdownButton<Color>(
          value: _backgroundColor,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (Color? newValue) {
            setState(() {
              _backgroundColor = newValue!;
            });
          },
          items: _colors.map<DropdownMenuItem<Color>>((Color color) {
            return DropdownMenuItem<Color>(
              value: color,
              child: Container(
                width: 100,
                height: 20,
                color: color,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Row editForegroundColor() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'foregroundColor is',
            style: TextStyle(fontSize: 20),
          ),
        ),
        DropdownButton<Color>(
          value: _foregroundColor,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (Color? newValue) {
            setState(() {
              _foregroundColor = newValue!;
            });
          },
          items: _colors.map<DropdownMenuItem<Color>>((Color color) {
            return DropdownMenuItem<Color>(
              value: color,
              child: Container(
                width: 100,
                height: 20,
                color: color,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Row useLeading() {
    return Row(
      children: [
        Checkbox(
          value: _backLeading,
          onChanged: (bool? value) {
            setState(() {
              _backLeading = value!;
            });
          },
        ),
        Text(
          _backLeading ? 'leading set Container()' : 'leading set null',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Row useCenterTitle() {
    return Row(
      children: [
        Checkbox(
          value: _centerTitle,
          onChanged: (bool? value) {
            setState(() {
              _centerTitle = value!;
            });
          },
        ),
        Text(
          _centerTitle ? 'centerTitle set true' : 'centerTitle set false',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  TextField setToolBarHeight() {
    return TextField(
      keyboardType: TextInputType.number,
      focusNode: _focusNodeToolBarHeight,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Set toolBarHeight (default: 56.0)',
      ),
      onSubmitted: (value) {
        setState(() {
          toolBarHeight = double.parse(value);
        });
      },
    );
  }

  TextField editAppBarTitle() {
    return TextField(
      controller: _controller,
      focusNode: _focusNodeAppBarTitle,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Edit AppBar title',
      ),
      onSubmitted: (value) {
        setState(() {
          _controller.text = value;
        });
      },
    );
  }
}
