import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dynamic_form/routes.dart';
import 'package:dynamic_form/src/index.dart';
import 'package:dynamic_form/src/model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:objectid/objectid.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: Routing.routerConfig);
  }
}
