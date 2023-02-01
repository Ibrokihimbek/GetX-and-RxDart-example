import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_dart_getx_example/screens/company_rx_dart/company_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'RxDart and GetX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CompanyInfoRxDartPage());
  }
}
