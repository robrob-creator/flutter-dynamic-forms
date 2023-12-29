import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dynamic_form/src/index.dart';
import 'package:dynamic_form/src/model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:objectid/objectid.dart';
import 'package:firebase_database/firebase_database.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

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
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getId() {
      String id = ObjectId().toString();
      return id;
    }

    Future<FormModel> getForm() async {
      String jsonString =
          await rootBundle.loadString('assets/json/isaac_config.json');
      final FormModel form = FormModel.fromJson(jsonDecode(jsonString));
      dev.inspect(form);
      return form;
    }

    return FutureBuilder<FormModel>(
        future: getForm(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                appBar: NeumorphicAppBar(
                  title: const Text("Dynamic Form"),
                ),
                backgroundColor: NeumorphicTheme.baseColor(context),
                body: const Center(
                  child: CircularProgressIndicator(),
                ));
          } else if (snapshot.hasError) {
            return Scaffold(
                appBar: NeumorphicAppBar(
                  title: const Text("Dynamic Form"),
                ),
                backgroundColor: NeumorphicTheme.baseColor(context),
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ));
          } else {
            return Scaffold(
                appBar: NeumorphicAppBar(
                  title: Text(snapshot.data?.formTitle ?? "Dynamic Form"),
                ),
                backgroundColor: NeumorphicTheme.baseColor(context),
                body: SingleChildScrollView(
                    child: DynamicForm(
                  form: snapshot.data ?? FormModel(),
                  onSubmit: (value) async {
                    String id = getId();
                    DatabaseReference ref = FirebaseDatabase.instance
                        .ref("${snapshot.data?.formModel}/$id");
                    await ref.set(value);
                    context.pop();
                  },
                )));
          }
        });
  }
}
