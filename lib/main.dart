import 'package:flutter/material.dart';
import 'package:pyeongdeun_draw/src/setting/setting.view.dart';
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
      title: '평든뽑기',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home: UploadCsvView(),
      home: SettingView(participateList: [
        '김산발',
        '김현균',
        '오래가는바나나',
        '김산발',
        '김현균',
        '오래가는바나나',
        '김산발',
        '김현균',
        '오래가는바나나',
        '김산발',
        '김현균',
        '오래가는바나나',
        '김산발',
        '김현균',
        '오래가는바나나',
        '김산발',
        '김현균',
        '오래가는바나나',
        '김산발',
        '김현균',
        '오래가는바나나'
      ]),
    );
  }
}
