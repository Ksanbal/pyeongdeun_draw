import 'package:flutter/material.dart';
import 'package:pyeongdeun_draw/src/uploadCsv/upload.view.dart';

void main() {
  runApp(const MyApp());
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
