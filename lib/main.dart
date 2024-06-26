import 'package:absensi_rohis/app/DPKMainPage.dart';
import 'package:absensi_rohis/app/daftarHadirPage.dart';
import 'package:absensi_rohis/app/listKelasPage.dart';
import 'package:absensi_rohis/app/siswaMainPage.dart';
import 'package:absensi_rohis/app/splashPage.dart';
import 'package:absensi_rohis/auth/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DaftarHadirPage(),
    );
  }
}
