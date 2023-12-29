import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dynamic_form/src/index.dart';
import 'package:dynamic_form/src/model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const jsonString = '''
      {
        "fields": [
          {"type": "text", "label": "Name", "id": "name"},
          {"type": "email", "label": "Email", "id": "email"},
          {"type": "password", "label": "Password", "id": "password"},
          {"type": "date", "label": "Birthday", "id": "birthdate"}
        ]
      }
    ''';
    final List<FormFieldModel> formFields =
        (jsonDecode(jsonString)['fields'] as List)
            .map((data) => FormFieldModel.fromJson(data))
            .toList();

    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text("Dynamic Form"),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SingleChildScrollView(
          child: DynamicForm(
        formFields: formFields,
        onSubmit: (value) {
          dev.inspect(value);
        },
      )),
    );
  }
}
