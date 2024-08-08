import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  late TextEditingController _controllerForDialog;
  late TextEditingController _controllerForCount;

  @override
  void initState() {
    super.initState();
    _controllerForDialog = TextEditingController();
    _controllerForCount = TextEditingController();
  }

  @override
  void dispose() {
    _controllerForDialog.dispose();
    _controllerForCount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Hint Text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerForCount,
                  onChanged: (value) {
                    setState(() {
                      _controllerForCount.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.send),
                    hintText: 'Hint Text',
                    helperText: 'Helper Text',
                    counterText: '${_controllerForCount.text.length} characters',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerForDialog,
                  onSubmitted: (String value) async {
                    await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Thanks!'),
                          content: Text('You typed "$value", which has length ${value.characters.length}.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.clear),
                    labelText: 'Filled',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    filled: true,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.clear),
                    labelText: 'Outlined',
                    hintText: 'hint text',
                    helperText: 'supporting text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Hint Text',
                    errorText: 'Error Text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefix: Text('Prefix'),
                    suffix: Text('Suffix'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                      if (states.contains(WidgetState.focused)) {
                        return Colors.green;
                      }
                      return Colors.grey;
                    }),
                  ),
                ),
              ),
              Theme(
                data: themeData.copyWith(
                  inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
                    prefixIconColor: WidgetStateColor.resolveWith(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.error)) {
                          return Colors.red;
                        }
                        if (states.contains(WidgetState.focused)) {
                          return Colors.blue;
                        }
                        return Colors.grey;
                      },
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      initialValue: 'example.com',
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.web),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? text) {
                        if (text?.endsWith('.com') ?? false) {
                          return null;
                        }
                        return 'No .com tld';
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
