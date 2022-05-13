import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pyeongdeun_draw/firebase_options.dart';
import 'package:pyeongdeun_draw/src/uploadCsv/upload.view.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  FirebaseAnalytics.instance.logAppOpen();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's PYD",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'NIXGON',
      ),
      home: UploadCsvView(),
    );
  }
}
