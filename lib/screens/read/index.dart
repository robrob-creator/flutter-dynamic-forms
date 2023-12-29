import 'dart:convert';
import 'dart:developer';

import 'package:dynamic_form/src/model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late Future<FormModel> formFuture;
  late List<Map<String, dynamic>> firebaseData;

  @override
  void initState() {
    super.initState();
    formFuture = getForm();
    firebaseData = []; // Initialize the list
  }

  Future<FormModel> getForm() async {
    String jsonString =
        await rootBundle.loadString('assets/json/isaac_config.json');
    final FormModel form = FormModel.fromJson(jsonDecode(jsonString));
    DatabaseReference dataList = FirebaseDatabase.instance.ref(form.formModel);
    dataList.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      inspect(data);
      if (data != null && data is Map) {
        // Assuming the data is a Map, update the firebaseData variable
        setState(() {
          firebaseData = data.entries
              .map<Map<String, dynamic>>(
                (entry) => Map<String, dynamic>.from(entry.value),
              )
              .toList();
        });
      }
    });
    return form;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: formFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Dynamic Form"),
            ),
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Dynamic Form"),
            ),
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data?.formTitle ?? "Dynamic Form"),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    NeumorphicButton(
                      child: const Text("Add"),
                      onPressed: () {
                        context.push('/create');
                      },
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12),
                            ),
                            depth: 8,
                            lightSource: LightSource.topLeft,
                            color: Colors.white,
                          ),
                          child: DataTable(
                            columns: snapshot.data?.fields?.map(
                                  (e) {
                                    return DataColumn(
                                      label: Text(e.fieldLabel ?? "Label"),
                                    );
                                  },
                                )?.toList() ??
                                [],
                            rows: firebaseData.map<DataRow>(
                              (rowData) {
                                return DataRow(
                                  cells: rowData.entries
                                      .map<DataCell>(
                                        (entry) => DataCell(
                                          Text(entry.value.toString()),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ).toList(),
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
      },
    );
  }
}
